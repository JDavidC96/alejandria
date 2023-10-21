<?php

//Mostrar errores
ini_set('display_errors', 1);
ini_set("log_errors", 1);
ini_set("error_log", "C:/xampp/htdocs/libreria/php_error_log");

//Requerimientos
require_once"models/connection.php";
require_once"controllers/route.controller.php";

$index = new RoutesController();
$index -> index();