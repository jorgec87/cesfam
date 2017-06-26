<%-- 
    Document   : entregamedicamento
    Created on : 12-jun-2017, 11:44:11
    Author     : Alexis Almonacid
--%>

<%@page import="cl.cesfam.ENTITY.Medicamento"%>
<%@page import="cl.cesfam.ENTITY.Prescripcion"%>
<%@page import="java.util.List"%>
<%@page import="cl.cesfam.DTO.SessionUsuario"%>
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

    <title>HOME | Entrega Medicamentos</title>
     <link rel="shortcut icon" href="img/img_custom/LOGO-CESFAM-ORIGINAL-2.jpg">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">
     <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">



</head>

<body class="skin-1">
    <div id="wrapper">
    
      <!-- MENU  -->  
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <i style="color: white" class="fa fa-user-md fa-5x"></i>
<!--                                <img alt="image" class="img-circle" width="100" height="100" src="img/img_custom/LOGO-CESFAM.png">-->
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%=userSession.getNombreUsuario() %></strong>
                             </span> <span class="text-muted text-xs block">Farmaceutico <b class="caret"></b></span> </span> </a>
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
                <li>
                    <a href="dashboard_F.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">Home</span> 
                        <span></span></a>              
                </li>
                  <li>
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">Administrar</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="agregarmedicamento.jsp"><i class="fa fa-medkit"></i>Agregar Medicamento</a></li>
                        <li><a href="agregarpartida.jsp"><i class="fa fa-ambulance"></i>Agregar Partida</a></li> 
                        <li><a href="caducarmedicamentos.jsp"><i class="fa fa-trash"></i>Caducar Medicamento</a></li>   
                        
                        
                        
                        
                        <li class="active"><a href="prescripcionespendientes.jsp"><i class="fa fa-archive"></i>Prescripciones Pendientes</a></li>
                    </ul>
                </li>
                 <li>
                     <a href="revisarstock.jsp"><i class="fa fa-table"></i> <span class="nav-label">Revisar Stock Disponible</span> 
                        <span></span></a>              
                </li>
               <li class="active">
                     <a href="reservamedicamento.jsp"><i class="fa fa-table"></i> <span class="nav-label">Reserva Medicamento</span> 
                        <span></span></a>              
                </li>
            </ul>

        </div>
    </nav>
    <!-- FIN  MENU  -->  
    
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
                        <h5>Prescripciones pendientes</h5>
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
                        <table id="tabla_pendientes" class="table table-responsive table-striped table-bordered table-hover dataTables-example" >
                            <thead>
                                <tr>
                                    <th>Id Paciente</th>
                                    <th>Paciente</th>
                                    <th>Rut Paciente</th>
                                    <th>Periodo</th>
                                    <th>Frecuencia</th>
                                    <th>Dias Duracion</th>
                                    <th>Entregar</th>
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
       
     

   

    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>
     <script src="js/plugins/dataTables/datatables.min.js"></script>

    <!-- Steps -->
    <script src="js/plugins/staps/jquery.steps.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>


    <script>
        $(document).ready(function(){
           
           $('#tabla_pendientes').dataTable( {
 
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
 
    
    }}, "ajax" : "RequestHelper?accion=ObtenerPendientes",
            "columns": [
                        { "data": "medicamento" },
                        { "data": "paciente" },
                        { "data": "rutPaciente" },
                        { "data": "periodo" },
                        { "data": "frecuencia" },
                        { "data": "duracion" }
                    ],
             "columnDefs": [
                 {
                      "targets": [0], 
                      "data": "medicamento", 
                      "render": function(data, type, full) { 
                          return "<a><strong>" + data+ "</strong></a>";
                      }
                  },
                   {
                    "targets": 6,
                    "data": "idPaciente",
                    "render": function(data, type, full) { 
                          return "<a onclick=\"window.location.href='prescripcionespendientes.jsp'\" class=\"btn btn-w-m btn-primary btn-sm\"></i>  Entregar</a>";
                      }
        } 
            ]
 
    
 
    }
            
                
                );
        
        
        
        
            
    }); 
    
    
    $('#tabla_pendientes tbody').on( 'click', 'button', function () {
            window.location = "dashboard_F.jsp";
    } );
    </script>
    
    
    <script src="js/fnReloadAjax.js"></script>
  



  
</body>
</html>