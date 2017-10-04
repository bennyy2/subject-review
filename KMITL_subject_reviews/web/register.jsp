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
        <title>JSP Page</title>
    </head>
    <body>
        <form action="regisServlet" method="POST">
            username :<input type="text" name="username" value="" /><br>
            password :<input type="password" name="password" value="" /><br>
            E-mail :<input type="text" name="email" value="" /><br>
            <h3>${message}</h3>
            <input type="submit" value="register" />
            
        </form>
    </body>
</html>
