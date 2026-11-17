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

// Configuração para nuvem via Variáveis de Ambiente (com fallback para local se precisar)
$host = getenv('DB_HOST') ?: '127.0.0.1';
$user = getenv('DB_USER') ?: 'root';
$password = getenv('DB_PASS') ?: '';
$name_db = getenv('DB_NAME') ?: 'insetos_db';
$port = getenv('DB_PORT') ?: '3306';

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$name_db;charset=utf8mb4", $user, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);

    $dadosRecebidos = json_decode(file_get_contents('php://input'), true);
    $email = trim($dadosRecebidos['email'] ?? '');
    $senha = trim($dadosRecebidos['senha'] ?? '');

    if (empty($email) || empty($senha)) {
        http_response_code(400);
        echo json_encode(["erro" => "Preencha todos os campos."], JSON_UNESCAPED_UNICODE);
        exit();
    }

    $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE email_usuario = :email LIMIT 1");
    $stmt->execute([':email' => $email]);
    $usuario = $stmt->fetch();

    if ($usuario && password_verify($senha, $usuario['senha_usuario'])) {
        echo json_encode(["sucesso" => true], JSON_UNESCAPED_UNICODE);
    } else {
        http_response_code(401);
        echo json_encode(["erro" => "E-mail ou senha incorretos."], JSON_UNESCAPED_UNICODE);
    }

} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode(["erro" => "Erro no servidor.", "detalhes" => $e->getMessage()], JSON_UNESCAPED_UNICODE);
}