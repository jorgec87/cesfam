<%-- 
    Document   : prescripcion
    Created on : 04-06-2017, 18:01:26
    Author     : **Jorge Carrenca**
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

    <title>HOME | Prescripción</title>
     <link rel="shortcut icon" href="img/img_custom/LOGO-CESFAM-ORIGINAL-2.jpg">
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="css/plugins/nouslider/jquery.nouislider.css" rel="stylesheet">
    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">
   
  <link href="css/plugins/switchery/switchery.css" rel="stylesheet">
   <style>
       .datepicker{
    z-index:100000 !important;
        } 
       #contenedorReceta
        {
            border: 3px solid black;
            border-radius: 5px;
            background-color: white;
            padding: 15px;
            min-height: 850px;
        }
        .divSeparador
        {
            border-bottom: 2px solid black;
        }
        #imgCesfam
        {
            height: 98px;
            width: 200px;
            margin-bottom: 10px;
        }
        #imgMedic
        {
            height: 98px;
            width: 100px;
            margin-left: 25px;
        }
        #space
        {
            margin-top: 10px;
            text-align: center;
        }
        #datosAdicionales
        {
            text-align: right;
            margin-top: 60px;
            position: absolute;
            width: 100%;
            bottom: 10px;
            padding-right: 60px;
            padding-bottom: 20px;
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
                        <li class="active"><a href="caducarmedicamentos.jsp"><i class="fa fa-trash"></i>Caducar Medicamento</a></li>
                        <li><a href="prescripcionespendientes.jsp"><i class="fa fa-archive"></i>Prescripciones Pendientes</a></li>
                    </ul>
                </li>
               <% } %>
                  
                 <li>
                     <a href="revisarstock.jsp"><i class="fa fa-table"></i> <span class="nav-label">Revisar Stock Disponible</span></a>              
                </li >
                <%if(userSession.getTipoUsuario().equals("M")){%>
                <li class="active">

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
<!--  Fin menu-->
            <div class="wrapper wrapper-content animated fadeIn">

           
                               
               <!--    INICIO MODAL 1                  -->
    <div class="modal inmodal" id="modal_1" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated fadeInDown">
              <div class="modal-header">
                  <button type="button" id="close" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-medkit modal-icon"></i>
                    <h4 class="modal-title">Paso 1</h4>
                    <small class="font-bold">Ingrese rut del paciente.</small>
                </div>
                <div class="modal-body"> 
<!--                    inicio M-body-->
                    
<!--                          MODULO BUSCAR PACIENTE       -->
                         
                             <form id="form">
                                 <div class="form-group">
                                     <input id="rut" type="text" placeholder="Rut Paciente"  class="form-control valid" name="txtRut" aria-required="true" aria-invalid="false">
                                     <label id="number-error" class="error" for="number" style="display: none;"></label>
                                 </div>
                                 <div>
                                     <button style="margin-left: 10px"  class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong><span class="fa fa-search"></span> Buscar</strong></button>
                                     <button class="btn btn-sm btn-primary pull-right m-t-n-xs" id="btnLimpiar" type="button"><strong>Limpiar</strong></button>
                                 </div>
                             </form>
                             <div class="row">
                                <div class="col-sm-12 datos_paciente">
<!--                     AQUI SE CARGAN LOS DATOS DEL PACIENTE-->
                                 </div>
                             </div>
                      
<!--                       FIN MODULO BUSCAR PACIENTE -->



<!--                    final M-body-->    
                </div>
                    <div class="modal-footer">
                        <button type="button" id="cancelar_1" class="btn btn-white" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="btnSiguiente_1">Siguiente</button>
                     </div>
                
            </div>
        </div>
    </div>
<!--FIN MODAL 1-->     



               <!--    INICIO MODAL 2                  -->
    <div class="modal inmodal" id="modal_2" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated fadeInDown">
              <div class="modal-header">
                  <button type="button" id="close" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-medkit modal-icon"></i>
                    <h4 class="modal-title">Paso 2</h4>
                    <small class="font-bold">Requiere proxima evaluacion?</small>
                </div>
                <div class="modal-body"> 
<!--                    inicio M-body-->
<!--                           MODULO  PROXIMA EVALUACION-->
                          
                    <input type="checkbox" id="prox_evaluacion" class="js-switch js-check-change" />
                     <div class="form-group" id="data_1">                               
                    <label class="control-label" style="margin-top: 20px;">Fecha prox. evaluación</label>
                   <div class="input-group date">
                       <span class="input-group-addon "><i class="fa fa-calendar"></i></span>
                        <input type="text" class="form-control" id='txtFechaVencimiento' name="txtFechaVencimiento" value="">
                    </div>
                    </div>     
<!--                           FIN MODULO PROXIMA EVALUACION-->



<!--                    final M-body-->    
                </div>
                    <div class="modal-footer">
                        <button type="button" id="cancelar_2"  class="btn btn-white" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="btnSiguiente_2">Siguiente</button>
                     </div>
                
            </div>
        </div>
    </div>
<!--FIN MODAL 2-->   



               <!--    INICIO MODAL 3                 -->
    <div class="modal inmodal " id="modal_3" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content animated fadeInDown">
              <div class="modal-header">
                  <button type="button" id="close" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-medkit modal-icon"></i>
                    <h4 class="modal-title">Paso 3</h4>
                    <small class="font-bold">Agragar medicamentos</small>
                </div>
                <div class="modal-body"> 
<!--                    inicio M-body-->
<!--            MODULO MEDICAMENTO -->
                            <div class="col-sm-6 b-r">
                              <p>Seleccione un medicamento</p>
                               
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
                                    
                            <div class="row">
                                   <div class="form-group col-sm-9" style="margin-top: 60px;">
                                 <label class="control-label">Cantidad</label>
                                 <input type="number"  placeholder="Unidades" name="txtCantidad"  id="txtCantidad" class="form-control ">
                              </div>
                            </div>
                               </div>
<!--                            
                          FIN MODULO MEDICAMENTO

                          MODULO  PROXIMA EVALUACION-->
                                <div class="col-sm-6">
                                 <div class="row">
                                        <p style="margin-bottom: 40px;  margin-left: 10px">  Frecuencia prescripción</p>
                                        <div class="col-lg-8 col-lg-offset-1">
                                            <div id="basic_slider"></div>
                                            <span class="example-val" id="slider-padding-value-min"></span>
                                        </div>
                                    </div>
                                     <p style="margin-top: 40px;">Prescripción permanente?</p>
                                <input type="checkbox" id="permanente" class="js-switch js-check-change" />
                                <div id="duracion" class="row animated fadeInDown">
                                        <p style="margin-bottom: 40px;  margin-left: 10px; margin-top: 17px;">  Duración de la prescripción</p>
                                        <div class="col-lg-8 col-lg-offset-1">
                                            <div id="basic_slider2"></div>
                                            <span class="example-val" id="slider-padding-value-min"></span>
                                        </div>
                                    </div>
                                <div class="row" style="margin-bottom: 40px;  margin-left: 10px; margin-top: 25px;">
                                    <button  type="button" class="btn btn-primary " id="btnAgregar"> <span class="fa fa-plus"></span> Agregar Medicamento</button>

                            </div>
                               </div>
                                <div class="clearfix"></div>
<!--                           FIN MODULO PROXIMA EVALUACION-->

<!--                           TABLA MOSTRAR PRESCRIPCIONES-->
                            <div class="table-responsive">
                        <table  class="table table-responsive table-striped table-bordered table-hover dataTables-example" >
                            <thead>
                                <tr>
                                    <th>Medicamento</th>
                                    <th>Cantidad</th>
                                    <th>Frequencia</th>
                                    <th>Duración tratamiento</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody id="tabla_prescripcion">
                                

                            </tbody>
                       </table>
                      </div>

<!--                    final M-body-->    
                </div>
                    <div class="modal-footer">
                        <button type="button" id="cancelar_3"  class="btn btn-white" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="btnFinalizar">Finalizar</button>
                     </div>
                
            </div>
        </div>
    </div>
<!--FIN MODAL 3-->

<!--    INICIO MODAL 4                 -->
    <div class="modal inmodal " id="modal_4" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content animated fadeInDown">
              <div class="modal-header">
                  <button type="button" id="close" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-medkit modal-icon"></i>
                    <h4 class="modal-title">Receta Medica</h4>
                </div>
                <div class="modal-body"> 
<!--                    inicio M-body-->
                <div class="col-lg-10 col-md-offset-1" style="margin-top: 10px;">
                <div class="col-md-12" id="contenedorReceta">
                    <div class="row divSeparador">
                        <div class="col-md-4">
                            <img src="img/logoCesfamReceta.png" class="img-responsive" id="imgCesfam" alt=""/>          
                        </div>
                    </div>
                <div class="row">
                    <div class="col-md-12" id="space">
                        <label>Nombre:&nbsp</label><span id="nombrePaciente">Francisco Armijo</span><label>&nbsp&nbsp|&nbsp&nbsp</label>
                        <label>Rut:&nbsp</label><span id="rutPaciente">16.368.450-0</span><label>&nbsp&nbsp|&nbsp&nbsp</label>
                        <label>Cesfam:&nbsp</label><span>Quilicura</span><label>&nbsp&nbsp|&nbsp&nbsp</label>
                        <label>Fecha:&nbsp</label><span>07/16/2017<%%></span>
                    </div>
                </div>
                <div class="row">
                        <div class="col-md-11 col-md-offset-1">
                            <br>
                            <label>Medicamento:</label><br><span>Nombre Prueba</span>
                            <p></p>
                            <label>Periodo:</label><br><span>Tomar cada 8 horas</span>
                            <p></p>
                            <label>Frecuencia:</label><br><span>3 veces al dia</span>
                            <p></p>
                            <label>Duracion de tratamiento:</label><br><span>1 semana.</span>
                            <p></p>
                            <label>--------------------------------------------------------------------------</label>
                            <br>
                        </div>
                </div>           
                <div class="col-md-12" id="datosAdicionales">
                            <label>_________________________________</label><br>
                            <label>Doctor:&nbsp</label><label>Nombre Doctor</label><br>
                            <br>
                            <label>Direccion:&nbsp</label><label>Calle Falsa #123</label><br>
                            <label>Telefono:&nbsp</label><label>+56952382986</label><br>
                            <label>Email:&nbsp</label><label>cesfamuc@gmail.com</label><br>
                </div>
                </div>                
                    <div class="col-md-5 col-md-offset-5" style="margin-top:20px;">
                        <a style="text-align: center; color:white;" onclick="printDiv('contenedorReceta')" width="100" height="100">IMPRIMIR RECETA</a>                      
                    </div>
            </div>              
<!--  final M-body -->    
                </div>
                    <div class="modal-footer">
                        <button type="button" onclick="printDiv('contenedorReceta')" class="btn btn-primary col-md-4 col-md-offset-2" id="btnImprimir">Imprimir</button>
                        <button type="button" id="cancelar_4"  class="btn btn-white col-md-4 col-md-offset-1" data-dismiss="modal">Cancelar</button> 
                     </div>
                
            </div>
        </div>
    </div>
<!--FIN MODAL 4-->   

<!--  input hidden que guarda el id del formulaio de medicamento-->
<input type="hidden"  id="id_formulario">
    
 </div> <!--                fin de div principal-->

                
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
                        <table id="tabla_prescripciones" class="table table-responsive table-striped table-bordered table-hover dataTables-example" >
                            <thead>
                                <tr>
                                    <th>Folio</th>
                                    <th>Paciente</th>
                                    <th>Rut Paciente</th>
                                    <th>Req. Prox. Eval.</th>
                                    <th>Fecha Prox. Eval.</th>
                                    <th>Fecha Emisión</th>
                                    <th>Receta</th>
                                </tr>
                            </thead>
                            <tbody id="prescripciones">
                                
                            </tbody>
                       </table>
                      </div>
            </div>
            </div>
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
       
        //INICIALIZACIO DE VARIABLES 
          $("#txtFechaVencimiento").attr('disabled', 'disabled');
          $("#nombre").hide();
          $("#rut1").hide();
          $("#telefono").hide();
          $("#email").hide();
          $("#btnSiguiente_1").hide();
          $("#btnFinalizar").hide();
              
        //FUNCION FORMATEAR RUT
          $("#rut").Rut({format_on: 'keyup'});

        //FUNCION LIMPIAR RUT
         $("#btnLimpiar").click(function(){
             $("#rut").val("");
             $(".datos_paciente").empty();
           }); 
            
        //AGREGAR VALIDACION DE RUT A JQUERY VALIDATE
          jQuery.validator.addMethod("Rut", function(value, element){
           if ($.Rut.validar(value)) {
               return true;
           } else {
               return false;
           };
              }, "El RUT ingresado no es válido"); 
 
          //FUNCIOON  DE JQUERY VALIDATE Y AJAX BUSCAR PACIENTE
          $("#form").validate({
              rules: {
                   txtRut: {
                      required: true,
                      number: false,
                      Rut : true
                  }
              }, submitHandler: function(form) { 
                
         //    INICIO AJAX BUSCAR PACIENTE		
           var rut = $("#rut").val();
           var accion = "ObtenerPaciente";
           var parametros = {"txtRut" : rut, "accion" : accion};

          $.ajax({
              data:  parametros,
              url:   'RequestHelper',
              type:  'post',
               success: function(data) 
               {
                  if(data != "false"){
                        
                     var obj = jQuery.parseJSON( data );
                     var datos = "<div class=\"row\"><div class=\"hr-line-dashed\"></div><div class=\"col-sm-3\"><h4>Nombre</h4></div><div class=\"col-sm-7 pull-left\"><p>"+obj.nombre+"</p></div>"
                               +"</div><div class=\"row\"><div class=\"col-sm-3\"><h4>Rut</h4></div><div class=\"col-sm-7 pull-left\"><p>"+obj.rut+"</p>"
                               +"</div></div><div class=\"row\"><div class=\"col-sm-3\"><h4>Email</h4></div><div class=\"col-sm-7 pull-left\"><p>"+obj.email+"</p>"
                               +"</div></div><div class=\"row\"><div class=\"col-sm-3\"><h4>Teléfono</h4></div><div class=\"col-sm-7 pull-left\"><p>"+obj.telefono+"</p></div></div>";
                     $(".datos_paciente").empty();
                      $(".datos_paciente").append(datos);
                      $("#btnSiguiente_1").show();
              }else{
                  $(".datos_paciente").empty();
                 toastr.options = {
                            "closeButton" : true,
                            "debug": false,
                            "progressBar": true,
                            "preventDuplicates": false,
                            "positionClass": "toast-top-center",
                            "onclick": null,
                            "showDuration": "400",
                            "hideDuration": "1000",
                            "timeOut": "7000",
                            "extendedTimeOut": "1000",
                            "showEasing": "swing",
                            "hideEasing": "linear",
                            "showMethod": "fadeIn",
                            "hideMethod": "fadeOut"
                          };
                        toastr.error("No existe Paciente", "Favor verificar!");

              }
               }
              });
//            FIN //          
                
              }
          }); // FIN CONSULATA AJAX PACIENTE
          
          
          
          
    //INICIALIZACION DE SWICHT FECHA 
   var elem = document.querySelector('#prox_evaluacion');
   var switchery = new Switchery(elem, { color: '#1AB394' });
   var changeCheckbox = document.querySelector('#prox_evaluacion');

    changeCheckbox.onchange = function() {
       if (changeCheckbox.checked) {
          $("#txtFechaVencimiento").removeAttr("disabled");
      }else{
      $("#txtFechaVencimiento").attr('disabled', 'disabled');
    }};
      
      
      
      //INICIALIZACION DE SWICHT PERIODO
   var elem = document.querySelector('#permanente');
   var switchery = new Switchery(elem, { color: '#1AB394' });
   var changeCheckbox2 = document.querySelector('#permanente');

    changeCheckbox2.onchange = function() {
     if (changeCheckbox2.checked) {
         $('#duracion').hide();
      }else{
       $('#duracion').show();
      } };
      
      
      
       //TRADUCCION DE DATEPICKER A ESPAÑOL     
    $.fn.datepicker.dates['en'] = {
  days: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sabado"],
  daysShort: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
  daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
  months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
  monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
  today: "Hoy",
  clear: "Clear",
  format: "dd/mm/yyyy",
  titleFormat: "MM yyyy", /* Leverages same syntax as 'format' */
  weekStart: 0
};
                
                 //INICIALIZACION DE DATEPICKER   
            $('#data_1 .input-group.date').datepicker({
              startView: 0,
              todayBtn: "linked",
              keyboardNavigation: false,
              forceParse: false,
              autoclose: true,
              weekStart: 1
          }); 
             
             
              //INICIALIZACION DE CHOSEN SELECT
             var config = {
              '.chosen-select'           : {},
              '.chosen-select-deselect'  : {allow_single_deselect:true},
              '.chosen-select-no-single' : {disable_search_threshold:10},
              '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'}
              }
                
          for (var selector in config) {
              $(selector).chosen(config[selector]);
              $("#ddlComponentes").chosen(config[selector]);
                
          } 
            
            
            //INICIALIZACION Y CONFUGURACION DE  SLIDE
          var connectSlider = document.getElementById('basic_slider');
          var connectSlider2 = document.getElementById('basic_slider2');
            
          noUiSlider.create(connectSlider, {
                  start: 3,
                  connect: 'upper',
                 tooltips: true ,
                  connect: [true, false],
                 range: {
                      'min': 3,
                      '30%': 6,
                      '50%': 8,
                      '70%': 12,
                       'max': 24
                      },snap: true,
                      format: wNumb({
                          decimals: 0,
                          postfix: ' Hrs.',
                          prefix:'Cada '
                  })
                        
          });//            //INICIALIZACION Y CONFUGURACION DE  SLIDE
          noUiSlider.create(connectSlider2, {
                  start: 7,
                  connect: 'upper',
                  tooltips: true ,
                  connect: [true, false],
                  range: {
                      'min': 7,
                      '50%': 10,
                       'max': 20
                      },snap: true,
                     format: wNumb({
                          decimals: 0,
                          postfix: ' días.',
                          prefix:'por '
                  })
                        
          });

        //BOTON GENERAR PRESCRIPCION ABRIR MODAL
          $("#btnPrescripcion").click(function(){
              $("#modal_1").modal({ backdrop: 'static', keyboard: false }); 
            });           
            
           //BOTON CERRAR Y LIMPIAR MODAL 1
            $("#close").click(function(){
             $("#rut").val("");
             $(".datos_paciente").empty();
             $("#rut-error").hide();
             $("#rut").removeClass("error");
       });   
       
          //BOTON CANCELAR Y LIMPIAR MODAL 1
            $("#cancelar_1").click(function(){
           location.reload();
       });  
       
           //BOTON CANCELAR Y LIMPIAR MODAL 2
            $("#cancelar_2").click(function(){
            location.reload();
       });  
       
           //BOTON CANCELAR Y LIMPIAR MODAL 3
            $("#cancelar_3").click(function(){
            location.reload();
       });  
       
           //BOTON CANCELAR Y LIMPIAR MODAL 4
            $("#cancelar_4").click(function(){
            location.reload();
       }); 
       
       
      //BOTON SIGUIETE DEL PASO 1 AL PASO 2
       $("#btnSiguiente_1").click(function(){
             $("#modal_1").modal('hide');
              $("#modal_2").modal({ backdrop: 'static', keyboard: false }); 
            });  
          
        //BOTON SIGUIETE DEL PASO 2 AL PASO 3 GENERAR FORMULARIO MEDICAMENTO
      $("#btnSiguiente_2").click(function(){
             $("#modal_2").modal('hide');
              $("#modal_3").modal({ backdrop: 'static', keyboard: false }); 
              
       //    INICIO LLAMADA AJAX FORMULARIO MEDICAMENTO
           var proximaEvaluacion = document.querySelector('#prox_evaluacion');
           var rutPaciente = $("#rut").val();
           var accion = "formularioMedicamento";
           var medico = <%=userSession.getIdUsuario() %>;
           var evaluacion = 1;
           if(proximaEvaluacion.checked){
              evaluacion = 1;  
           }else{
              evaluacion = 0;  
           }
           fecha =  $("#txtFechaVencimiento").val();
           
           var parametros = {"rut_paciente" : rutPaciente, "accion" : accion, "id_medico" : medico, "requiere_evaluacion" : evaluacion
           ,"fecha_proxima_evaluacion" :fecha};

          $.ajax({
              data:  parametros,
              url:   'RequestHelper',
              type:  'post',
               success: function(data) 
               {   var obj = jQuery.parseJSON( data );
                
                  $("#id_formulario").val(obj.id_formulario_medicamento);
              }
               
              });
            
            });  
            
            
            //BOTON AGREGAR MEDICAMNETO CON LLAMADA AJAX
             $("#btnAgregar").click(function(){
            
           //    INICIO AJAX CREAR PRESCRIPCION
           var connectSlider2 = document.getElementById('basic_slider2');
           var connectSlider = document.getElementById('basic_slider');
           var prescripcionPermanente = document.querySelector('#permanente');
           var id_formulario = $("#id_formulario").val();
           var accion = "crearPrescripcion";
           var id_medicamento = $("#ddlMedicamentos").val();
           var periodo = connectSlider2.noUiSlider.get();
           var frecuencia = connectSlider.noUiSlider.get();
           var cantidad = $("#txtCantidad").val();
           var permanente = 2;
           if(prescripcionPermanente.checked){
               permanente = 1;
           }
         
            var parametros = {"id_formulario" : id_formulario, "accion" : accion, "id_medicamento" : id_medicamento, "periodo" : periodo
           ,"frecuencia": frecuencia, "cantidad":cantidad, "permanente":permanente};

          $.ajax({
              data:  parametros,
              url:   'RequestHelper',
              type:  'post',
               success: function(data) 
               {  var obj = jQuery.parseJSON( data );                  
                   
                 if(obj.id_prescripcion != null){
                      $("#btnFinalizar").show();
                    // LLENADO DE TABLA CON MEDICAMENTOS
                    if(permanente == 1){
                       periodo = "Permanente" 
                    }
                     var item = "<tr id=pre_"+obj.id_prescripcion+" >"+
 				"	<td><a href=\"#\">"+$("#ddlMedicamentos option:selected").text()+"</a></td>"+
 				"	<td>"+cantidad+"</td>"+
 				"	<td>"+frecuencia+"</td>"+
 				"	<td>"+periodo+"</td>"+
 				"	<td><a onclick=\"EliminarPrescripcion("+obj.id_prescripcion+")\" class=\"btn btn-xs btn-danger\"><i class=\"fa fa-trash\">  </i>  Eliminar</a></td>"+
 				"</tr>";
                     $("#tabla_prescripcion").append(item);
                     limpiarMedicamento();
                     
                 }
              }
               
              });
            
            });  
            
            
       //FUNCION LIMPIAR MODULO MEDICAMENTO
       function limpiarMedicamento(){
           var connectSlider2 = document.getElementById('basic_slider2');
           var connectSlider = document.getElementById('basic_slider');
           connectSlider2.noUiSlider.set(3);
           connectSlider.noUiSlider.set(3);
            $("#txtCantidad").val("");
            $("#ddlMedicamentos").val(0);
            $("#ddlMedicamentos").trigger("chosen:updated");
          
       }
            
           
           
           //  ELIMINAR PRESCRIPCION
            window.EliminarPrescripcion =  function(id){
            
                if(!confirm('¿Estás seguro que deseas Desechar Prescripcion ?')){
                    return false; 
                }
                var id_prescripcion = id;
                var accion = "eliminarPrescripcion";

                var parametros = {"id" : id_prescripcion,"accion": accion};
               
                $.ajax({
                data:  parametros,
                url:   'RequestHelper',
                type:  'post',
                 success: function(result) 
                 {
                   
                    if (result == "true") {
                  
                 
                  $("#pre_"+id_prescripcion+"").remove();
                  
                    toastr.options = {
                      "closeButton": true,
                      "debug": true,
                      "progressBar": true,
                      "preventDuplicates": false,
                      "positionClass": "toast-top-center",
                      "onclick": null,
                      "showDuration": "400",
                      "hideDuration": "600",
                      "timeOut": "2500",
                      "extendedTimeOut": "1000",
                      "showEasing": "swing",
                      "hideEasing": "linear",
                      "showMethod": "fadeIn",
                      "hideMethod": "fadeOut"
                    };
                   toastr.success("Prescripcion Eliminada correctamente", "Éxito");
                                       }   
                   
                 }
                });
             }   //ELIMINAR PRESCRIPCION
            
   
            
            
            
     //BOTON FINALIZAR FUMCION REDIRIGIR
     $("#btnFinalizar").click(function(){ 
          window.location.href = "prescripcion.jsp?res=1";
      });
    
    <%    
        //mensaje de exito de prescripcion
        if (request.getParameter("res") != null) 
                {
                   int res = Integer.parseInt(request.getParameter("res"));
                    
                   if (res == 1) {  
                      %>   

            toastr.options = {
                      "closeButton": true,
                      "debug": true,
                      "progressBar": true,
                      "preventDuplicates": false,
                      "positionClass": "toast-top-center",
                      "onclick": null,
                      "showDuration": "400",
                      "hideDuration": "600",
                      "timeOut": "2500",
                      "extendedTimeOut": "1000",
                      "showEasing": "swing",
                      "hideEasing": "linear",
                      "showMethod": "fadeIn",
                      "hideMethod": "fadeOut"
                    };
                   toastr.success("Prescripcion Generada correctamente", "Éxito");
                                          

 <% } }%> 



    // datatable
              $('#tabla_prescripciones').dataTable( {
 
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
        
      
    }}, "ajax" : "RequestHelper?accion=obtenerPrescripciones",
            "columns": [
                        { "data": "folio"},
                        { "data": "nombre_paciente" },
                        { "data": "rut" },
                        { "data": "proxima_evaluacion" },
                        { "data": "fecha_proxima_evaluacion" },
                        { "data": "fecha" },
                        { "data": "receta" }],
             "columnDefs": [
                 {
                      "targets": [0], 
                      "data": "folio", 
                      "render": function(data, type, full) { 
                          return "<a><strong>" + data+ "</strong></a>";
                      }
                  },
                    {
                      "targets": [1], 
                      "data": "nombre_paciente", 
                      "render": function(data, type, full) {
                           return  data.toUpperCase();
                      }
                  },{
                      "targets": [3], 
                      "data": "proxima_evaluacion",
                      "render": function(data, type, full) { 
                       if(data == 1){
                           return "<span class=\"label label-primary\">SI</span>";
                      }else if(data == 0){
                          return "<span class=\"label label-warning\">NO</span>";
                      }
                      }
                  },
                    {
                      "targets": [4], 
                      "data": "fecha", 
                      "render": function(data, type, full) 
                     { 
                        var prox = full.proxima_evaluacion;
                       if(prox == 1){
                           return data;
                      }else if(prox == 0)
                      {
                          return "N/A";
                      }  
                     }
                  }],
              "order": [[ 5, "desc" ]]
              
               
 
    } );




      });  //FIN DE DOCUMENT READY
                function open(){
              $("#modal_4").modal('show'); 
            };

      
      function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
</script>