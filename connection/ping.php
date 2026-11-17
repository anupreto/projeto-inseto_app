<?php
header("Content-Type: application/json; charset=UTF-8");
echo json_encode(["ok" => true, "php" => PHP_VERSION, "pdo_mysql" => extension_loaded('pdo_mysql')]);