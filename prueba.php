<?php
	$cn=pg_connect("host=localhost dbname=kovineats_django user=postgres password=postgres");
    $query_ingredientes = pg_query($cn, "SELECT * FROM platillos_ingredientes WHERE platillomodel_id=1");
    $ingredientes_model = array();
    while($data = pg_fetch_object($query_ingredientes)) {
        $ingredientes_model[] = $data;
    }
    $lista_ingredientes = array();
    foreach($ingredientes_model as $ingrediente) {
        $lista_ingredientes[] = $ingrediente->ingredientemodel_id;
    }
    $ingredientes = array();
    foreach($lista_ingredientes as $ingrediente) {
        $ingredientes[] = pg_fetch_object(pg_query("SELECT * FROM ingredientes WHERE id=$ingrediente"));
    }
    // foreach($ingredientes as $ingrediente) {
    //     echo $ingrediente->nombre;
    //     echo "\n";
    // }
?>