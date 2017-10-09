<%-- 
    Document   : register
    Created on : Oct 4, 2017, 8:05:57 PM
    Author     : Benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/login02.css">
  <script type="text/javascript" src="javascript/login02.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KMITL Subject review system</title>
    </head>
    <body>
        <div class="cotn_principal">
  <div class="cont_centrar">

    <div class="cont_login">
      <div class="cont_info_log_sign_up">
            <div class="col_md_login">
              <div class="cont_ba_opcitiy">
                <!-- <h2>LOGIN</h2> -->  
                <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>  -->
                <button class="btn_login" onclick="cambiar_login()">LOGIN</button>
              </div>
            </div>
            <div class="col_md_sign_up">
              <div class="cont_ba_opcitiy">
                <!-- <h2>SIGN UP</h2> -->
                <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p> -->
                <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
              </div>
            </div>
      </div>


      <div class="cont_back_info">
       <div class="cont_img_back_grey">
         <!-- <img src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" alt="" /> -->
       </div>

     </div>
     <div class="cont_forms" >
      <div class="cont_img_back_">
       <!-- <img src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" alt="" /> -->
     </div>

         <div class="cont_form_login">
            <a href="#" onclick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
            <h2>LOGIN</h2>
            <form action="loginServlet" method="POST">
            <input type="text" name="username" placeholder="User" />
            <input type="password" name="password" placeholder="Password" />
            <button class="btn_login" onclick="cambiar_login()" type="submit">LOGIN</button>
            </form>
        </div>

        <div class="cont_form_sign_up">
            <a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
            <h2>SIGN UP</h2>
            <form action="regisServlet" method="POST">
            <input type="text" name="username" placeholder="User" />
            <input type="text" name="email"placeholder="Email" />
            <input type="password" name="password" placeholder="Password" />
            <input type="password" placeholder="Confirm Password" />
            <button class="btn_sign_up" onclick="cambiar_sign_up()" type="submit">SIGN UP</button>
            </form>
            </div>
     </div>
        <br> <h3>${message}</h3>
    </div>
  </div>
</div>

<!--        <form action="regisServlet" method="POST">
            username :<input type="text" name="username" value="" /><br>
            password :<input type="password" name="password" value="" /><br>
            E-mail :<input type="text" name="email" value="" /><br>
            
            <input type="submit" value="register" />
            
        </form>-->
    </body>
</html>
