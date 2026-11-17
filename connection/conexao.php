<?php
ini_set('display_errors', '0');
ini_set('log_errors', '1');
error_reporting(E_ALL);

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$host = getenv('DB_HOST') ?: 'db';
$port = getenv('DB_PORT') ?: '3306';
$name_db = getenv('DB_NAME') ?: 'insetos_db';
$user = getenv('DB_USER') ?: 'root';
$password = getenv('DB_PASS') ?: '';

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$name_db;charset=utf8mb4", $user, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);

    $limite = 20;
    $pagina = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
    $inicio = ($pagina - 1) * $limite;
    $busca = isset($_GET['search']) ? trim($_GET['search']) : '';
    
    $whereClause = "";
    $params = [];

    if (!empty($busca)) {
        $whereClause = "WHERE nome_insetos LIKE :busca1 OR nc_insetos LIKE :busca2";
        $params[':busca1'] = "%$busca%";
        $params[':busca2'] = "%$busca%";
    }

    $sqlTotal = "SELECT COUNT(*) as total FROM insetos $whereClause";
    $stmtTotal = $pdo->prepare($sqlTotal);
    $stmtTotal->execute($params);
    $rowTotal = $stmtTotal->fetch();
    $totalRegistros = $rowTotal ? intval($rowTotal['total']) : 0;
    
    $totalPaginas = max(1, ceil($totalRegistros / $limite));

    $inicioInt = (int)$inicio;
    $limiteInt = (int)$limite;
    
    $sqlDados = "SELECT * FROM insetos $whereClause LIMIT :inicio, :limite";
    $stmtDados = $pdo->prepare($sqlDados);
    
    foreach ($params as $key => $val) {
        $stmtDados->bindValue($key, $val, PDO::PARAM_STR);
    }
    $stmtDados->bindValue(':inicio', $inicioInt, PDO::PARAM_INT);
    $stmtDados->bindValue(':limite', $limiteInt, PDO::PARAM_INT);
    
    $stmtDados->execute();
    $resultados = $stmtDados->fetchAll() ?: [];
    
    echo json_encode([
        "dados" => $resultados,
        "totalPaginas" => $totalPaginas,
        "totalRegistros" => $totalRegistros,
        "paginaAtual" => $pagina
    ], JSON_UNESCAPED_UNICODE);

} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode([
        "erro" => "Erro no MySQL: " . $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);
}
