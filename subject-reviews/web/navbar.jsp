<%-- 
    Document   : header
    Created on : Dec 4, 2017, 6:31:48 PM
    Author     : 56070031
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    setInterval(function () {

        $.post("manageReport", function (responseText) {
            if (responseText !== "0") {
                $("#nofi").attr('data-badge', responseText);
                $("#nofi").fadeIn();
                
            } else if (responseText === "0") {
                $("#nofi").fadeOut();
            }
        });

    }, 1000);
</script>
<html>

    <body>
        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("login.jsp");
            }

        %>

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container" style="width: 90%;">
                <div class="navbar-header"> 
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> 
                        <span class="sr-only">Toggle navigation</span> 
                        <span class="icon-bar"></span> 
                        <span class="icon-bar"></span> 
                        <span class="icon-bar"></span> 
                    </button> 
                    <a class="navbar-brand" href="home.jsp" style="font-family: 'tcm';font-size: 27px; color: #e9573e">KMITL review</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" style="overflow-x: hidden;">

                    <ul class="nav navbar-nav">
<!--                        <li <c:if test="${pageContext.request.servletPath=='/home.jsp'}">class="active"</c:if>>
                                <a href="home.jsp">Home</a>
                            </li>-->

                            <li <c:if test="${pageContext.request.servletPath=='/subject_type.jsp'}">class="active"</c:if>><a href="subject_type.jsp">Subject type</a></li>
                        <li <c:if test="${pageContext.request.servletPath=='/addSubject.jsp'}">class="active"</c:if>>
                                <a href="addSubject.jsp">Add Subject</a>
                            </li>
                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><form class="navbar-form " action="searchServlet" method="POST">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search" name="search" value="">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default" type="submit" style="font-size: 13px !important;">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </li>

                        <c:if test="${sessionScope.user.getUsername()=='admin'}">
                            <li <c:if test="${pageContext.request.servletPath==''}">class="active"</c:if>>
                                <a href="manageReview.jsp" >manager<span class="badge1" data-badge="" id="nofi" style="display: none"></span>
                                    </a>
                                </li>
                        </c:if>
                        <li class="dropdown">
                            <a href="javascript:void(0)"  class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user.getUsername()}   <span class="caret"></span></a>
                            <ul class="dropdown-menu" style="min-width: 130px;">
                                <li><a href="viewHistory" style="font-size: 20px;">Profile<span class="glyphicon glyphicon-user" aria-hidden="true" style="float: right"></span></a></li>
                                <li><a href="logoutServlet" style="font-size: 20px;">logout<span class="glyphicon glyphicon-log-out" aria-hidden="true" style="float: right"></span></a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
</html>
