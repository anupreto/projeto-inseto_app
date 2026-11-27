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

    $retornarTodos = isset($_GET['all']) && $_GET['all'] == '1';
    $limiteParam   = isset($_GET['limit']) ? intval($_GET['limit']) : 20;
    $limite        = ($limiteParam > 0) ? min($limiteParam, 1000) : 20;
    $pagina        = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
    $inicio        = ($pagina - 1) * $limite;
    $busca         = isset($_GET['search']) ? trim($_GET['search']) : '';

    $whereClause = "";
    $params = [];

    if ($busca !== '') {
        $whereClause = "WHERE nome_insetos LIKE :busca1
                        OR nc_insetos LIKE :busca2
                        OR ordem_insetos LIKE :busca3
                        OR familia_insetos LIKE :busca4
                        OR dieta_insetos LIKE :busca5";
        $like = "%$busca%";
        $params[':busca1'] = $like;
        $params[':busca2'] = $like;
        $params[':busca3'] = $like;
        $params[':busca4'] = $like;
        $params[':busca5'] = $like;
    }

    $stmtTotal = $pdo->prepare("SELECT COUNT(*) AS total FROM insetos $whereClause");
    $stmtTotal->execute($params);
    $rowTotal = $stmtTotal->fetch();
    $totalRegistros = $rowTotal ? intval($rowTotal['total']) : 0;

    if ($retornarTodos || $limite >= 1000) {
        $sqlDados = "SELECT * FROM insetos $whereClause ORDER BY id_insetos";
        $stmtDados = $pdo->prepare($sqlDados);
        foreach ($params as $key => $val) {
            $stmtDados->bindValue($key, $val, PDO::PARAM_STR);
        }
        $stmtDados->execute();
        $resultados = $stmtDados->fetchAll() ?: [];
        $totalPaginas = 1;
        $pagina = 1;
    } else {
        $sqlDados = "SELECT * FROM insetos $whereClause ORDER BY id_insetos LIMIT :inicio, :limite";
        $stmtDados = $pdo->prepare($sqlDados);
        foreach ($params as $key => $val) {
            $stmtDados->bindValue($key, $val, PDO::PARAM_STR);
        }
        $stmtDados->bindValue(':inicio', (int)$inicio, PDO::PARAM_INT);
        $stmtDados->bindValue(':limite', (int)$limite, PDO::PARAM_INT);
        $stmtDados->execute();
        $resultados = $stmtDados->fetchAll() ?: [];
        $totalPaginas = max(1, (int)ceil($totalRegistros / $limite));
    }

    echo json_encode([
        "dados" => $resultados,
        "totalPaginas" => $totalPaginas,
        "totalRegistros" => $totalRegistros,
        "paginaAtual" => $pagina,
    ], JSON_UNESCAPED_UNICODE);
} catch (Throwable $e) {
    error_log('[conexao.php] ' . $e->getMessage());
    http_response_code(500);
    $resposta = ["erro" => "Erro ao consultar o banco de dados."];
    if ($debug) {
        $resposta["detalhes"] = $e->getMessage();
    }
    echo json_encode($resposta, JSON_UNESCAPED_UNICODE);
}
