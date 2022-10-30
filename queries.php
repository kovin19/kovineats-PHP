<?php
	$cn=pg_connect("host=localhost dbname=kovineats_django user=postgres password=postgres");
    $query_platillos = pg_query($cn, "SELECT * FROM platillos;");
    $query_restaurantes = pg_query($cn, "SELECT * FROM restaurantes;");
    $query_carrito = pg_query($cn, "SELECT * FROM carrito;");
    $query_carrito_platillos = pg_query($cn, "SELECT * FROM carrito_platillos;");
    $query_carrito_ingredientes = pg_query($cn, "SELECT * FROM carrito_ingredientes;");
    $platillos = array();
    $restaurantes = array();
    while($data = pg_fetch_object($query_platillos)) {
        $platillos[] = $data;
    }
    while($data = pg_fetch_object($query_restaurantes)) {
        $restaurantes[] = $data;
    }
    $total_carrito = 0;
    // pg_free_result($platillos);
    // pg_close($cn);
?>
