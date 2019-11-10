<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entidades.*, datos.*, java.util.ArrayList"%>
    
<!-- 
       AUTOR:  Leonardo Cardoza
       FIN:    29/10/2019
   
 -->
    
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Herbario Nacional - Roles</title>

  <!-- Custom fonts for this template -->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../jAlert/dist/jAlert.css" />

</head>
<%
	//VALIDACI�N DE LA EXISTENCIA DE LA SESI�N
		String loginUser="";
		loginUser = (String)session.getAttribute("login");
		//VALIDA QUE LA VARIABLE loginUser NO SEA NULL
		loginUser = loginUser==null?"":loginUser;
		if(loginUser.equals(""))
		{
	response.sendRedirect("../login.jsp?status=2");
	return;
		}
		
// VALIDAR ACCESO
ArrayList<VW_user_opciones> opciones = (ArrayList<VW_user_opciones>) session.getAttribute("opciones");
boolean acceso = false;

for(VW_user_opciones vu: opciones) {
	 if(vu.getOpcion().equals("./seguridad/roles.jsp")) {
		 acceso = true;
	 }
}

if(!acceso){
	 response.sendRedirect("../accesoDenegado.jsp");
}

///////////
 


 DT_rolUsuario tru = new DT_rolUsuario();
 ArrayList<VW_user_rol> rolesUser = null;
 
 DT_Rol dtr = new DT_Rol();
 ArrayList<Tbl_rol> listaRoles = dtr.listarRoles();
 
 ArrayList<VW_rol_opcion> opcionesRol = null;
 DT_rolOpcion  dtro = new DT_rolOpcion();
 
 
 
 DT_opcion dto = new DT_opcion();
 ArrayList<Tbl_opcion> listaOpciones = dto.listarOpciones();
 
 
 Tbl_rol role = null;
 
 boolean withRole = false;
 String rolInput = "";
 String id_rol ="";
 String errorMsg = "";
 boolean error = false; // Para indicar cualquier error a notificar
 
 
 if(request.getParameter("rol") != null)
 {
	 try{
	     int idRol = Integer.parseInt(request.getParameter("rol"));
		 opcionesRol = dtro.listarRolOpcion(idRol);
		 role = dtr.obtenerRol(idRol);
		 if(role == null){
	 response.sendRedirect("rolesOpciones.jsp?error=1");
	 return;
	 //System.out.println("Adios");
		 }
		 
		 rolInput = role.getRol_name();
		 id_rol += role.getId_rol();
		 withRole = true;
	 
	 }catch(NumberFormatException e){
		 response.sendRedirect("rolesUsuarios.jsp?error=2");
		 return;
	 }
 }
 
 if(request.getParameter("error") !=null){
	 error = true;
	 String errorVal = request.getParameter("error");
	 if(errorVal.equals("1")){
		 errorMsg = "El rol especificado no existe";
	 }else if(errorVal.equals("2")){
		 errorMsg = "Par�metro incorrecto";
	 }
 }
%>
<body id="page-top">
   <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="../WEB-INF/layouts/sidebar.jsp"></jsp:include>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <jsp:include page="../WEB-INF/layouts/header.jsp"></jsp:include>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
          
		  
		  
		  <%if(request.getParameter("saved") != null) {%>
	       <div class="alert alert-success alert-dismissible fade show" role="alert">
			  �El registro se ha guardado <strong>correctamente</strong>!
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		  <%} %>
		  
		  <%if(request.getParameter("upd") != null) {%>
	       <div class="alert alert-success alert-dismissible fade show" role="alert">
			  �El registro se ha modificado <strong>correctamente</strong>!
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		  <%} %>
		  
		  <%if(request.getParameter("fail") != null && Integer.parseInt(request.getParameter("fail")) == 1) {%>
	       <div class="alert alert-danger alert-dismissible fade show" role="alert">
			  Algo sali� mal al guardar el registro
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		  <%} %>
		  
		  <%if(request.getParameter("fail") != null && Integer.parseInt(request.getParameter("fail")) == 2) {%>
	       <div class="alert alert-danger alert-dismissible fade show" role="alert">
			  El nuevo nombre para rol ya est� <strong>asignado</strong>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		  <%} %>
		  
		  <%if(request.getParameter("del") != null && Integer.parseInt(request.getParameter("del")) == 1) {%>
	       <div class="alert alert-success alert-dismissible fade show" role="alert">
			  �Se ha <strong>eliminado</strong> el rol correctamente!
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		  <%} %>
		  
		  <%if(request.getParameter("del") != null && Integer.parseInt(request.getParameter("del")) == 2) {%>
	       <div class="alert alert-danger alert-dismissible fade show" role="alert">
			  �Ha ocurrido un error<strong>eliminando</strong> el rol!
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		  <%} %>

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Roles</h1>
          <p class="mb-4">Cree, edite y elimine roles</p>

            
            
            <form role="form" method="POST" class="col-6" action="../SL_roles">
              
            <input type="hidden" id="idRol" name="idRol" value="">
            <input type="hidden" id="opc" name="opc" value="1">
            
            <div class="form-group">
		    <label for="rolName">Rol: </label>
		    <input type="text" class="form-control" id="rolName" value="" name="rolName" required>
		  </div>
		  
		  
            <div class="form-group">
		    <label for="rolDesc">Descripci�n: </label>
		    <input type="text" class="form-control" name="rolDesc" id="rolDesc" value="">
		  </div>
		  
		    <button id="submitRole" type="submit" class="btn btn-success">Guardar</button>
		    <button type="reset" id="cancelRoleBTN" class="btn btn-danger">Cancelar</button>
            </form>
            <br>
            
           
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  
                   <thead>
                    <tr>
                      <th>ID</th>
                      <th>Rol</th>
                      <th>Descripci�n</th>
                      <th>Opcion</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>ID</th>
                      <th>Rol</th>
                      <th>Descripci�n</th>
                      <th>Opcion</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <%
                    	for(Tbl_rol rol: listaRoles) {
                    %>
                    <tr>
                      <td id="cl-id-<%=rol.getId_rol()%>"><%=rol.getId_rol() %></td>
                      <td id="cl-name-<%=rol.getId_rol()%>"><%=rol.getRol_name() %></td>
                      <td id="cl-desc-<%=rol.getId_rol()%>"><%=rol.getRol_desc() %></td>
                      <td>
                       <a href="#" id="<%=rol.getId_rol()%>" class="editRole">
                       
                       <i class="fas fa-edit editRole"></i>
                       </a>
                       &nbsp;&nbsp;
                       <a href="#" id="<%=rol.getId_rol()%>" class="deleteRole">
                        <i class="fas fa-trash-alt"></i>
                       </a>
                      </td>
                    </tr>
                    <%} %>
                    
                  </tbody>
                </table>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <jsp:include page="../WEB-INF/layouts/footer.jsp"></jsp:include>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
  

  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../js/demo/datatables-demo.js"></script>
  
  <script src="../jAlert/dist/jAlert.min.js"></script>
  <script src="../jAlert/dist/jAlert-functions.min.js"> </script>
  <script src="../js/roles.js"></script>
  
  <script>
  
  </script>

</body>
</html>