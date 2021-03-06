<%-- 
    Document   : agregarStock
    Created on : 16-04-2017, 15:34:23
    Author     : Francisco
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

    <title>CESFAM | Agregar Stock</title>
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
    <!-- this page specific styles -->
	<link rel="stylesheet" type="text/css" href="css/libs/nifty-component.css"/>
      

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
                        <li  class="active"><a href="agregarmedicamento.jsp"><i class="fa fa-medkit"></i>Agregar Medicamento</a></li>
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
                                                <li>
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
                        INFORMACION DE MEDICAMENTO
                    </div>
                    <div class="panel-body" style="height: auto;">
                        
                            <!--                            INICIO CB MEDICAMENTO-->
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
                                <div class="col-sm-1  col-md-1" style="margin-top: 20px; margin-left: -25px;">
                                    <button class="btn btn-outline col-xs-offset-1 btn-primary dim" id="btnMedicina" type="button"><i class="fa fa-plus"></i></button>
                                </div>
                            </div>
                            <!--                                    FIN CB MEDICAMENTO-->
                    <div class="ibox col-md-10 col-lg-offset-1" style="margin-top: 15px; height: auto;">
                    <div class="ibox-title">
                        <h5>Componentes</h5>
                        <div class="pull-right add" >
                            <a class="fa fa-plus-square" id="agregar" style="color: #1ab394; ">
                                <b id="b2">Agregar</b>
                            </a>
                        </div>
                    </div> 
                    <div class="ibox-content" style="background-color: #fff; height: auto;" id="resumen">
                        <div class="item">
                <!--               Carga de componetes por Ajax                     -->
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
<!--    INICIO MODAL 1                  -->
    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <form id="medForm" name="medForm">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-medkit modal-icon"></i>
                    <h4 class="modal-title">Ingreso de medicamentos</h4>
                    <small class="font-bold">Ingrese todos los datos para la creacion de el medicamento.</small>
                </div>
                <div class="modal-body"> 
<!--                    inicio M-body-->
                    <div class="form-group">
                        <label>Nombre</label> 
                        <input type="text" name="txtNombreMed" placeholder="Ingrese nombre de medicamento" class="form-control" id="txtNombreMed">
                    </div>
                    <div class="form-group">
                        <p><b>Tipo de presentacion</b></p>
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="SelectSolid" value="1" name="radioInline" checked="">
                                            <label for="SelectSolid">Solida</label>
                                        </div>
                                        <div class="radio radio-inline">
                                            <input type="radio" id="SelectLiq" value="2" name="radioInline">
                                            <label for="SelectLiq">Liquida</label>
                                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contenido Total</label>
                    <div class="input-group m-b">
                        <input type="number" placeholder="Ingrese el contenido total del envase" class="form-control" name="txtContenido" id="txtContenido">
                         <span class="input-group-addon" id="txtMedida">UN.</span>
                    </div>
                    </div>
                    <div class="form-group"><label>Fabricante</label> <input type="text" placeholder="Ingrese fabricante del medicamento" class="form-control" name="txtFabricante" id="txtFabricante">
                    </div>
<!--                    final M-body-->    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" id="btnIngresarMed">Ingresar Medicamento</button>
                </div>
                </form>
            </div>
        </div>
    </div>
<!--FIN MODAL-->
                    <!--INICIO MODAL 2-->
                    <div class="modal inmodal" id="myModaL2" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content animated bounceInRight">
                            <form class="" id="composicionForm" name="composicionForm">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <i class="fa fa-eyedropper modal-icon"></i>
                                    <h4 class="modal-title">Agregar Componente</h4>
                                    <small class="font-bold">Ingrese todos los datos para agregar el componente</small>
                                </div>
                                <div class="modal-body">
                                    <!-- INICIO MODL BODY-->   



                                        <!--    INICIO CB COMPONENTES-->
                                        <div class="form-group">                               
                                            <label class="control-label" >Seleccion de componente  </label>

                                            <select data-placeholder="Seleccione componente" class="chosen-select"  tabindex="2" id="ddlComponentes"  name="ddlComponentes">
                                                <option value="0">Seleccione componente</option>
                                                <%
                                                    try {
                                                        //LISTA DE COMPONENTES   
                                                        List<cl.cesfam.ENTITY.Componente> componentes = new cl.cesfam.DAO.ComponenteDAO().getList();

                                                        if (componentes != null) {
                                                            for (Componente item : componentes) {%> <option value="<%=item.getIdComponente()%>"><%=item.getNombreComponente()%></option>               
                                                <%}
                                                        }
                                                    } catch (Exception e) {

                                                        out.println(e.getMessage());
                                                                        }%>
                                            </select>
                                        </div>
                                        <!--                                    FIN CB COMPONENTES-->
                                        <div class="form-group">
                                            <label>Contenido Total</label>
                                            <div class="input-group m-b">
                                                <input type="number" placeholder="Ingrese cantidad" class="form-control" name="txtMg" id="txtMg">
                                                <span class="input-group-addon">MG.</span>
                                            </div>
                                        </div>
                                 </div><!--  FIN MODL BODY-->  
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary" id="btnIngresarComposicion">Agregar</button>
                                </div>
                               </form>
                            </div>
                        </div>
                    </div>
  <!--FIN  MODAL 2-->  


    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

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
                $("#ddlComponentes").chosen(config[selector]);
                
            }
           
            
            $("#btnMedicina").click(function(){
              $("#myModal").modal();    
            });            
            
            $("#SelectSolid").click(function(){
              $("#txtMedida").text("UN");    
            });   
            
            $("#SelectLiq").click(function(){
              $("#txtMedida").text("ML");    
            });  
            
//          INICIO DE VALIDACION MEDICAMENTO
             //funcion que valida campos
            $("#medForm").validate
            ({
                rules: 
                {
                    txtNombreMed: {
                        required: true
                    },
                    txtContenido: {
                        required: true
                    },
                    txtFabricante: {
                        required: true
                    }
                },
            submitHandler: function(form) {      
//          INICIO RESPUESTA DE CREACION DE MEDICAMENTO		
             var nombre = $("#txtNombreMed").val();
             var presentacion = $("input[name='radioInline']:checked").val();
             var contenido = $("#txtContenido").val();
             var fabricante = $("#txtFabricante").val();
             var accion = "registrarRemedio";
             
             var parametros = {"txtNombreMed" : nombre,"radioInline" : presentacion,"txtContenido" : contenido,
                 "txtFabricante" : fabricante, "accion" : accion};

            $.ajax({
                data:  parametros,
                url:   'RequestHelper',
                type:  'post',
                 success: function(responseText) 
                 {
                    var res = responseText;
                        if(res != "false")
                        {
                            swal({
                                title: "Éxito!",
                                text: "Medicamento guardado correctamente!",
                                type: "success"
                            });
                            $(".item").empty().append('<div class="clearfix"></div>');
                            $("#ddlMedicamentos").append("<option value="+res+">"+nombre+"</option>");
                            $("#ddlMedicamentos").val(res);
                            $("#ddlMedicamentos").trigger("chosen:updated");
                            $("#myModal").modal('hide');
                            $("#txtNombreMed").val("");
                            $("#txtContenido").val("");
                            $("#txtFabricante").val("");
                            
                        }
                        else
                        {    
                            alert("Medicamento no creado"); 
                        }
                 }
                });
//            FIN RESPUESTA AJAX CREACION MEDICAMENTO          

            }
//          FIN VALIDACION MEDICAMENTO
            });
            
//          INICIO DE VALIDACION COMPOSICION
             //funcion que valida campos
            $("#composicionForm").validate
            ({
                rules: 
                {
                    txtMg: {
                        required: true
                    }
                },     
            submitHandler: function(form) {                
//          INICIO RESPUESTA DE CREACION DE COMPOSICION	
             var componente = $("#ddlComponentes").val();
             var mg = $("#txtMg").val();
             var medicamento = $("#ddlMedicamentos").val();
             var accion = "RegistrarComposicion";
             
             var parametros = {"ddlComponentes" : componente,"txtMg" : mg,"ddlMedicamentos" : medicamento,"accion" : accion};

            $.ajax({
                data:  parametros,
                url:   'RequestHelper',
                type:  'post',
                 success: function(item) 
                 {  
                     var obj = jQuery.parseJSON( item );
                        
                    
                     if(item != null)
                        {
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
                     toastr.success("Componente agregado correctamente!", "Éxito");
                            
                            $("#myModaL2").modal('hide');
                            $(".item").prepend("<div id=\"c-"+obj.id_composicion+"\" class=\"added_item\">"+obj.nombre_componente
                                +" ("+obj.mg+"mg)<a class=\"inherit_color\" onclick=\"EliminarComponente("+obj.id_composicion+")\" href=\"#\"> <i class=\"fa fa-times\"></i></a></div>");                                                                                     
                            $("#txtMg").val("");
                            $("#txtFabricante").val(""); 
                            $("#ddlComponentes").val("0");
                            $("#ddlComponentes").trigger("chosen:updated");
                        }
                        else
                        {    
                            alert("Composicion no creada"); 
                        }
                 }
                });
//            FIN RESPUESTA AJAX COMPOSICION
            }
//          FIN VALIDACION COMPOSICION
            });     
            
            // Agregar componente
            
             $("#agregar").click(function()
             {
                 if ($("#ddlMedicamentos").val() != 0) 
                 {
                     $("#myModaL2").modal();  
                 }
                 else
                 {
                        toastr.options = {
                                  closeButton: true,
                                  progressBar: true,
                                  showMethod: 'slideDown',
                                  timeOut: 4000
                              };
                              toastr.error('Debe Seleccionar un medicamento', 'Alerta !');  

                 }
            });

//            ELIMINAR COMPONENTE
            window.EliminarComponente =  function(id){
            
                if(!confirm('¿Estás seguro que deseas eliminar el Componente '+$("#c-"+id+"").text()+' ?')){
                    return false; 
                }
                var id_composicion = id;
                var accion = "EliminarComposicion";

                var parametros = {"id" : id_composicion,"accion": accion};
               
                $.ajax({
                data:  parametros,
                url:   'RequestHelper',
                type:  'post',
                 success: function(result) 
                 { if (result == "true") {
                   $("#c-"+id+"").remove();
                  
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
                   toastr.success("Componente eliminado correctamente", "Éxito");
                                       }   
                   
                 }
                });
                
            
            }

  // CAMBIA LOS COMPONENTES SEGÚN LA SELECCIÓN DE MEDICAMENTO
              $('#ddlMedicamentos').on('change', function(e) {
               
                //  INICIO RESPUESTA DE OBTENER COMPONENTES	
             var id = $("#ddlMedicamentos").val();
             var accion = "obtenercomposicion";
            
             var parametros = {"id" : id,"accion": accion};

            $.ajax({
                data:  parametros,
                url:   'RequestHelper',
                type:  'post',
                 success: function(result) 
                 {    
                      $(".added_item").remove();
                      var myObject = JSON.parse(result);
  
                    for( var i=0; i< myObject.data.length ; i++){

                        $(".item").prepend("<div id=\"c-"+myObject.data[i].id_composicion+"\" class=\"added_item\">"+myObject.data[i].nombre
                                +" ("+myObject.data[i].cantidad+"mg)<a class=\"inherit_color\" onclick=\"EliminarComponente("+myObject.data[i].id_composicion+")\" href=\"#\"> <i class=\"fa fa-times\"></i></a></div>");
                        

                     } //fin for
                 }
                });
//        
//            FIN RESPUESTA AJAX
            
              });
            
            



            });//FIN DOCUMENT READY
           
        
        </script>
