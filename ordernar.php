<?php
	$cn=pg_connect("host=localhost dbname=kovineats_django user=postgres password=postgres");
    $query_carrito_platillos = pg_query($cn, "DELETE FROM carrito_platillos;");
    $query_carrito_ingredientes = pg_query($cn, "DELETE FROM carrito_ingredientes;");
    $query_carrito = pg_query($cn, "DELETE FROM carrito;");
    $newURL = "index.php?status=ordenar";
    header('Location: '.$newURL);
?>