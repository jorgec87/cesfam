<%-- 
    Document   : emitirInformeStock
    Created on : Jul 16, 2017, 2:59:35 AM
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<!DOCTYPE html>
<%-- 
    Document   : agregarStock
    Created on : 16-04-2017, 15:34:23
    Author     : Francisco
--%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CESFAM | Emitir Informes De Stock</title>
    <link rel="shortcut icon" href="img/img_custom/LOGO-CESFAM-ORIGINAL-2.jpg">
    <link href="css/bootstrap.min.css" rel="stylesheet">
       <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
      

    <style>
.added_item {
    font-family: sans-serif;
    font-size: 13px;
    background-color: #1ab394;
    color: #fff;
    border-radius: 3px;
    padding: 3px 10px;
    display: inline;
    float: left;
    margin: 0 5px 5px 0;
   
}
.item {
    background-color: #fff;
    padding: 10px;
    margin-bottom: 10px;
    
}
.content_view{
    padding: 20px;
}
.added_item a {
    color: #fff;
}

.inherit_color {
    color: inherit;
}
.add{
  color: #1ab394;
  font-family: sans-serif;
}
#b2{
   font-family: sans-serif;  
}        
        
        
    </style>
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
                  <li  class="active">
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">Administrar</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="agregarmedicamento.jsp"><i class="fa fa-medkit"></i>Agregar Medicamento</a></li>
                        <li><a href="agregarpartida.jsp"><i class="fa fa-ambulance"></i>Agregar Partida</a></li> 
                        <li><a href="caducarmedicamentos.jsp"><i class="fa fa-trash"></i>Caducar Medicamento</a></li>
                        
                        <li><a href="prescripcionespendientes.jsp"><i class="fa fa-archive"></i>Prescripciones Pendientes</a></li>
                    </ul>
                </li>
                 <li>
                     <a href="revisarstock.jsp"><i class="fa fa-table"></i> <span class="nav-label">Revisar Stock Disponible</span> 
                        <span></span></a>              
                </li>
                                 <li>
                     <a href="reservamedicamento.jsp"><i class="fa fa-table"></i> <span class="nav-label">Reserva Medicamento</span> 
                        <span></span></a>              
                </li>
                                                <li class="active">
                     <a href="emitirInformeStock.jsp"><i class="fa fa-table"></i> <span class="nav-label">Emitir Informe De Stock</span> 
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
            <div class="col-lg-8 col-md-offset-2" style="margin-top: 30px;">
                
                <div class="panel panel-primary animated fadeIn">
                    <div class="panel-heading">
                        EMITIR INFORME DE STOCK
                    </div>
                    <div class="panel-body" style="height: auto;">

                    <div class="ibox-content" style="background-color: #fff; height: auto;" id="resumen">
                        <div class="item">
             <div class="row animated fadeInRight">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Prescripciones</h5>
                        <div class="col-sm-3 col-sm-offset-3">
                            <button type="button" id="btnPrescripcion" class="btn btn-block btn-primary">Generar Prescripción</button> 
                        </div> 
                    </div>
           
             <div class="ibox-content">
                    <div class="table-responsive">
                        <table id="tabla_informeStock" class="table table-responsive table-striped table-bordered table-hover dataTables-example" >
                            <thead>
                                <tr>
                                    <th>Medicamento</th>
                                    <th>Stock Actual</th>
                                    <th>Reservados</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody id="informeStock">
                                
                            </tbody>
                        </table>
                    </div>
            </div>
        </div>
     </div>
  </div>
                         <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                                               
                    </div>
                </div>
            </div><!--FINAL PANEL-->   
           
            
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
                <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
    
        <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
     <!-- Jquery Rut -->
    <script src="js/jquery.Rut.js" type="text/javascript"></script>
 
<!-- chosen -->
    <script src="js/plugins/chosen/chosen.jquery.js"></script>
    <script src="js/plugins/dataTables/datatables.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>
    <script src="js/fnReloadAjax.js"></script>
  
   <!-- Switchery -->
   <script src="js/plugins/switchery/switchery.js"></script>
       <!-- Data picker -->
   <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>

    <!-- NouSlider -->
   <script src="js/plugins/nouslider/jquery.nouislider.min.js"></script>
   <script src="js/plugins/wNumb.js" type="text/javascript"></script>
        <!-- Toastr -->
    <script src="js/plugins/toastr/toastr.min.js"></script>

</body>

</html>
<script>
    $(document).ready(function() {
    
    // datatable
              $('#tabla_informeStock').dataTable( {
 
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
        
      
    }}, "ajax" : "RequestHelper?accion=informeStock",
            "columns": [
                        { "data": "medicamento"},
                        { "data": "stock" },
                        { "data": "reservados" },
                        { "data": "estado" }],
             "columnDefs": [
                 {
                      "targets": [0], 
                      "data": "medicamento", 
                      "render": function(data, type, full) { 
                          return "<a><strong>" + data.toUpperCase()+ "</strong></a>";
                      }
                  }],
    } );
    
    });//fin document rdy
</script>

