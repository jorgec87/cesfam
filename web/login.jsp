<%-- 
    Document   : login
    Created on : 15-04-2017, 17:39:20
    Author     : **Jorge Carrenca**
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CESFAM | login</title>
<!--     Logo de cesfam en la pestaña-->
    <link rel="shortcut icon" href="img/img_custom/LOGO-CESFAM-ORIGINAL-2.jpg">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
         <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>

<body class="gris_textura-bg">
   


    <div class="loginColumns animated fadeInDown">
        <div class="row">

            <div class="col-md-6">
                <h2 class="font-bold">Bienvenido a CESFAM</h2>
                <img id="test" class="hidden-xs hid" src="img/img_custom/LOGO-CESFAM.png" width="200" height="200" alt="LOGO-CESFAM-ORIGINAL-2"/>

                <p>
                    Establecimientos de atención primaria
                </p>

            </div>
            <div class="col-md-6">
                <div class="ibox-content">
                    <form class="m-t" role="form" method="post"  id="form" action="LoginServlet">
                        <div class="form-group">
                            <input id="rut" type="text" placeholder="Rut"  class="form-control valid" name="txtRut" aria-required="true" aria-invalid="false">
                            <label id="number-error" class="error" for="number" style="display: none;"></label>
                        </div>
                       <div class="form-group">
                           <input type="password" placeholder="Contraseña" class="form-control valid" name="txtPass" aria-required="true" aria-invalid="false">
                           <label id="password-error" class="error" for="password" style="display: none;"></label>
                       </div>
                        <button type="submit" id="btnLogin" class="btn btn-outline btn-success block full-width m-b">Ingresar</button>

                       

                    </form>
                    <p class="m-t">
                        <small>Centros de Salud Familiar &copy; 2017</small>
                    </p>
                </div>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-md-6">
                Copyright Duoc-UC
            </div>
            <div class="col-md-6 text-right">
               <small>© 2017</small>
            </div>
        </div>
    </div>
    
    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
     <!-- Jquery Rut -->
    <script src="js/jquery.Rut.js" type="text/javascript"></script>
     <!-- Toastr -->
    <script src="js/plugins/toastr/toastr.min.js"></script>

    
   

</body>

</html>

<script>
        $(document).ready(function(){
            //funcion formatear rut
            $("#rut").Rut({format_on: 'keyup'});

            
   //Agregar validacion de rut a Jquery validate
            jQuery.validator.addMethod("Rut", function(value, element){
             if ($.Rut.validar(value)) {
                 return true;
             } else {
                 return false;
             };
                }, "El RUT ingresado no es válido"); 


          // Muestra un alert diciendo que el rut es correcto.
           $("#rut").Rut({
              on_success: function(){ 
                $("#number-error").text(""); 
                $("#number-error").css("display","none");
                $("#rut").addClass("valid");
                 $("#rut").removeClass("error"); 
               
              }});
          
            //funcion que valida campos
            $("#form").validate({
                rules: {
                    txtPass: {
                        required: true,
                        minlength: 4
                    },
                    txtRut: {
                        required: true,
                        number: false,
                        Rut : true
                    }
                }
            });
          
             
 <%    
        //mensaje de error en los datos de ingreso
        if (request.getParameter("error") != null) 
                {
                   int error = Integer.parseInt(request.getParameter("error"));
                    
                   if (error == 1) {  
                      %>   

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
                          toastr.error("Los datos de ingreso no son váidos", "Favor verificar!");

 <% } }%> 
           
       });
</script>
