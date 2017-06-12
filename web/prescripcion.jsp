<%-- 
    Document   : prescripcion
    Created on : 04-06-2017, 18:01:26
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
                        <li><a href="agregarpartida.jsp"><i class="fa fa-ambulance"></i>Agregar Partida</a></li> 
                        <li class="active"><a href="caducarmedicamentos.jsp"><i class="fa fa-trash"></i>Caducar Medicamento</a></li>
                        
                    </ul>
                </li>
                 <li>
                     <a href="revisarstock.jsp"><i class="fa fa-table"></i> <span class="nav-label">Revisar Stock Disponible</span></a>              
                </li>
                  <li>
                     <a href="prescripcion.jsp"><i class="fa fa-stethoscope"></i>Generar Prescripción</a>
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
                <div class="row">
    
                
         <!--inicio panel buscar paciemte-->
         <div class="col-lg-12">
             <div class="ibox float-e-margins">
                 <div class="ibox-title">
                     <h5>Formulario de Farmacia</h5>

                 </div>
                 <div class="ibox-content">
                     <div class="row">
 <!--                         MODULO BUSCAR PACIENTE-->       
                         <div class="col-sm-3 b-r">
                             <h3 class="m-t-none m-b">Paso 1</h3>
                             <p>Ingrese rut del paciente</p>
                             <form id="form">
                                 <div class="form-group">
                                     <input id="rut" type="text"   class="form-control valid" name="txtRut" aria-required="true" aria-invalid="false">
                                     <label id="number-error" class="error" for="number" style="display: none;"></label>
                                 </div>
                                 <div>
                                     <button style="margin-left: 10px" class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>Buscar</strong></button>
                                     <button class="btn btn-sm btn-primary pull-right m-t-n-xs" id="btnLimpiar" type="button"><strong>Limpiar</strong></button>
                                 </div>
                             </form>
                             <div class="row">
                                 <div class="col-sm-12 datos_paciente">
<!--                                        AQUI SE CARGAN LOS DATOS DEL PACIENTE-->
                                 </div>
                             </div>
                         </div>
<!--                       FIN MODULO BUSCAR PACIENTE--> 
                                 
<!--                          MODULO  PROXIMA EVALUACION-->
                            <div class="col-sm-2 b-r">
                                <h3 class="m-t-none m-b">Paso 2</h3>
                                <p>Requiere proxima evaluacion?</p>
                                <input type="checkbox" id="prox_evaluacion" class="js-switch js-check-change" />
                                 <div class="form-group" id="data_1">                               
                                <label class="control-label" style="margin-top: 23px;">Fecha prox. evaluación</label>
                               <div class="input-group date">
                                    <span class="input-group-addon "><i class="fa fa-calendar"></i></span>
                                    <input type="text" class="form-control" id='txtFechaVencimiento' name="txtFechaVencimiento" value="">
                                </div>
                               
                               </div>
                             </div>
<!--                           FIN MODULO PROXIMA EVALUACION-->

<!--                           MODULO MEDICAMENTO -->
                            <div class="col-sm-3 ">
                                <h3 class="m-t-none m-b">Paso 3</h3>
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
                                    <p style="margin-bottom: 40px; margin-top: 20px; margin-left: 10px">  Frecuencia prescripción</p>
                                <div class="col-lg-8 col-lg-offset-1">
                                    <div id="basic_slider"></div>
                                    <span class="example-val" id="slider-padding-value-min"></span>
                                </div>
                            </div>
                               </div>
                            
<!--                          FIN MODULO MEDICAMENTO-->

<!--                          MODULO  PROXIMA EVALUACION-->
                            <div class="col-sm-4">
                               <p>Duración del tratamiento</p>
                                <input type="checkbox" id="prox_evaluacion" class="js-switch js-check-change" />
                             </div>
<!--                           FIN MODULO PROXIMA EVALUACION-->

 </div>

<!--frecuencia prescripcion
* tipo prescripcion
* duracion tratamiento
* estado-->

                           
                </div>
            </div>
              </div>  
           
           </div>
                
                
                
                
                
                
                
            
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Medicamentos</h5>
                    </div>
           
             <div class="ibox-content">
                        <div class="table-responsive">
                        <table id="tabla_caducar" class="table table-responsive table-striped table-bordered table-hover dataTables-example" >
                            <thead>
                                <tr>
                                    <th>Medicamento</th>
                                    <th>Funcionario</th>
                                    <th>Cantidad Caducada</th>
                                    <th>Partida</th>
                                    <th>Fecha Caducación</th>
                                    <th>Motivo Caducación</th>
                                    <th>Desechar</th>
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
</body>
</html>
  <script>
        $(document).ready(function() {
             $("#txtFechaVencimiento").attr('disabled', 'disabled');
            $("#nombre").hide();
                    $("#rut1").hide();
                     $("#telefono").hide();
                      $("#email").hide();
   
        
        //funcion formatear rut
            $("#rut").Rut({format_on: 'keyup'});


           $("#btnLimpiar").click(function(){
               $("#rut").val("");
               $(".datos_paciente").empty();
             }); 
            
   //Agregar validacion de rut a Jquery validate
            jQuery.validator.addMethod("Rut", function(value, element){
             if ($.Rut.validar(value)) {
                 return true;
             } else {
                 return false;
             };
                }, "El RUT ingresado no es válido"); 
 
            //funcion que valida campos
            $("#form").validate({
                rules: {
                     txtRut: {
                        required: true,
                        number: false,
                        Rut : true
                    }
                }, submitHandler: function(form) { 
                
                 //          INICIO AJAX PACIENTE		
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
                       var datos = "<div class=\"row\"><div class=\"col-sm-3\"><h4>Nombre</h4></div><div class=\"col-sm-7 pull-left\"><p>"+obj.nombre+"</p></div>"
                                 +"</div><div class=\"row\"><div class=\"col-sm-3\"><h4>Rut</h4></div><div class=\"col-sm-7 pull-left\"><p>"+obj.rut+"</p>"
                                 +"</div></div><div class=\"row\"><div class=\"col-sm-3\"><h4>Email</h4></div><div class=\"col-sm-7 pull-left\"><p>"+obj.email+"</p>"
                                 +"</div></div><div class=\"row\"><div class=\"col-sm-3\"><h4>Teléfono</h4></div><div class=\"col-sm-7 pull-left\"><p>"+obj.telefono+"</p></div></div>";
                       $(".datos_paciente").empty();
                        $(".datos_paciente").append(datos);
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
//            FIN //          INICIO AJAX PACIENTE
                
                }
            });
            
     var elem = document.querySelector('.js-switch');
     var switchery = new Switchery(elem, { color: '#1AB394' });
        
          var changeCheckbox = document.querySelector('.js-check-change');

      changeCheckbox.onchange = function() {
          
       
        if (changeCheckbox.checked) {
            $("#txtFechaVencimiento").removeAttr("disabled");
            
        }else{
         $("#txtFechaVencimiento").attr('disabled', 'disabled');
    
}
      };
               
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
                
                
                 $('#data_1 .input-group.date').datepicker({
                startView: 0,
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true,
                weekStart: 1
            }); 
             
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
            
            
            
            var connectSlider = document.getElementById('basic_slider');

            noUiSlider.create(connectSlider, {
                    start: 3,
                    connect: 'upper',
                    tooltips: true ,
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
                        
            });


         
                  


            
            


        
        });
    </script>