<?php


	$cn=pg_connect("host=localhost dbname=kovineats_django user=postgres password=postgres");

    // $restaurantes = pg_query($cn, "SELECT * FROM restaurantes");
    // while($data = pg_fetch_object($restaurantes)) {
    //     echo "***********************";
    //     echo "<br>";
    //     echo $data->nombre;
    //     echo "<br>";
    //     echo $data->direccion;
    //     echo "<br>";
    //     echo $data->telefono;
    //     echo "<br>";
    //     echo $data->horario;
    //     echo "<br>";
    //     echo "<img src=$data->logo_url>";
    //     echo "<br>";
    //     echo "***********************";
    // }
    // pg_free_result($restaurantes);
    $query_platillos = pg_query($cn, "SELECT * FROM platillos");
    $query_restaurantes = pg_query($cn, "SELECT * FROM restaurantes");
    $platillos = array();
    $restaurantes = array();
    while($data = pg_fetch_object($query_platillos)) {
        $platillos[] = $data;
    }
    while($data = pg_fetch_object($query_restaurantes)) {
        $restaurantes[] = $data;
    }

    // pg_free_result($platillos);
    // pg_close($cn);
?>
