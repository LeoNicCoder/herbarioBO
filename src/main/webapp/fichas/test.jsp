<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.*, datos.*, java.util.ArrayList"%>
<%@page import="entidades.fichas_tecnicas.Tbl_family"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title><%=Server.getAppName() %> Nueva Planta</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../img/Logo.png" type="image/x-icon">
    <!-- Custom fonts for this template -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- jAlert css  -->
    <link rel="stylesheet" href="../vendor/jAlert/dist/jAlert.css" />

    <!-- Font Awesome -->
    <!-- <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    Ionicons
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    Theme style
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    Google Font: Source Sans Pro
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    jAlert css
    <link rel="stylesheet" href="../../plugins/jAlert/dist/jAlert.css" /> -->


</head>


<body class="hold-transition sidebar-mini">

<div id="wrapper">

    <!-- SIDEBAR -->

    <!-- SIDEBAR -->

    <!-- Content Wrapper. Contains page content -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Content Header (Page header) -->

        <section class="content-header">
            <!-- Navbar -->

            <!-- /.navbar -->

            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Registro [Nueva Planta]</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="">Gesti�n de Fichas T�cnicas</a></li>
                            <li class="breadcrumb-item active">Nueva Planta</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-12">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Nueva Planta</h3>
                            </div>

                            <form role="form" action="../savePlant" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="idUser" id="idUser" value="<%=idUser%>">
                                <div class="card-body">
                                    <h5>Datos de Esp�cimen</h5>




                                    <h5>Datos de Ubicaci�n</h5>

                                    <div class="form-group">
                                        <label for="country">Pa�s</label>
                                        <select class="form-control" id="country" name="country" required>
                                            <option value="">Seleccione...</option>
                                            <option value="1">Nicaragua</option>
                                            <option value="2">Honduras</option>
                                        </select>
                                    </div>



                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Submit</button>

                                    <a href="" class="btn btn-danger btn-icon-split">
                                        <span class="text">Cancelar</span>
                                    </a>
                                </div>
                            </form>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->

        <!-- Footer -->

        <!-- ./Footer -->
    </div>
</div>

<!-- jQuery -->
<script src="../vendor/jquery/jquery.min.js"></script>
<!-- <script src="../../plugins/jquery/jquery.min.js"></script> -->

<!-- jAlert js -->
<script src="../vendor/jAlert/dist/jAlert.min.js"></script>
<script src="../vendor/jAlert/dist/jAlert-functions.min.js"> </script>
<script src="../js/showImage.js"></script>
<script src="../js/axios/axios.min.js"></script>
<script src="../js/zoneFetcher.js"></script>

</body>
</html>