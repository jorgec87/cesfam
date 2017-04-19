<%-- 
    Document   : agregarStock
    Created on : 16-04-2017, 15:34:23
    Author     : Francisco
--%>
<%@page import="cl.cesfam.DTO.SessionUsuario"%>
<%    
	cl.cesfam.DTO.SessionUsuario userSession = (cl.cesfam.DTO.SessionUsuario)request.getSession(false).getAttribute("usuario");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Agregar Stock</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">

</head>

<body class="skin-1">

    <div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="img/profile_small.jpg" />
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%=userSession.getNombreUsuario() %></strong>
                             </span> <span class="text-muted text-xs block">Software Developer <b class="caret"></b></span> </span> </a>
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
                    <a href="dashboard.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">Home</span> 
                        <span></span></a>              
                </li>
                <li class="active">
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">Administrar</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li class="active"><a href="sgregarmedicamento.jsp">Agregar Medicamento</a></li>
                        <li><a href="revisarstock.jsp">Revisar Stock Disponible</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </nav>

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">              
                <li>
                    <a href="LogoutServlet">
                        <i class="fa fa-sign-out"></i> Log out
                    </a>
                </li>
            </ul>

        </nav>
        </div>
            <!--INICIO PANEL-->
            <div class="col-lg-8 col-md-offset-2" style="margin-top: 30px;">
                
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        INFORMACION DE MEDICAMENTO
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal">
                            <div class="form-group">                               
                                <label class="col-sm-4 col-md-4 control-label" style="margin-top: 23px;">Nombre De Medicamento</label>
                                <div class="col-sm-6  col-md-5" style="margin-top: 23px;">
                                    <select data-placeholder="Seleccione el medicamento" class="chosen-select" tabindex="2" style=" min-width: 270px;">
                                        <option value="">Seleccione el medicamento</option>
                                        <option value="United States">Penedol</option>
                                        <option value="United Kingdom">Cachiaspirina</option>
                                        <option value="Afghanistan">ASDF</option>
                                    </select>
                                </div>
                                <div class="col-sm-1  col-md-1" style="margin-top: 20px; margin-left: -25px;">
                                    <button class="btn btn-outline col-xs-offset-1 btn-primary dim" id="btnMedicina" type="button"><i class="fa fa-plus"></i></button>
                                </div>
                            </div>
                        </form>                            
                    </div>
                </div>
            </div>
            <!--FINAL PANEL-->           
        <div class="footer">
            <div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>
            <div>
                <strong>Copyright</strong> Example Company &copy; 2014-2015
            </div>
        </div>

        </div>
        </div>
<!--    INICIO MODAL                   -->
    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-medkit modal-icon"></i>
                    <h4 class="modal-title">Ingreso de medicamentos</h4>
                    <small class="font-bold">Ingrese todos los datos para la creacion de el medicamento.</small>
                </div>
                <div class="modal-body"> 
                    
                    <div class="form-group">
                        <label>Nombre</label> <input type="text" placeholder="Ingrese nombre de medicamento" class="form-control">
                    </div>
                    <div class="form-group">
                        <p><b>Tipo de presentacion</b></p>
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="SelectSolid" value="option1" name="radioInline" checked="">
                                            <label for="SelectSolid">Solida</label>
                                        </div>
                                        <div class="radio radio-inline">
                                            <input type="radio" id="SelectLiq" value="option2" name="radioInline">
                                            <label for="SelectLiq">Liquida</label>
                                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contenido Total</label>
                    <div class="input-group m-b">
                         <input type="number" placeholder="Ingrese el contenido total del envase" class="form-control">
                         <span class="input-group-addon" id="txtMedida">UN.</span>
                    </div>
                    </div>
                    <div class="form-group"><label>Fabricante</label> <input type="text" placeholder="Ingrese fabricante del medicamento" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Ingresar Medicamento</button>
                </div>
            </div>
        </div>
    </div>
<!--FIN MODAL-->
    


    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <!-- chosen -->
    <script src="js/plugins/chosen/chosen.jquery.js"></script>
    

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
            
            
            });
           
        
        </script>