<%-- 
    Document   : revisarstock
    Created on : 24-abr-2017, 16:33:22
    Author     : Alexis
--%>
<%@page import="cl.cesfam.ENTITY.Componente"%>
<%@page import="java.util.List"%>
<%@page import="cl.cesfam.DTO.SessionUsuario"%>
<%@page import="cl.cesfam.ENTITY.Medicamento"%>
<%    
    cl.cesfam.DTO.SessionUsuario userSession = (cl.cesfam.DTO.SessionUsuario)request.getSession(false).getAttribute("usuario"); 
    if (userSession != null) 
    {
          
    }
    else
    {
    request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CESFAM | Revisar Stock</title>
    <link rel="shortcut icon" href="img/img_custom/LOGO-CESFAM-ORIGINAL-2.jpg">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>

<body class="skin-1 " >

    <div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <i style="color: white" class="fa fa-user-md fa-5x"></i>
                             </span>
                        <%if(userSession.getTipoUsuario().equals("F")){%>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%=userSession.getNombreUsuario() %></strong></span> 
                         <span class="text-muted text-xs block">Farmaceutico <b class="caret"></b></span> </span> </a>
                         <% }else{%>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%=userSession.getNombreUsuario() %></strong></span> 
                         <span class="text-muted text-xs block">Médico <b class="caret"></b></span> </span> </a>
                          <%  } %>
                         <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="profile.html">Profile</a></li>

                            <li class="divider"></li>
                            <li><a href="LogoutServlet">Logout</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        MENU
                    </div>
             </li>
                   <%if(userSession.getTipoUsuario().equals("F")){%>
                 <li>
                    <a href="dashboard_F.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">Home</span> 
                        <span></span></a>              
                 </li>
               <% }else{%>
                    <li>
                    <a href="dashboard_M.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">Home</span> 
                        <span></span></a>              
                 </li>
                 <%  } %>
               
                <%if(userSession.getTipoUsuario().equals("F")){%>
               <li >
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">Administrar</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="agregarmedicamento.jsp"><i class="fa fa-medkit"></i>Agregar Medicamento</a></li>
                        <li><a href="agregarpartida.jsp"><i class="fa fa-ambulance"></i>Agregar Partida</a></li> 
                        <li class="active"><a href="caducarmedicamentos.jsp"><i class="fa fa-trash"></i>Caducar Medicamento</a></li>
                        <li><a href="prescripcionespendientes.jsp"><i class="fa fa-archive"></i>Prescripciones Pendientes</a></li>
                    </ul>
                </li>
               <% } %>
                  
                 <li class="active">
                     <a href="revisarstock.jsp"><i class="fa fa-table"></i> <span class="nav-label">Revisar Stock Disponible</span></a>              
                </li >
                <%if(userSession.getTipoUsuario().equals("M")){%>
                <li >

                     <a href="prescripcion.jsp"><i class="fa fa-stethoscope"></i>Generar Prescripción</a>
                </li>
               <% } %>
               <li>
                     <a href="reservamedicamento.jsp"><i class="fa fa-table"></i> <span class="nav-label">Reserva Medicamento</span> 
                        <span></span></a>              
               </li>
            </ul>

        </div>
    </nav>

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
        </div>
            <ul class="nav navbar-top-links navbar-right">              
                <li>
                    <a href="LogoutServlet">
                        <i class="fa fa-sign-out"></i> Cerrar sesión
                    </a>
                </li>
            </ul>

        </nav>
        </div>
            <!--INICIO PANEL-->
                    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Medicamentos</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="#">Config option 1</a>
                                </li>
                                <li><a href="#">Config option 2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="table-responsive">
                        <table id="tabla_medicamentos" class="table table-responsive table-striped table-bordered table-hover dataTables-example" >
                            <thead>
                                <tr>
                                    <th>Medicamento</th>
                                    <th>Fabricante</th>
                                    <th>Presentación</th>
                                    <th>Contenido Envase</th>
                                    <th>Contenido en Stock</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                       </table>
                      </div>
                     </div>
                </div>
            </div>
            </div>
        
                    </div>
            
            <!--FINAL PANEL-->   
           
            
        <div class="footer">
<!--            <div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>-->
            <div>
                <strong>Copyright</strong> Duoc-UC &copy; 2017
            </div>
        </div>

        </div>
        </div> 
<!--        fin wrapper-->


   <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/plugins/jeditable/jquery.jeditable.js"></script>

    <script src="js/plugins/dataTables/datatables.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>


 
</body>
 <script>
        $(document).ready(function() {
           
            $('#tabla_medicamentos').dataTable( {
 
        "language": {
 
    "sProcessing":     "Procesando...",
 
    "sLengthMenu":     "Mostrar _MENU_ registros",
 
    "sZeroRecords":    "No se encontraron resultados",
 
    "sEmptyTable":     "Ningún dato disponible en esta tabla",
 
    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
 
    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
 
    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
 
    "sInfoPostFix":    "",
 
    "sSearch":         "Buscar:",
 
    "sUrl":            "",
 
    "sInfoThousands":  ",",
 
    "sLoadingRecords": "Cargando...",
 
    "oPaginate": {
 
        "sFirst":    "Primero",
 
        "sLast":     "Último",
 
        "sNext":     "Siguiente",
 
        "sPrevious": "Anterior"
 
    
    }}, "ajax" : "RequestHelper?accion=ObtenerMedicamentos",
            "columns": [
                        { "data": "nombre"},
                        { "data": "fabricante" },
                        { "data": "presentacion" },
                        { "data": "contenido" },
                        { "data": "stock" }
                    ],
             "columnDefs": [
                 {
                      "targets": [0], 
                      "data": "nombre", 
                      "render": function(data, type, full) { 
                          return "<a><strong>" + data.toUpperCase() + "</strong></a>";
                      }
                  },
                    {
                      "targets": [2], 
                      "data": "presentacion", 
                      "render": function(data, type, full) {
                          if(data == 1){
                          return "<p><span class=\"label label-primary\">Solida</span></p>";
                      }else{
                         return "<p><span class=\"label label-info\">Liquida</span></p>"; 
                      }
                      }
                  },{
                      "targets": [3], 
                      "data": "contenido",
                      "render": function(data, type, full) { 
                          var p_val = full.presentacion;
                          if(p_val == 1){
                          return "<td >"+data + " UN</td>";
                      }else{
                          return "<td >"+data + " ML</td>";
                      }
                      }
                  },
                    {
                      "targets": [4], 
                      "data": "stock", 
                      "render": function(data, type, full) { 
                          if(data > 0){
                          return "<td ><span style=\"color:#1ab394;\">"+data + " UN</span></td>";
                      }else{
                          return "<td ><span style=\"color:#ed5565;\">"+data + " UN</span></td>";
                      }
                      }
                  }]
 
    
 
    } );

//"sClass": "text-center",

            });


      
    </script>
