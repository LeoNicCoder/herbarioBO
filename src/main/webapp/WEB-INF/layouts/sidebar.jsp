<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%
    String basePath = request.getContextPath();
 %>
 
 <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=basePath%>/index.jsp">
        <div class="sidebar-brand-icon ">
          <i class="fas fa-spa"></i>
        </div>
        <div class="sidebar-brand-text mx-3">HN UCA <sup></sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">
      
      <div class="sidebar-heading">
        Seguridad
      </div>

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="<%=basePath%>/">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
         </a>
        <a class="nav-link" href="<%=basePath%>/seguridad/rolesOpciones">
          <i class="fas fa-fw fa-tasks"></i>
          <span>Gesti�n de Opciones</span>
         </a>
        <a class="nav-link" href="<%=basePath%>/seguridad/usuarios">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Gesti�n de Usuarios</span>
         </a>
         <li class="nav-item" style="cursor:pointer;">
         <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-user-tag"></i>
          <span>Gesti�n de Roles</span>
          
         </a>
          <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="<%=basePath%>/seguridad/roles">Roles</a>
            <a class="collapse-item" href="<%=basePath%>/seguridad/rolesUsuarios">Asignar</a>
          </div>
        </div>
         </li>
        
      

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
      Fichas
      </div>
      
       <li class="nav-item" style="cursor:pointer;">
         <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseSpecimen" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-seedling"></i>
          <span>Gesti�n de Esp�cimenes</span>
          
         </a>
          <div id="collapseSpecimen" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="<%=basePath%>/fichas/PlantList">Plantas</a>
            <a class="collapse-item" href="<%=basePath%>/fichas/fungus">Hongos</a>
          </div>
        </div>
         </li>
         
         
         <li class="nav-item" style="cursor:pointer;">
         <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseCheck" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-share-square"></i>
          <span>Fichas Recibidas</span>
          
         </a>
          <div id="collapseCheck" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="<%=basePath%>/fichas/receivedPlants">Plantas</a>
            <a class="collapse-item" href="<%=basePath%>/fichas/receivedFungus">Hongos</a>
          </div>
        </div>
         </li>
         
         <li class="nav-item" style="cursor:pointer;">
         <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseCat" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-list"></i>
          <span>Extra</span>
          
         </a>
          <div id="collapseCat" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
              <a class="collapse-item" href="<%=basePath%>/fichas/genus">G�nero</a>
            <a class="collapse-item" href="<%=basePath%>/fichas/species">Especies</a>
            <a class="collapse-item" href="<%=basePath%>/fichas/families">Familias</a>
            <a class="collapse-item" href="<%=basePath%>/fichas/ecosystems">Ecosistemas</a>
            <a class="collapse-item" href="<%=basePath%>/fichas/capsType">Sombreros (Hongos)</a>
            <a class="collapse-item" href="<%=basePath%>/fichas/fungusForms">Formas (Hongos)</a>
              <a class="collapse-item" href="<%=basePath%>/location/country">Pa�ses</a>
              <a class="collapse-item" href="<%=basePath%>/location/states">Estados</a>
              <a class="collapse-item" href="<%=basePath%>/location/cities">Cities</a>
          </div>
        </div>
         </li>
         
         

      <!-- Nav Item - Pages Collapse Menu -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> -->
<!--           <i class="fas fa-fw fa-cog"></i> -->
<!--           <span>Components</span> -->
<!--         </a> -->
<!--         <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> -->
<!--           <div class="bg-white py-2 collapse-inner rounded"> -->
<!--             <h6 class="collapse-header">Custom Components:</h6> -->
<!--             <a class="collapse-item" href="buttons.html">Buttons</a> -->
            
<!--           </div> -->
<!--         </div> -->
<!--       </li> -->

      <!-- Nav Item - Utilities Collapse Menu -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> -->
<!--           <i class="fas fa-fw fa-wrench"></i> -->
<!--           <span>Utilities</span> -->
<!--         </a> -->
<!--         <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar"> -->
<!--           <div class="bg-white py-2 collapse-inner rounded"> -->
<!--             <h6 class="collapse-header">Custom Utilities:</h6> -->
<!--             <a class="collapse-item" href="utilities-color.html">Colors</a> -->
<!--             <a class="collapse-item" href="utilities-border.html">Borders</a> -->
<!--             <a class="collapse-item" href="utilities-animation.html">Animations</a> -->
<!--             <a class="collapse-item" href="utilities-other.html">Other</a> -->
<!--           </div> -->
<!--         </div> -->
<!--       </li> -->

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
     

      <!-- Nav Item - Pages Collapse Menu -->
<!--       <li class="nav-item active"> -->
<!--         <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> -->
<!--           <i class="fas fa-fw fa-folder"></i> -->
<!--           <span>Pages</span> -->
<!--         </a> -->
<!--         <div id="collapsePages" class="collapse show" aria-labelledby="headingPages" data-parent="#accordionSidebar"> -->
<!--           <div class="bg-white py-2 collapse-inner rounded"> -->
<!--             <h6 class="collapse-header">Login Screens:</h6> -->
<!--             <a class="collapse-item" href="login.html">Login</a> -->
<!--             <a class="collapse-item" href="register.html">Register</a> -->
<!--             <a class="collapse-item" href="forgot-password.jsp">Forgot Password</a> -->
<!--             <div class="collapse-divider"></div> -->
<!--             <h6 class="collapse-header">Other Pages:</h6> -->
<!--             <a class="collapse-item" href="404.html">404 Page</a> -->
<!--             <a class="collapse-item active" href="blank.html">Blank Page</a> -->
<!--           </div> -->
<!--         </div> -->
<!--       </li> -->

      <!-- Nav Item - Charts -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="charts.html"> -->
<!--           <i class="fas fa-fw fa-chart-area"></i> -->
<!--           <span>Charts</span></a> -->
<!--       </li> -->

      <!-- Nav Item - Tables -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="tables.html"> -->
<!--           <i class="fas fa-fw fa-table"></i> -->
<!--           <span>Tables</span></a> -->
<!--       </li> -->


      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->