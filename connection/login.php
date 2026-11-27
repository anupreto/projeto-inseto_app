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
$debug    = true;

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

    $nomeUsuario = trim((string)($dadosRecebidos['nome_usuario'] ?? $dadosRecebidos['usuario'] ?? ''));
    $senha = trim((string)($dadosRecebidos['senha'] ?? ''));

    if ($nomeUsuario === '' || $senha === '') {
        http_response_code(400);
        echo json_encode(["erro" => "Preencha o usuário e a senha."], JSON_UNESCAPED_UNICODE);
        exit();
    }

    $stmt = $pdo->prepare(
        "SELECT id_usuario, nome_usuario, senha_usuario FROM usuarios WHERE LOWER(nome_usuario) = LOWER(:nome_usuario) LIMIT 1"
    );
    $stmt->execute([':nome_usuario' => $nomeUsuario]);
    $usuario = $stmt->fetch();

    if ($usuario && password_verify($senha, (string)$usuario['senha_usuario'])) {
        echo json_encode([
            "sucesso" => true,
            "id_usuario" => (int)$usuario['id_usuario'],
            "nome_usuario" => $usuario['nome_usuario'],
            "usuario" => $usuario['nome_usuario'],
        ], JSON_UNESCAPED_UNICODE);
    } else {
        http_response_code(401);
        echo json_encode(["erro" => "Usuário ou senha incorretos."], JSON_UNESCAPED_UNICODE);
    }
} catch (Throwable $e) {
    error_log('[login.php] ' . $e->getMessage());
    http_response_code(500);
    $resposta = ["erro" => "Erro no servidor."];
    if ($debug) {
        $resposta["detalhes"] = $e->getMessage();
    }
    echo json_encode($resposta, JSON_UNESCAPED_UNICODE);
}
