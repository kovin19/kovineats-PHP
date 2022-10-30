<?php
	$cn=pg_connect("host=localhost dbname=kovineats_django user=postgres password=postgres");

    $platillo = $_POST["platillos"];
    $total = $_POST["total"];

    $valores = array(
        'total' => $total
    );

    // $query_carrito = pg_query("INSERT INTO carrito VALUES ($total);");
    // $carrito = 
    // $query_carrito_platillos = pg_query("INSERT INTO carrito_platillos VALUES ();");
    // var_dump($platillo, $total, $ingredientes);

    // $query_carrito = pg_insert($cn, "carrito", $valores);
    // $carrito_id = pg_fetch_array($query_carrito);

    $query_carrito = pg_query($cn,"INSERT INTO carrito(total) VALUES($total) RETURNING id;");
    $carrito = pg_fetch_object($query_carrito);

    $query_carrito_platillos = pg_query($cn, "INSERT INTO carrito_platillos(carritomodel_id, platillomodel_id) VALUES($carrito->id, $platillo);");

    foreach($_POST["ingredientes"] as $ingrediente) {
        $query_carrito_ingredientes = pg_query($cn, "INSERT INTO carrito_ingredientes(carritomodel_id, ingredientemodel_id) VALUES($carrito->id, $ingrediente);");
    }

    $newURL = "index.php?status=agregado";
    header('Location: '.$newURL);
?>