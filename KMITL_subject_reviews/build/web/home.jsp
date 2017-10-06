<%-- 
    Document   : home
    Created on : Oct 4, 2017, 9:44:19 PM
    Author     : Benny
--%>

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
        <h1>Hello ${username}</h1>
        <form action="major.jsp" method="POST">
            <select name="major">
                <sql:query dataSource = "${db}" var = "result">
                    SELECT * FROM major;
                </sql:query>
                <c:forEach var = "row" items = "${result.rows}">
                    <option>${row.major_name}</option>
                </c:forEach>
            </select>
            <input type="submit" value="ok" />
        </form>
        
        
        
    </body>
</html>
