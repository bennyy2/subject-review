<%-- 
    Document   : header
    Created on : Dec 4, 2017, 6:31:48 PM
    Author     : 56070031
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="home.jsp" >KMITL review</a>
                </div>

                <ul class="nav navbar-nav">
                    <li <c:if test="${pageContext.request.servletPath=='/home.jsp'}">class="active"</c:if>><a href="home.jsp">Home</a></li>

                    <li <c:if test="${pageContext.request.servletPath=='/subject_type.jsp'}">class="active"</c:if>><a href="subject_type.jsp">subject type</a></li>
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

                <ul class="nav navbar-nav navbar-right">
                    <c:if test="${sessionScope.user.getUsername()=='admin'}">
                        <li <c:if test="${pageContext.request.servletPath==''}">class="active"</c:if>>
                            <a href="manageReview.jsp">manager
                            </a>
                        </li>
                    </c:if>
                    <li >
                        <a href="profile.jsp">${sessionScope.user.getUsername()}
                        </a>
                    </li>
                </ul>

            </div>
            
        </nav>
</html>
