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
        <meta charset="utf-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Profile</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="home.jsp">KMITL review</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="home.jsp">Home</a></li>

                    <li class="active"><a href="profile.jsp">${sessionScope.user.getUsername()}</a></li>
                    
                    <li><a href="subject_type.jsp">subject type</a></li>
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
        <h1>Hello </h1>
        ${sessionScope.user.getUsername()}
        ${sessionScope.user.getEmail()}
        ${sessionScope.user.getId()}
        ${sessionScope.user.getRole()}
        
        <a href="edituser.jsp">edit</a>

    </body>
</html>
<script src="js/bootstrap.js"/>
<script src="js/bootstrap.min.js"/>
