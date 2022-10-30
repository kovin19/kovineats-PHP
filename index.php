<!DOCTYPE html>
<html>
<title>Kovin EATS</title>
<link rel="icon" href="/static/icon.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.4.0/mdb.min.css" rel="stylesheet" />
<!-- MDB -->

<head>
    <script type="text/javascript" src="js/load_modal.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.4.0/mdb.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <?php include 'queries.php'; ?>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">

            <div>
                <a class="navbar-brand mt-2 mt-lg-0" href="/">
                    <img src="/static/logo.png" height="50" alt="Kovin Eats Logo" loading="lazy" />
                </a>
            </div>

            <div class="input-group d-flex justify-content-center">
                <div class="form-outline" style="width:50%;">
                    <input type="search" id="form1" class="form-control" />
                    <label class="form-label" for="form1">Buscar restaurantes | platillos</label>
                </div>
                <button type="button" class="btn btn-primary">
                    <i class="fas fa-search"></i>
                </button>
            </div>

            <div class="btn-group btn-group-lg" role="group">
                <button type="button" class="btn btn-primary d-flex justify-content-end" data-mdb-toggle="modal" data-mdb-toggle="modal" data-mdb-target="#modalCarrito" onclick="">
                    <i class="fas fa-shopping-cart"></i>
                    <?php
                    echo '
                                <span class="badge rounded-pill badge-notification bg-danger">
                                    ' . (int)pg_num_rows($query_carrito) . '
                                </span>
                                ';
                    ?>

                </button>

                <a type="button" href="pedidos.php" class="btn btn-primary d-flex justify-content-end" aria-label="Ver pedidos"><i class="fas fa-receipt"></i></a>
            </div>
        </div>
    </nav>

    <div style="margin-top: 1%;margin-bottom: 1%;margin-left: 1%;margin-right: 1%;;">
        <h1>Platillos</h1>
        <hr>
    </div>


    <div class="card-group">
        <?php
            foreach ($platillos as $platillo) {
                echo '
                    <div class="card bg-image hover-zoom" style="margin-left:0.5%;margin-right:0.5%;" >
                        <div class="card-header" style="padding: 0;" >
                            <img class="card-img-top" src="' . $platillo->logo_url . '" alt="platillo"> 
                        </div>
                        <div class="card-body">
                            <h5 class="card-title" style="text-align:center;text-transform: uppercase;">' . $platillo->nombre . '</h5>
                            <i class="fas fa-utensils"></i><p class="card-text">' . $platillo->descripcion . '</p>
                            <i class="fas fa-dollar-sign"></i><p class="card-text">' . $platillo->precio . '</p>
                        </div>
                        <div class="card-footer text-center mt-auto">
                            <button type="button" class="btn btn-primary btn-floating" onclick="cargarModal(' . $platillo->id . ')">
                                <i class="fas fa-cart-plus"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="modalIngredientes' . $platillo->id . '" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Seleccione los ingredientes</h5>
                                    <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="text-center">
                                            <h3 style="text-transform:uppercase;">'.$platillo->nombre.'</h3>
                                            <p>'.$platillo->descripcion.'</p>
                                        </div>
                                    </div>
                                    <form role="form" enctype="multipart/form-data"  method="post" action="agregarCarrito.php">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-8 col-sm-6">
                                                    <img class="img-thumbnail" src="'.$platillo->logo_url.'">
                                                </div>
                                                <div class="col-4">
                                                    <div>
                                                        <input type="hidden" name="platillos" value="'.$platillo->id.'">
                                                        <input type="hidden" name="total" value="'.$platillo->precio.'">
                                                    </div>
            '; 
        ?>
        <?php
            $query_ingredientes = pg_query($cn, "SELECT * FROM platillos_ingredientes WHERE platillomodel_id=$platillo->id");
            $ingredientes_model = array();
            while ($data = pg_fetch_object($query_ingredientes)) {
                $ingredientes_model[] = $data;
            }
            $lista_ingredientes = array();
            foreach ($ingredientes_model as $ingrediente) {
                $lista_ingredientes[] = $ingrediente->ingredientemodel_id;
            }
            $ingredientes = array();
            foreach ($lista_ingredientes as $ingrediente) {
                $ingredientes[] = pg_fetch_object(pg_query("SELECT * FROM ingredientes WHERE id=$ingrediente"));
            }
            foreach ($ingredientes as $ingrediente) {
                echo '
                    <div class="form-check" id="checkes">
                        <input name="ingredientes[]" class="form-check-input" type="checkbox" value="' . $ingrediente->id . '"/>
                        <label class="form-check-label" for="1">' . $ingrediente->nombre . '</label>
                    </div>
                ';
            }
        ?>
        <?php 
            echo '
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="d-flex justify-content-end">
                                                    <h3>Total: $</h3>
                                                    <h3>'.$platillo->precio.'</h3>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <hr>
                                                <button type="submit" id="addToCart" data-product="" data-ingredientes="" data-mdb-dismiss="modal"
                                                    class="btn btn-primary"><i class="fas fa-cart-plus"></i>&nbsp;Agregar al carrito</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End modal -->
            ';
            }
        ?>
        </div>

        <br>

        <div style="margin-top: 1%;margin-bottom: 1%;margin-left: 1%;margin-right: 1%;;">
            <h1>Restaurantes</h1>
            <hr>
        </div>

        <div class="card-group">
            <?php
            foreach ($restaurantes as $restaurante) {
                echo '
                    <div class="card" style="margin-left:0.5%;margin-right:0.5%;">
                        <a href="" style="text-decoration:none;color: rgb(79, 79, 79);">
                            <div class="card h-100 bg-image hover-zoom">
                                <img class="card-img-top" alt="restaurante" src=' . $restaurante->logo_url . '">
                                <span class="badge bg-primary" style="border-radius: 0;">Nuevo en Kovin EATS</span>
                                <div class="card-body">
                                    <h5 class="card-title" style="text-align:center;text-transform: uppercase;">' . $restaurante->nombre . '</h5>
                                    <i class="fas fa-map-marked-alt"></i><p>' . $restaurante->direccion . '</p>
                                    <i class="fas fa-clock"></i><p>' . $restaurante->horario . '</p>
                                    <i class="fas fa-phone"></i><p>' . $restaurante->telefono . '</p>
                                </div>
                            </div>
                        </a>
                    </div>
                ';
            }
            ?>
    </div>

    <br>

    <footer class="bg-light text-center text-lg-start">
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            <p style="color:black;display: inline;">
                C 2022 Copyright Kovin
            <p style="color: #1266f1;display:inline">EATS.</p>
            <p>Made by Kevin Moreno Parra for Dagoberto's class.</p>
            </p>
        </div>
        <!-- Copyright -->
    </footer>

    <!-- Modal Carrito -->
    <div class="modal fade modal-dialog-scrollable" id="modalCarrito" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="ordernar.php" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-shopping-cart"></i>
                            &nbsp;Carrito 
                            <?php
                                echo '('.(int)pg_num_rows($query_carrito).')';
                            ?>
                        </h5>
                        <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <?php
                        $platillos_carrito = array();
                        while ($data = pg_fetch_object($query_carrito_platillos)) {
                            $platillos_carrito[] = $data;
                        }
                        foreach ($platillos_carrito as $pc) {
                            $platillo_object = pg_fetch_object(pg_query($cn, "SELECT * FROM platillos WHERE id=$pc->platillomodel_id"));
                            echo '
                                        <div class="row" style="margin-right:5%;">
                                            <div class="col">
                                                <img src="'.$platillo_object->logo_url.'" class="img-thumbnail" width="70%" height="70%" alt="platillo">
                                            </div>
                                            <div class="col align-self-md-center">
                                                <p>'.$platillo_object->nombre.'</p>
                                            </div>
                                            <div class="col align-self-md-center">
                                                <p class="d-flex flex-row-reverse" name="preciosCarrito" data-precio="">$'.$platillo_object->precio.'</p>
                                                <input type="hidden" name="total" value="130.00">
                                                <input type="hidden" name="ingredientes" value="1">
                                            </div>
                                        </div>
                                        <input type="hidden" name="platillos" value="1">
                                    ';
                            $total_carrito = $total_carrito + (int)$platillo_object->precio;
                        }
                        ?>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <h3>Total: $<?php echo $total_carrito ?>.00</h3>
                        </div>
                        <div class="row">
                            <p class="d-flex justify-content-center">Por el momento solo se aceptan pagos en efectivo.</p>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary" style="width: fit-content;">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Modal -->
    <?php 
        if ($_GET["status"] == "agregado") {
            echo
            "
                <script>
                    swal('Agregado al carrito', 'Se ha agregado al carrito', 'success');
                </script>
            ";
        } elseif ($_GET["status"] == "ordenar") {
            echo "
                <script>
                    swal('¡Gracias por su compra!', 'El restaurante preparará su orden.', 'success');
                </script>
            ";
        }
    ?>
</body>

</html>