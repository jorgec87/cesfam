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

    <title>INSPINIA</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>

<body class="gris_textura-bg">

    <div class="loginColumns animated fadeInDown">
        <div class="row">

            <div class="col-md-6">
                <h2 class="font-bold">Bienvenido a CESFAM</h2>

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
                        <button type="submit" class="btn btn-outline btn-success block full-width m-b">Ingresar</button>

                        <a href="#">
                            <small>Olvidaste tu contraseña?</small>
                        </a>

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
    
    <script>
         $(document).ready(function(){
             //funcion formatear rut
             $("#rut").Rut({format_on: 'keyup'});
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
                         minlength: 8 
                     }
                 }
             });
             
        });
    </script>


</body>

</html>
