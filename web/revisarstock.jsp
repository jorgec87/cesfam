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
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <style>
.added_item {
    font-family: "open sans";
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
  font-family: "open sans";
}
#b2{
   font-family: "open sans";  
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
                        <li ><a href="agregarmedicamento.jsp">Agregar Medicamento</a></li>
                        <li class="active"><a href="revisarstock.jsp">Revisar Stock Disponible</a></li>
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
                    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Buscar medicamento</h5>
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
                    <table class="table table-striped table-bordered table-hover dataTables-example" >
                    <thead>
                    <tr>
                        <th>Medicamento</th>
                        <th>Fabricante</th>
                        <th>presentacion</th>
                        <th>Contenido Total</th>
                        <th>Contenido en stock</th>
                    </tr>
                    <%
                    
                    try
                    {
                        
                        for(cl.cesfam.ENTITY.Medicamento tmp: cl.cesfam.DAO.MedicamentoDAO.getList())
                           
                        {
                           cl.cesfam.ENTITY.Stock stock = cl.cesfam.DAO.StockDAO.getStockById(tmp.getStock().getIdStock());
                           System.out.print("HOLA"+stock.getStock());
                           
                    %>
                    </thead>
                    <tbody>
                       <tr class="gradeC">
                        <td><%out.println( tmp.getNombreMedicamento()); %></td>
                        <td><%out.println( tmp.getFabricante()); %></td>
                        <td><%out.println( tmp.getPresentacion()); %></td>
                        <td class="center"><%out.println( tmp.getContenidoEnvase()); %></td>
                        <td class="center"><%out.println( stock.getStock()); %></td>
                       </tr> 
                    </tbody>
                  
                   
                    <%
                        }
                        
                    }
                    catch(Exception e)
                    {
                        out.println(e.getMessage());
                    }
                    %>
                    </tfoot>
                    </table>
                        </div>

                    </div>
                </div>
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
        </div>// fin wrapper
<!--    INICIO MODAL 1                  -->
   
                                    <!-- INICIO MODL BODY-->   



                                        <!--    INICIO CB COMPONENTES-->
                                        
                                        <!--                                    FIN CB COMPONENTES-->
                                        
  <!--FIN  MODAL 2-->  


    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
    
     <!-- Data Tables -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="js/plugins/dataTables/dataTables.responsive.js"></script>
    <script src="js/plugins/dataTables/dataTables.tableTools.min.js"></script>
    
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

    
    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/plugins/jeditable/jquery.jeditable.js"></script>

    <!-- Data Tables -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="js/plugins/dataTables/dataTables.responsive.js"></script>
    <script src="js/plugins/dataTables/dataTables.tableTools.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function() {
            $('.dataTables-example').dataTable({
                responsive: true,
                "dom": 'T<"clear">lfrtip',
                "tableTools": {
                    "sSwfPath": "js/plugins/dataTables/swf/copy_csv_xls_pdf.swf"
                }
            });

            /* Init DataTables */
            var oTable = $('#editable').dataTable();

            /* Apply the jEditable handlers to the table */
            oTable.$('td').editable( '../example_ajax.php', {
                "callback": function( sValue, y ) {
                    var aPos = oTable.fnGetPosition( this );
                    oTable.fnUpdate( sValue, aPos[0], aPos[1] );
                },
                "submitdata": function ( value, settings ) {
                    return {
                        "row_id": this.parentNode.getAttribute('id'),
                        "column": oTable.fnGetPosition( this )[2]
                    };
                },

                "width": "90%",
                "height": "100%"
            } );


        });

        function fnClickAddRow() {
            $('#editable').dataTable().fnAddData( [
                "Custom row",
                "New row",
                "New row",
                "New row",
                "New row" ] );

        }
    </script>
<style>
    body.DTTT_Print {
        background: #fff;

    }
    .DTTT_Print #page-wrapper {
        margin: 0;
        background:#fff;
    }

    button.DTTT_button, div.DTTT_button, a.DTTT_button {
        border: 1px solid #e7eaec;
        background: #fff;
        color: #676a6c;
        box-shadow: none;
        padding: 6px 8px;
    }
    button.DTTT_button:hover, div.DTTT_button:hover, a.DTTT_button:hover {
        border: 1px solid #d2d2d2;
        background: #fff;
        color: #676a6c;
        box-shadow: none;
        padding: 6px 8px;
    }

    .dataTables_filter label {
        margin-right: 5px;

    }
</style>