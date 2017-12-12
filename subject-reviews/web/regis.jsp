<%-- 
    Document   : login
    Created on : Oct 4, 2017, 9:48:44 PM
    Author     : Benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <title>KMITL Subject review system</title>
    </head>
    <body>
        <img src="img/bglog.jpg" style="z-index: -1;position: fixed;top: 0px;filter:blur(5px);">
        <h1 align="center"><span style="color: #fb6e52;font-size: 100px">KMITL</span> Subject review system</h1>
        <div class="container" id="login">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <h3>Register</h3>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <form action="regisServlet" method="POST">
                                <div class="form-group">
                                    <label for="username">Username:</label>
                                    <input type="text" class="form-control" id="username" name="username" placeholder="User name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email: <span style="color: red;">*ใช้อีเมล์ของสถาบันเท่านั้น</span></label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="E-mail : example@kmitl.ac.th">
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                </div>

                                <div class="message">
                                    
                                    <label>${message}</label>
                                </div>
                                <button type="submit" value="regis" class="btn btn-default">Register</button>
                            </form>
                        </div>
                        <div class="regis">
                            <a href="login.jsp"><< Back to log in</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
<script src="js/bootstrap.min.js"></script>

