<%-- 
    Document   : dashboard
    Created on : 16-04-2017, 19:46:03
    Author     : **Jorge Carrenca**
--%>
<%@page import="cl.cesfam.ENTITY.Medicamento"%>
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

    <title>HOME | Caducar</title>
     <link rel="shortcut icon" href="img/img_custom/LOGO-CESFAM-ORIGINAL-2.jpg">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
   <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/plugins/chosen/chosen.css" rel="stylesheet">
   



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
                  <li  class="active">
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">Administrar</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="agregarmedicamento.jsp"><i class="fa fa-medkit"></i>Agregar Medicamento</a></li>
                        <li class="active"><a href="caducarmedicamentos.jsp"><i class="fa fa-trash"></i>Caducar Medicamento</a></li>
                        
                    </ul>
                </li>
                 <li>
                     <a href="revisarstock.jsp"><i class="fa fa-table"></i> <span class="nav-label">Revisar Stock Disponible</span> 
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

            <div class="wrapper wrapper-content animated fadeIn">

                     <!--INICIO PANEL-->
            <div class="col-lg-6 col-md-offset-3" style="margin-top: 10px;">
                
                <div class="panel panel-primary animated fadeIn">
                    <div class="panel-heading">
                        CADUCAR MEDICAMENTO
                    </div>
                    <div class="panel-body" style="height: auto;">
                        <form id="caducar_form" name="cadForm">
                            <!--                            INICIO CB MEDICAMENTO-->
                            <div class="form-group">                               
                                <label class="col-sm-4 col-md-3 col-md-offset-1 control-label" style="margin-top: 23px;">Medicamento</label>
                                <div class="col-sm-6 col-XS-10  col-md-5" style="margin-top: 23px;">
                                    <select data-placeholder="Seleccione el medicamento" class="chosen-select" tabindex="2"  id="ddlMedicamentos"  name="ddlPartida">
                                        <option value="0">Seleccione Medicamento</option>
                                        <%
                                            try {
                                                //LISTA DE MEDICAMENTOS    
                                                List<cl.cesfam.ENTITY.Medicamento> medicamentos = new cl.cesfam.DAO.MedicamentoDAO().getList();

                                                if (medicamentos != null) {
                                                    for (Medicamento item : medicamentos) {%> <option value="<%=item.getIdMedicamento()%>"><%=item.getNombreMedicamento()%></option>               
                                        <%}
                                                }
                                            } catch (Exception e) {

                                                out.println(e.getMessage());
                    } %>
                                    </select>
                                </div>
                            </div>
                            <!--                                    FIN CB MEDICAMENTO-->
                            
                             <!--                            INICIO CB PARTIDA-->
                            <div class="form-group">                               
                                <label class="col-sm-4 col-md-3 col-md-offset-1 control-label" style="margin-top: 23px;">Partida</label>
                                <div class="col-sm-6 col-XS-10  col-md-5" style="margin-top: 23px;">
                                    <select data-placeholder="Seleccione el Partida" class="chosen-select" tabindex="2"  id="ddlPartida"  name="ddlPartida">
                                        <option value="0">Seleccione Partida</option>
                                        <%
                                            try {
                                                //LISTA DE MEDICAMENTOS    
                                                List<cl.cesfam.ENTITY.Partida> partida = new cl.cesfam.DAO.PartidaDAO().getList();

                                                if (partida != null) {
                                                    for (cl.cesfam.ENTITY.Partida item : partida) {%> <option value="<%=item.getIdPartida() %>"><%=item.getNombrePartida() %></option>               
                                        <%}
                                                }
                                            } catch (Exception e) {

                                                out.println(e.getMessage());
                    } %>
                                    </select>
                                </div>
                            </div>
                            <!--                                    FIN CB PARTIDA-->
                            <div class="clearfix"></div>
                            
                             <div class="form-group" style="margin-top: 23px;">
                                 <label class="col-lg-3 col-lg-offset-1 control-label">Cantidad</label>
                                 <div class="col-lg-3">
                                     <input type="number" placeholder="Unidades" id="txtCantidad" class="form-control">
                                 </div>
                             </div>
                            <div class="clearfix"></div>
                             <div class="form-group" style="margin-top: 23px;">
                                 <label class="col-sm-3  col-lg-offset-1 control-label">Motivo de caducación </label>
                                 <div class="col-md-5">
                                     <select class="form-control m-b" id="ddlMotivo" name="ddlMotivo">
                                         <option value="">Seleccione un Motivo</option>
                                        <option value="1">Medicamento Vencido</option>
                                        <option value="2">Mal Estado</option>
                                        <option value="3">Envase Dañado</option>
                                        <option value="4">Otro</option>
                                    </select>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary" id="btnCaducar">Caducar Medicamento</button>
                            </form>
                          </div>
                </div>
            </div><!--FINAL PANEL-->   
           
             <div class="ibox-content">
                        <div class="table-responsive">
                        <table id="tabla_caducar" class="table table-responsive table-striped table-bordered table-hover dataTables-example" >
                            <thead>
                                <tr>
                                    <th>Medicamento</th>
                                    <th>Funcionario</th>
                                    <th>Cantidad Caducada</th>
                                    <th>Fecha Caducación</th>
                                    <th>Motivo Caducación</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                       </table>
                      </div>
            </div>




            </div>
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

 
   <!-- Toastr -->
    <script src="js/plugins/toastr/toastr.min.js"></script>
<!-- chosen -->
    <script src="js/plugins/chosen/chosen.jquery.js"></script>
    <script src="js/plugins/dataTables/datatables.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>




  
</body>
</html>
  <script>
        $(document).ready(function() {
   
    var config = {
                '.chosen-select'           : {},
                '.chosen-select-deselect'  : {allow_single_deselect:true},
                '.chosen-select-no-single' : {disable_search_threshold:10},
                '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'}
                }
                
            for (var selector in config) {
                $(selector).chosen(config[selector]);
               
            }
            
            
            
            
            $("#btnCaducar").click(function(){
                  
                 //          INICIO AJAX CADUCAR		
             var cantidad = $("#txtCantidad").val();
             var motivo = $("#ddlMotivo").val();
             var partida = $("#ddlPartida").val();
             var medicamento = $("#ddlMedicamentos").val();
             var idFuncionario = "<%=userSession.getIdUsuario()%>";
             var accion = "CaducarMedicamento";
             
             var parametros = {"txtCantidad" : cantidad,"ddlMotivo" : motivo,"ddlPartida" : partida,
                 "ddlMedicamentos" : medicamento, "idFuncionario" : idFuncionario, "accion" : accion};

            $.ajax({
                data:  parametros,
                url:   'RequestHelper',
                type:  'post',
                 success: function(responseText) 
                 {
                    alert(responseText);
                 }
                });
//            FIN //          INICIO AJAX CADUCAR 
                  
             });
            
            
            
            
            
            
            
            
            
            
            // datatable
              $('#tabla_caducar').dataTable( {
 
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
 
    
    }}, "ajax" : "",
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


        
        });
    </script>