<%-- 
    Document   : showType
    Created on : Oct 21, 2017, 2:34:22 AM
    Author     : Benny
--%>
<%@page import="Model.Type"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="home.jsp" style="color: white">KMITL review</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="home.jsp">Home</a></li>

                    <li><a href="profile.jsp">${sessionScope.user.getUsername()}</a></li>
                    
                    <li  class="active"><a href="subject_type.jsp">subject type</a></li>
                    <li><a href="logoutServlet">logout</a></li>
                    </ul>
                
                <form class="navbar-form navbar-left" action="searchServlet" method="POST">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" name="search" value="">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
                    
            </div>
        </nav>
        <h1>${requestScope.type_name}</h1>

        <c:forEach var = "sub" items = "${sessionScope.allSub}">
            <a href="viewSubjectServlet?id=${sub.getSubject_id()}">${sub.getSubject_id()}   ${sub.getSj_name_eng()}</a><br>

        </c:forEach>

    </body>
</html>
<script src="js/bootstrap.js"/>
<script src="js/bootstrap.min.js"/>