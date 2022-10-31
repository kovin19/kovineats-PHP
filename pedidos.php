<html>
<title>Kovin EATS</title>
<link rel="icon" href="static/icon.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.4.0/mdb.min.css" rel="stylesheet" />
<!-- MDB -->

<head>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.4.0/mdb.min.js"></script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <a class="navbar-brand mt-2 mt-lg-0" href="/">
                    <img src="static/logo.png" height="50" alt="Kovin Eats Logo" loading="lazy" />
                </a>
            </div>

            <div class="input-group d-flex justify-content-center">
                <div class="form-outline" style="width:50%;">
                    <input type="search" id="form1" class="form-control" />
                    <label class="form-label" for="form1">Buscar Restaurantes | Platillos</label>
                </div>
                <button type="button" class="btn btn-primary">
                    <i class="fas fa-search"></i>
                </button>
            </div>

            <div class="btn-group" role="group">
                <button type="button" class="btn btn-primary" data-mdb-toggle="modal" data-mdb-toggle="modal" data-mdb-target="#modalCarrito">
                    <i class="fas fa-shopping-cart"></i>
                </button>
                <a type="button" href="{% url 'index:show' %}" class="btn btn-primary" aria-label="Ver pedidos"><i class="fas fa-receipt"></i></a>
            </div>
        </div>
    </nav>

    <div style="margin-top: 1%;margin-bottom: 1%;margin-left: 1%;margin-right: 1%;">
        <h1>Pedidos</h1>
    </div>

    <table class="table">
        <thead>
            <th>Folio</th>
            <th>Platillo(s)</th>
            <th>Fecha del pedido</th>
            <th>Repartidor</th>
            <th>Método de pago</th>
            <th>Total</th>
        </thead>
        <tbody>
            <?php
            $cn = pg_connect("host=localhost dbname=kovineats_django user=postgres password=postgres");
            $query_pedidos = pg_query($cn, "SELECT * FROM pedidos;");
            $pedidos = array();
            while ($data = pg_fetch_object($query_pedidos)) {
                $pedidos[] = $data;
            }
            foreach ($pedidos as $pedido) {
                echo '
                        <tr>
                            <td>
                                <p>' . $pedido->folio . '</p>
                            </td>
                            <td>
                                <ul>
                                ';
                $query_pedidos_platillos = pg_query($cn, "SELECT * FROM pedidos_platillos WHERE pedidomodel_id=$pedido->id;");
                $pedidos_platillos = array();
                while ($data = pg_fetch_object($query_pedidos_platillos)) {
                    $pedidos_platillos[] = $data;
                }
                $platillos = array();
                foreach ($pedidos_platillos as $platillo) {
                    $platillos[] = pg_fetch_object(pg_query($cn, "SELECT * FROM platillos WHERE id=$platillo->platillomodel_id;"));
                }
                foreach ($platillos as $platillo) {
                    echo '
                                        <li>' . $platillo->nombre . '</li>
                                    ';
                }
                echo '
                                </ul>
                            </td>
                            <td>
                                <p>' . $pedido->fecha_pedido . '</p>
                            </td>
                            <td>
                                <p>' . $pedido->repartidor . '</p>
                            </td>
                            <td>
                                <p>Efectivo</p>
                            </td>
                            <td>
                                <p>$' . $pedido->total . '.00</p>
                            </td>
                        </tr>
                        ';
            }
            ?>
        </tbody>
    </table>

    <footer class="bg-light text-center text-lg-start">
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            <p style="color:black;display: inline;">
                © 2022 Copyright Kovin
            <p style="color: #1266f1;display:inline">EATS.</p>
            <p>Made by Kevin Moreno Parra for Dagoberto's class.</p>
            </p>
        </div>
        <!-- Copyright -->
    </footer>

</body>

</html>