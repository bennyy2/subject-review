<%-- 
    Document   : major
    Created on : Oct 7, 2017, 2:24:35 AM
    Author     : Benny
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/kmitl_subject_database"
                           user = "root"  password = ""/>
        <h1>Hello ${major}</h1>
    </body>
</html>
