<%-- 
    Document   : register
    Created on : Oct 4, 2017, 8:05:57 PM
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
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="js/typed.js"></script>

        <title>KMITL Subject review system</title>
    </head>
    <body>
        <div id="typed-strings">
            <h1 >KMITL Subject review system</h1>
        </div>
        <h1 id="header_name"><span id="typed"></span></h1>

        <div class="container" id="login">

            <div class="row">
                <div class="col-md-6 col-md-offset-3">

                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <h3>Log in</h3>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <form action="loginServlet" method="POST">
                                <div class="form-group">
                                    <label for="username">Username:</label>
                                    <input type="text" class="form-control" id="username" name="username" placeholder="User" autofocus="autofocus">
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                </div>
                                <div class="message">
                                    <label>${message}</label>
                                </div>
                                <div class="welcome">
                                    <label>${welcome}</label>
                                </div>
                                <button type="submit" value="login" class="btn btn-default">Submit</button>
                            </form>
                        </div>
                        <div class="regis">
                            <a href="regis.jsp">create new account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
<script src="js/bootstrap.min.js"></script>
<script>
    var typed = new Typed('#typed', {
        stringsElement: '#typed-strings',
        typeSpeed: 100,
        backSpeed: 0,
        backDelay: 1000,
        fadeOut: true,
        startDelay: 2000
        
    });
</script>