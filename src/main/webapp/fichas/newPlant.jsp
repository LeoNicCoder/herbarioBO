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
    <link rel="stylesheet" href="../js/select2/select2.min.css" />
  
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

<%

String idUser = "";

  if(request.getAttribute("pass") == null){
	  response.sendRedirect("./newPlant");
	  return;
  }

if(request.getSession().getAttribute("user") != null){
	 Tbl_user user = (Tbl_user) request.getSession().getAttribute("user");
	 idUser += user.getId();
}

Tbl_family[] families = null;

if(request.getAttribute("families") != null){
families = (Tbl_family[]) request.getAttribute("families");
	
}

// Permission
HttpSession hts = request.getSession();
boolean addPermission = false;

Tbl_opcion[] permisions = (Tbl_opcion[]) hts.getAttribute("user_permissions");

if(permisions == null) {
    
    response.sendRedirect(request.getContextPath() + "/toLoginPage");
    return;
}

for(Tbl_opcion p: permisions) {
    if(p.getCodename().equals("add_plantspecimen")) {
        addPermission = true;
    }
}

    if(!addPermission) {
        response.sendRedirect(request.getContextPath() + "/accesoDenegado.jsp");
        return;
    }
%>
<body class="hold-transition sidebar-mini">

<div id="wrapper">
	
	<!-- SIDEBAR -->
	  	<jsp:include page="../WEB-INF/layouts/sidebar.jsp"></jsp:include>
	<!-- SIDEBAR -->
	
	  <!-- Content Wrapper. Contains page content -->
	  <div id="content-wrapper" class="d-flex flex-column">
	    <!-- Content Header (Page header) -->
	    
	    <section class="content-header">
	<!-- Navbar -->
	  	<jsp:include page="../WEB-INF/layouts/header.jsp"></jsp:include>
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
                            



                            <div class="form-group">
                                <label for="specie">Especie</label>
                                <select class="form-control" id="specie" name="species" required>
                                   <option value="">Seleccione...</option>
                                   <c:if test="${species != null}">
                                     <c:forEach items="${species}" var="specie">
                                         <option value="${specie.id}">${specie.common_name}</option>
                                     </c:forEach>
                                   </c:if>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="specimenDescription">Descripci�n del esp�cimen</label>
                                <textarea class="form-control" id="specimenDescription" rows="3"
                                    placeholder="Descripci�n del esp�cimen" name="description"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="complete">�Completo?</label>
                                <select class="form-control" id="complete" name="complete" required>
                                  <option value="">Seleccione...</option>
                                  <option value="true">S�</option>
                                  <option value="false">No</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="numberSpecimens">N�mero de espec�menes colectados</label>
                                <input type="number" class="form-control" id="numberSpecimens"
                                    placeholder="N�mero de espec�menes" name="number_of_samples">
                            </div>

                            <h5>Datos de Ubicaci�n</h5>

                            <!--<div class="form-group">
                                <label for="country">Pa�s</label>
                                <select class="form-control" id="country" name="country" required>
                                  <option value="">Seleccione...</option>

                                </select>
                            </div> -->

                            <!--<div class="form-group">
                                <label for="state">Estado/Provincia/Condado</label>
                                <select disabled class="form-control" id="state" name="state" required>
                                  <option value="">Seleccione...</option>

                                </select>
                            </div> -->

                            <div class="form-group">
                                <label for="city">Lugar: Pa�s/Estado/Ciudad</label>
                                <select  class="form-control" id="city" name="city" required>
                                  <option value="">Sin seleccionar</option>
                                    <c:forEach items="${cities}" var="city">
                                        <option value="${city.id}">${city.state.country.name}/${city.state.name}/${city.name}</option>
                                    </c:forEach>

                                </select>
                            </div>

                           <div class="form-group">
                                <label for="specificCollectionArea">Area de recolecci�n espec�fica</label>
                                <select class="form-control" id="specificCollectionArea" name="recolection_area_status" required>
                                  <option value="">Seleccione...</option>
                                   <c:if test="${reco != null}">
                                     <c:forEach items="${reco}" var="rec">
                                         <option value="${rec.id}">${rec.name}</option>
                                     </c:forEach>
                                   </c:if>
                                </select>
                            </div>

                            <h6>Coordenadas</h6>

                            <div class="form-group">
                                <label for="latitude">Latitud</label>
                                <input type="text" class="form-control" id="latitude"
                                    placeholder="Latitud" name="latitude">
                            </div>

                            <div class="form-group">
                                <label for="longitude">Longitud</label>
                                <input type="text" class="form-control" id="longitude" placeholder="Longitud" name="longitude">
                            </div>

                            <div class="form-group">
                                <label for="location">Ubicaci�n</label>
                                <input type="text" class="form-control" id="location" placeholder="" name="location"
                                       required>
                            </div>

                            <h5>Datos de H�bitat</h5>


                            <div class="form-group">
                                <label for="habitat">H�bitat</label>
                                <select class="form-control" id="habitat" name="ecosystem" required>
                                  <option value="">Seleccione...</option>
                                   <c:if test="${ecosystems != null}">
                                     <c:forEach items="${ecosystems}" var="ecosystem">
                                         <option value="${ecosystem.id}">${ecosystem.name}</option>
                                     </c:forEach>
                                   </c:if>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="habitatDescription">Descripci�n de h�bitat</label>
                                <select class="form-control" id="habitatDescription">

                                </select>
                            </div>

                            <div class="form-group">
                                <label for="biostatus">Bioestado</label>
                                <select class="form-control" id="biostatus" name="biostatus" required>
                                  <option value="">Seleccione...</option>
                                   <c:if test="${bios != null}">
                                     <c:forEach items="${bios}" var="bio">
                                         <option value="${bio.id}">${bio.name}</option>
                                     </c:forEach>
                                   </c:if>
                                </select>
                            </div>

                        </div>
                        
                        <div class="form-group">
                           <input type="file" id="photo" name="photo" class="form-control-file" required>
                           <div class="card bg-light" style="min-height: 400px; width:90%;margin-left: auto;margin-right:auto;">
                             <img id="imagePreview" src="" alt="image preview" width="60%" height="auto" 
                             style="margin-left: auto;margin-right:auto;"/>
                           </div>
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
  		<jsp:include page="../WEB-INF/layouts/footer.jsp"></jsp:include>
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
   <script src="../js/js_cookie/js.cookie.min.js"></script>
  <script src="../js/zoneFetcher.js"></script>
<script src="../js/select2/select2.full.min.js"></script>

<script>
    $(document).ready(function() {
        $('#city').select2();
    });
</script>
  
</body>
</html>