<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$host = "127.0.0.1";
$user = "root";
$password = "";
$name_db = "insetos_db";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$name_db;charset=utf8mb4", $user, $password, [
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
    
    $sqlDados = "SELECT * FROM insetos $whereClause LIMIT $inicioInt, $limiteInt";
    $stmtDados = $pdo->prepare($sqlDados);
    
    foreach ($params as $key => $val) {
        $stmtDados->bindValue($key, $val, PDO::PARAM_STR);
    }
    
    $stmtDados->execute();
    $resultados = $stmtDados->fetchAll() ?: [];
    
    echo json_encode([
        "dados" => $resultados,
        "totalPaginas" => $totalPaginas,
        "totalRegistros" => $totalRegistros,
        "paginaAtual" => $pagina
    ], JSON_UNESCAPED_UNICODE);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode([
        "erro" => "Erro no MySQL: " . $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);
}
?>