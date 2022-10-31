<?php
    $platillos = $_POST['platillos'];
    $total = $_POST['total'];

    $nombres = ['Chayanne','Hiram','Dagoberto','Adrián','Juan'];
    $apellidos = ['Hernández','Gómez','Rodríguez','Rendón','Ibarra','López','Dóriga','Cervantes','Álvarez','Velázquez'];
    $repartidor = implode(' ',array($nombres[rand(0,4)],$apellidos[rand(0,9)],$apellidos[rand(0,9)]));
    $fecha_pedido = date('d/m/Y');
    $folio = 'KOVINEATS'.date('Ymd').'000';

    $cn=pg_connect('host=localhost dbname=kovineats_django user=postgres password=postgres');
    
    $query_pedido = pg_query($cn, "INSERT INTO pedidos(folio,total,repartidor,fecha_pedido) VALUES('$folio','$total','$repartidor','$fecha_pedido') RETURNING id;");
    $pedido = pg_fetch_object($query_pedido);
    $folio = $folio.$pedido->id;
    $update_carrito = pg_query("UPDATE pedidos SET folio='$folio' WHERE id=$pedido->id;");

    foreach($platillos as $platillo) {
        pg_query($cn, "INSERT INTO pedidos_platillos(pedidomodel_id, platillomodel_id) VALUES('$pedido->id','$platillo');");
    }

    $query_carrito_platillos = pg_query($cn, 'DELETE FROM carrito_platillos;');
    $query_carrito_ingredientes = pg_query($cn, 'DELETE FROM carrito_ingredientes;');
    $query_carrito = pg_query($cn, 'DELETE FROM carrito;');
    $newURL = 'index.php?status=ordenar';
    header('Location: '.$newURL);
?>