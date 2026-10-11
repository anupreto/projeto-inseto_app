<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
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
    $pdo = new PDO("mysql:host=$host;dbname=$name_db;charset=utf8", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $limite = 20;
    $pagina = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
    $inicio = ($pagina - 1) * $limite;
    $busca = isset($_GET['search']) ? trim($_GET['search']) : '';
    
    $whereClause = "";
    $params = [];

    if (!empty($busca)) {
        $whereClause = "WHERE nome_insetos LIKE :busca OR nc_insetos LIKE :busca";
        $params[':busca'] = "%$busca%";
    }

    $sqlTotal = "SELECT COUNT(*) as total FROM insetos $whereClause";
    $stmtTotal = $pdo->prepare($sqlTotal);
    foreach ($params as $key => $val) {
        $stmtTotal->bindValue($key, $val, PDO::PARAM_STR);
    }
    $stmtTotal->execute();
    $totalRegistros = $stmtTotal->fetch(PDO::FETCH_ASSOC)['total'];
    $totalPaginas = max(1, ceil($totalRegistros / $limite));

    $sqlDados = "SELECT * FROM insetos $whereClause LIMIT :inicio, :limite";
    $stmtDados = $pdo->prepare($sqlDados);
    
    foreach ($params as $key => $val) {
        $stmtDados->bindValue($key, $val, PDO::PARAM_STR);
    }
    $stmtDados->bindValue(':inicio', $inicio, PDO::PARAM_INT);
    $stmtDados->bindValue(':limite', $limite, PDO::PARAM_INT);
    
    $stmtDados->execute();
    $resultados = $stmtDados->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode([
        "dados" => $resultados,
        "totalPaginas" => $totalPaginas,
        "totalRegistros" => intval($totalRegistros)
    ]);

} catch(PDOException $e) {
    http_response_code(500);
    echo json_encode(["erro" => "Erro de conexão: " . $e->getMessage()]);
}
?>