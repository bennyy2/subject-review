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
        <title>KMITL Subject review system</title>
    </head>
    <body>
    <head>
        <meta charset="utf-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">KMITL review</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="home.jsp">Home</a></li>
                    <li><a href="profile.jsp">${username}</a></li>
                    <li><a href="major.jsp">subject</a></li>
                </ul>
                <form class="navbar-form navbar-left">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </nav>

        <div class="header">
            <div class="container text-center">
                <h1>KMITL Subject review system</h1>      
                <p>Tell me what is in your mind.</p>
            </div>
        </div>
                    
                    <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/kmitl_subject_database"
                           user = "root"  password = ""/>
        <h1>Hello ${username}</h1>
        <form action="major.jsp" method="POST">
            <select name="type">
                <sql:query dataSource = "${db}" var = "result">
                    SELECT * FROM type;
                </sql:query>
                <c:forEach var = "row" items = "${result.rows}">
                    <option value="${row.type_id}">${row.type_name}</option>
                </c:forEach>
            </select>

            <input type="submit" value="ok" />
        </form>



        <footer class="container-fluid text-center">
            <p>Copyright &copy; 2017 KMITL Subject review. All rights reserved.</p>  
        </footer>

        

    </body>
</html>

<script src="js/bootstrap.js"/>
<script src="js/bootstrap.min.js"/>
