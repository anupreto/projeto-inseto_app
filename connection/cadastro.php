<?php
ini_set('display_errors', '0');
ini_set('log_errors', '1');
error_reporting(E_ALL);

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$host     = getenv('DB_HOST') ?: '127.0.0.1';
$port     = getenv('DB_PORT') ?: '3306';
$name_db  = getenv('DB_NAME') ?: 'insetos_db_app';
$user     = getenv('DB_USER') ?: 'root';
$password = getenv('DB_PASS') ?: '';

function formatarNomeUsuario(string $texto): string {
    $texto = trim(preg_replace('/\s+/', ' ', $texto) ?? $texto);
    if ($texto === '') {
        return '';
    }
    $partes = explode(' ', $texto);
    foreach ($partes as &$parte) {
        if ($parte === '') continue;
        $primeira = function_exists('mb_substr') && function_exists('mb_strtoupper')
            ? mb_strtoupper(mb_substr($parte, 0, 1, 'UTF-8'), 'UTF-8')
            : strtoupper(substr($parte, 0, 1));
        $resto = function_exists('mb_substr')
            ? mb_substr($parte, 1, null, 'UTF-8')
            : substr($parte, 1);
        $parte = $primeira . $resto;
    }
    unset($parte);
    return implode(' ', $partes);
}

try {
    $pdo = new PDO(
        "mysql:host=$host;port=$port;dbname=$name_db;charset=utf8mb4",
        $user,
        $password,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ]
    );

    $rawInput = file_get_contents('php://input');
    $dadosRecebidos = is_string($rawInput) ? (json_decode($rawInput, true) ?? []) : [];

    $usuarioBruto = trim((string)(
        $dadosRecebidos['nome_usuario']
        ?? $dadosRecebidos['usuario']
        ?? $dadosRecebidos['email']
        ?? ''
    ));
    $senha = trim((string)($dadosRecebidos['senha'] ?? ''));

    if ($usuarioBruto === '' || $senha === '') {
        http_response_code(400);
        echo json_encode(["erro" => "Preencha o usuário e a senha."], JSON_UNESCAPED_UNICODE);
        exit();
    }

    $tamanhoUsuario = function_exists('mb_strlen')
        ? mb_strlen($usuarioBruto, 'UTF-8')
        : strlen($usuarioBruto);

    if ($tamanhoUsuario < 3) {
        http_response_code(400);
        echo json_encode(["erro" => "O usuário deve ter pelo menos 3 caracteres."], JSON_UNESCAPED_UNICODE);
        exit();
    }

    if (
        strlen($senha) < 8 ||
        !preg_match('/[A-Z]/', $senha) ||
        !preg_match('/[a-z]/', $senha) ||
        !preg_match('/[0-9]/', $senha)
    ) {
        http_response_code(400);
        echo json_encode(["erro" => "A senha não cumpre os requisitos obrigatórios."], JSON_UNESCAPED_UNICODE);
        exit();
    }

    $colunas = $pdo->query("SHOW COLUMNS FROM usuarios")->fetchAll(PDO::FETCH_COLUMN);
    if (!is_array($colunas) || empty($colunas)) {
        throw new RuntimeException("Tabela 'usuarios' não encontrada ou sem colunas.");
    }

    $colunaUsuario = in_array('nome_usuario', $colunas, true)
        ? 'nome_usuario'
        : (in_array('email_usuario', $colunas, true) ? 'email_usuario' : null);

    $colunaSenha = in_array('senha_usuario', $colunas, true)
        ? 'senha_usuario'
        : (in_array('senha', $colunas, true) ? 'senha' : null);

    if (!$colunaUsuario || !$colunaSenha) {
        throw new RuntimeException(
            "Colunas esperadas não encontradas em 'usuarios'. Colunas atuais: " . implode(', ', $colunas)
        );
    }

    $valorUsuario = $colunaUsuario === 'email_usuario'
        ? strtolower($usuarioBruto)
        : formatarNomeUsuario($usuarioBruto);

    $stmtCheck = $pdo->prepare(
        "SELECT id_usuario FROM usuarios WHERE LOWER($colunaUsuario) = LOWER(:usuario) LIMIT 1"
    );
    $stmtCheck->execute([':usuario' => $valorUsuario]);
    if ($stmtCheck->fetch()) {
        http_response_code(409);
        echo json_encode(["erro" => "Este usuário já está em uso."], JSON_UNESCAPED_UNICODE);
        exit();
    }

    $senhaHash = password_hash($senha, PASSWORD_DEFAULT);

    $stmtInsert = $pdo->prepare(
        "INSERT INTO usuarios ($colunaUsuario, $colunaSenha) VALUES (:usuario, :senha)"
    );
    $stmtInsert->execute([
        ':usuario' => $valorUsuario,
        ':senha' => $senhaHash,
    ]);

    $idCriado = (int)$pdo->lastInsertId();

    echo json_encode([
        "sucesso" => true,
        "id_usuario" => $idCriado,
        "nome_usuario" => $valorUsuario,
        "usuario" => $valorUsuario,
    ], JSON_UNESCAPED_UNICODE);
} catch (Throwable $e) {
    error_log('[cadastro.php] ' . $e->getMessage());
    http_response_code(500);
    echo json_encode([
        "erro" => "Erro no servidor.",
        "detalhes" => $e->getMessage(),
    ], JSON_UNESCAPED_UNICODE);
}
