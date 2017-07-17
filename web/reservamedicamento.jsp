<%-- 
    Document   : reservamedicamento
    Created on : Jun 4, 2017, 5:31:09 PM
    Author     : Francisco
--%>

<%@page import="cl.cesfam.ENTITY.Paciente"%>
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

    <title>HOME | Agregar Partidas</title>
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
                        <li><a href="caducarmedicamentos.jsp"><i class="fa fa-trash"></i>Caducar Medicamento</a></li>
                        <li><a href="prescripcionespendientes.jsp"><i class="fa fa-archive"></i>Prescripciones Pendientes</a></li>
                    </ul>
                </li>
               <% } %>
                  
                 <li>
                     <a href="revisarstock.jsp"><i class="fa fa-table"></i> <span class="nav-label">Revisar Stock Disponible</span></a>              
                </li >
                <%if(userSession.getTipoUsuario().equals("M")){%>
                <li>

                     <a href="prescripcion.jsp"><i class="fa fa-stethoscope"></i>Generar Prescripción</a>
                </li>
               <% } %>
                <li class="active">
                     <a href="reservamedicamento.jsp"><i class="fa fa-table"></i> <span class="nav-label">Reserva Medicamento</span> 
                        <span></span></a>              
                </li>
                            <li>
                     <a href="emitirInformeStock.jsp"><i class="fa fa-table"></i> <span class="nav-label">Emitir Informe De Stock</span> 
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
                        GENERAR RESERVA
                    </div>
                    <div class="panel-body" style="height: auto;">
                        <form id="reservaForm" name="reservaForm">
<!--INICIO CB PACIENTE-->
                            <div class="form-group">                               
                                <label class="col-sm-4 col-md-3 col-md-offset-1 control-label" style="margin-top: 23px;">Nombre De Medicamento</label>
                                <div class="col-sm-6 col-XS-10  col-md-5" style="margin-top: 23px;">
                                    <select data-placeholder="Seleccione el paciente" class="chosen-select" tabindex="2"  id="ddlPaciente"  name="ddlPaciente">
                                        <option value="0">Seleccione Paciente</option>
                                        <%
                                            try {
                                                //LISTA DE MEDICAMENTOS    
                                                List<cl.cesfam.ENTITY.Paciente> paciente = new cl.cesfam.DAO.PacienteDAO().getList();

                                                if (paciente != null) {
                                                    for (Paciente item : paciente) {%> <option value="<%=item.getIdPaciente()%>"><%=item.getRutPaciente()%></option>               
                                        <%}
                                                }
                                            } catch (Exception e) {

                                                out.println(e.getMessage());
                    } %>
                                    </select>
                                </div>
                            </div>
                                     <div class="clearfix"></div>
<!--FIN CB PACIENTE-->                          
<!--INICIO CB MEDICAMENTO-->
                            <div class="form-group">                               
                                <label class="col-sm-4 col-md-3 col-md-offset-1 control-label" style="margin-top: 23px;">Nombre De Medicamento</label>
                                <div class="col-sm-6 col-XS-10  col-md-5" style="margin-top: 23px;">
                                    <select data-placeholder="Seleccione el medicamento" class="chosen-select" tabindex="2"  id="ddlMedicamentos"  name="ddlMedicamentos">
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
                                     <div class="clearfix"></div>
<!--FIN CB MEDICAMENTO-->
                             <div class="form-group" style="margin-top: 23px;">
                                 <label class="col-lg-3 col-lg-offset-1 control-label">Cantidad</label>
                                 <div class="col-lg-3">
                                     <input type="number"  placeholder="Unidades" name="txtCantidadReserva"  id="txtCantidadReserva" class="form-control">
                                 </div>
                             </div>
                            <div class="clearfix"></div>
   
                            <div class="form-group" style="margin-top: 23px;">
                                 <div class="col-lg-3">
                                     <button type="submit" class="btn btn-primary" id="btnDetPartida" style="margin-left: 200px;">Generar Reserva</button>
                                 </div>
                             </div>
                            <div class="clearfix"></div>
                            
                            </form>
                          </div>
                </div>
            </div><!--FINAL PANEL-->  
            
                    <!--FINAL PANEL-->   
                    <!--
                    <div class="ibox-content">
                        <div class="table-responsive">
                        <table id="tabla_reservas" class="table table-responsive table-striped table-bordered table-hover dataTables-example" >
                            <thead>
                                <tr>
                                    <th>Medicamento</th>
                                    <th>Paciente</th>
                                    <th>Funcionario</th>
                                    <th>Cantidad Reservada</th>
                                    <th>Fecha Reserva</th>
                                    <th>Estado Reserva</th>
                                    <th>Caducar Reserva</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                       </table>
                      </div>
            </div>
               -->       
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
    <!-- Data picker -->
   <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
    
       <!-- Toastr -->
    <script src="js/plugins/toastr/toastr.min.js"></script>
    
    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <!-- chosen -->
    <script src="js/plugins/chosen/chosen.jquery.js"></script>
    <!-- Sweet alert -->
    <script src="js/plugins/sweetalert/sweetalert.min.js"></script>
        <!-- Data picker -->
   <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
  



  
</body>
</html>
  <script>
         $(document).ready(function () {
              
        
        $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });  
                
               
                
            
                
            
            
                var config = {
                '.chosen-select'           : {},
                '.chosen-select-deselect'  : {allow_single_deselect:true},
                '.chosen-select-no-single' : {disable_search_threshold:10},
                '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'}
                }                    

                for (var selector in config) {
                $(selector).chosen(config[selector]);
                $("#ddlMedicamentos").chosen(config[selector]);
            }
                for (var selector in config) {
                $(selector).chosen(config[selector]);
                $("#ddlPaciente").chosen(config[selector]);
            }
//          INICIO DE VALIDACION PARTIDA
             //funcion que valida campos
            $("#reservaForm").validate
            ({
                rules: 
                {
                    txtCantidadReserva: {
                        required: true
                    },
                    ddlPaciente: 
                    {
                        required: true
                    },
                    ddlMedicamentos:
                    {
                        required: true        
                    }
                },
                
            submitHandler: function(form) {      
//          INICIO RESPUESTA DE CREACION DE PARTIDA		
             var cantidadReserva = $("#txtCantidadReserva").val();
             var paciente = $("#ddlPaciente").val();
             var medicamento = $("#ddlMedicamentos").val();
             var accion = "emitirReserva";
             
             var parametros = {"txtCantidadReserva" : cantidadReserva,"ddlPaciente" : paciente, 
                 "ddlMedicamentos" : medicamento,"accion" : accion};

            $.ajax({
                data:  parametros,
                url:   'RequestHelper',
                type:  'post',
                 success: function(responseText) 
                 {
                    var res = responseText;
                        if(res !== "false")
                        {
                            swal({
                                title: "Éxito!",
                                text: "Partida guardada correctamente!",
                                type: "success"
                            });
                            $(".item").empty().append('<div class="clearfix"></div>');
                            $("#ddlPartida").append("<option value="+res+">"+nombre+"</option>");
                            $("#ddlPartida").val(res);
                            $("#ddlPartida").trigger("chosen:updated");
                            $("#myModal").modal('hide');
                            $("#txtNombrePartida").val("");                         
                        }
                        else
                        {    
                            alert("Partida no creada"); 
                        }
                 }
                });
//            FIN RESPUESTA AJAX CREACION PARTIDA          

            }
//          FIN VALIDACION PARTIDA
            });
            
            });//FIN DOCUMENT READY
           
              
///////////////////////////////////////////////////////////////////////////////////////////////////////
          
    </script>