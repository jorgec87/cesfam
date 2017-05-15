<%-- 
    Document   : dashboard
    Created on : 16-04-2017, 19:46:03
    Author     : **Jorge Carrenca**
--%>
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

    <title>HOME | Dashboard</title>
     <link rel="shortcut icon" href="img/img_custom/LOGO-CESFAM-ORIGINAL-2.jpg">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
     <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Morris -->
    <link href="css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
   



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
                             </span> <span class="text-muted text-xs block">Medico <b class="caret"></b></span> </span> </a>
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
                <li class="active">
                    <a href="dashboard_M.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">Home</span> 
                        <span></span></a>              
                </li>
                <li class="">
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">Administrar</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li class=""><a href="agregarmedicamento.jsp"><i class="fa fa-medkit"></i>Agregar Medicamento</a></li>
                        <li class=""><a href="caducarmedicamentos.jsp"><i class="fa fa-trash"></i> <span class="nav-label">Caducar Medicamento</span><span></span></a></li>
                        
                    </ul>
                </li>
                <li>
                    <a href="revisarstock.jsp"><i class="fa fa-table"></i>Revisar Stock Disponible</a>
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

                <div class="p-w-md m-t-sm">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="widget style1 navy-bg">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <i class="fa fa-medkit fa-5x"></i>
                                    </div>
                                    <div class="col-xs-8 text-right">
                                        <span> TOTAL MEDICAMENTOS </span>
                                        <h2 class="font-bold"><span id="m_s" class="timer m_s" data-from="0" data-to="0" data-speed="1500" data-refresh-interval="50">
                                            </span></h2>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <div class="widget style1 red-bg">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <i class="fa fa-medkit fa-5x"></i>
                                    </div>
                                    <div class="col-xs-8 text-right">
                                        <span> MEDICAMENTOS SIN STOCK </span>
                                        <h2 class="font-bold"><span id="m_ss" class="timer" data-from="0" data-to="0" data-speed="1500" data-refresh-interval="50">
                                            </span></h2>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <div class="widget style1 lazur-bg">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <i class="fa fa-user fa-5x"></i>
                                    </div>
                                    <div class="col-xs-8 text-right">
                                        <span> PACIENTES ATENDIDOS EN EL MES</span>
                                        <h2 class="font-bold"><span id="m_u" class="timer" data-from="0" data-to="124" data-speed="1500" data-refresh-interval="50">
                                            </span></h2>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    </div>

                <div class="row" style="margin-top: 50px">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Pacientes atendidos por año </h5>
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
                                <div id="morris-one-line-chart"></div>
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

    <script src="js/jquery.countTo.js"></script>
    <!-- Morris -->
    <script src="js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="js/plugins/morris/morris.js"></script>
   

    
   <!-- Toastr -->
    <script src="js/plugins/toastr/toastr.min.js"></script>


    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>




    <script>
        $(document).ready(function() {
   
   $.getJSON("RequestHelper?accion=ObtenerMedicamentosStock" , function( result ) {
         
	 if(result.data != null){
         $('#m_s').attr("data-to",result.data); 
         $('#m_s').countTo({}); 
         $('#m_ss').countTo({});
         $('#m_u').countTo({});
        
	}

   });
   
     $.getJSON("RequestHelper?accion=ObtenerMedicamentosStock" , function( result ) {
        
        if(result.total_medicamentos != null){
         $('#m_s').attr("data-to",result.total_medicamentos); 
         $('#m_s').countTo({}); 
        }
        
        if(result.total_medicamentos != null){
        $('#m_ss').attr("data-to",result.total_sin_stock); 
        $('#m_ss').countTo({}); 
        }

   });
   
     $('#m_u').countTo({});
       
           Morris.Line({
        element: 'morris-one-line-chart',
            data: [
                { year: '2008', value: 5 },
                { year: '2009', value: 10 },
                { year: '2010', value: 8 },
                { year: '2011', value: 22 },
                { year: '2012', value: 8 },
                { year: '2014', value: 10 },
                { year: '2015', value: 5 }
            ],
        xkey: 'year',
        ykeys: ['value'],
        resize: true,
        lineWidth:4,
        labels: ['Value'],
        lineColors: ['#1ab394'],
        pointSize:5,
    });



        
        });
    </script>
</body>
</html>
