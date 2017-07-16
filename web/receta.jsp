<%-- 
    Document   : receta
    Created on : Jun 11, 2017, 11:35:10 PM
    Author     : Francisco
--%>
<%@page import="cl.cesfam.ENTITY.Medicamento"%>
<%@page import="java.util.List"%>
<%@page import="cl.cesfam.DTO.SessionUsuario"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>HOME | Caducar</title>
     <link rel="shortcut icon" href="img/img_custom/LOGO-CESFAM-ORIGINAL-2.jpg">
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
   <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/plugins/chosen/chosen.css" rel="stylesheet">
    <style>
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

            <div id="recetaFinal">

                     <!--INICIO PANEL-->
            <div class="col-lg-6 col-md-offset-3" style="margin-top: 10px;">
                <div class="col-md-12" id="contenedorReceta">
                    <div class="row divSeparador">
                        <div class="col-md-4">
                            <img src="img/logoCesfamReceta.png" class="img-responsive" id="imgCesfam" alt=""/>          
                        </div>
                        <!--<div class="col-md-3 col-md-offset-5">
                            <img src="img/medical.png" class="img-responsive" id="imgMedic" alt=""/>   
                        </div>-->
                    </div>
                <div class="row">
                    <div class="col-md-12" id="space">
                        <label>Nombre:&nbsp</label><span>Francisco Armijo</span><label>&nbsp&nbsp|&nbsp&nbsp</label>
                        <label>Edad:&nbsp</label><span>30 años</span><label>&nbsp&nbsp|&nbsp&nbsp</label>
                        <label>Sexo:&nbsp</label><span>Masculino</span><label>&nbsp&nbsp|&nbsp&nbsp</label>
                        <label>Fecha:&nbsp</label><span>22/06/17</span>
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
            </div><!--FINAL PANEL-->            
            </div>
    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
                <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
 
   <!-- Toastr -->
    <script src="js/plugins/toastr/toastr.min.js"></script>
<!-- chosen -->
    <script src="js/plugins/chosen/chosen.jquery.js"></script>
    <script src="js/plugins/dataTables/datatables.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>
    <script src="js/fnReloadAjax.js"></script>

</body>
<script>
function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
</script>
<script language="javascript">

    $(document).ready(function() {

       $('#rblDiv input').click(function() {
//se limpian los campos
$("#LabelID").empty();
$("#LabelID").empty();
$("#LabelID").empty();
$("#LabelID").empty();
$("#LabelID").empty();
$("#LabelID").empty();
$("#LabelID").empty();
$("#LabelID").empty();
$("#LabelID").empty();
$("#LabelID").empty();
$("#LabelID").empty();
//se agregan los textos desde bdd
$("#LabelID").append("some Text");
$("#LabelID").append("some Text");
$("#LabelID").append("some Text");
$("#LabelID").append("some Text");
$("#LabelID").append("some Text");
$("#LabelID").append("some Text");
$("#LabelID").append("some Text");
$("#LabelID").append("some Text");
$("#LabelID").append("some Text");
       });
    });

</script>
</html>