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
        <title>KMITL Subject review system</title>
    </head>
    <body>
        <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/kmitl_subject_database"
                           user = "root"  password = ""/>
        <h1>hello ${username}</h1>
        
        <% request.setCharacterEncoding("UTF-8");
            String type = (String) request.getParameter("type");%>

        <sql:query dataSource = "${db}" var = "result">
            SELECT * FROM subject where type_id = "<%= type%>";
        </sql:query>
        <c:forEach var = "row" items = "${result.rows}">
            ${row.sj_name_eng} ${row.sj_description_eng}<br><br>
        </c:forEach>
    </body>
</html>
