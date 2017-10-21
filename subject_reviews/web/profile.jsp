<%-- 
    Document   : profile
    Created on : Oct 12, 2017, 6:43:58 PM
    Author     : Benny
--%>

<%@page import="Model.UserProfile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                       url = "jdbc:mysql://localhost:3306/kmitl_subject_database"
                       user = "root"  password = ""/>
        
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello </h1>
        ${sessionScope.user.getUsername()}
        ${sessionScope.user.getEmail()}
        ${sessionScope.user.getId()}
        ${sessionScope.user.getRole()}
        
        

    </body>
</html>
