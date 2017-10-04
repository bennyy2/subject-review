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
        <title>JSP Page</title>
    </head>
    <body>
        <form action="loginServlet" method="POST">
            username :<input type="text" name="username" value="" />
            password :<input type="password" name="password" value="" />
            <input type="submit" value="login" /><br>
            <h3>${message}</h3>
        </form>
        Do not have an account? <a href="register.jsp">Register</a>
    </body>
</html>
