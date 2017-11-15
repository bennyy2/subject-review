<%-- 
    Document   : search
    Created on : Nov 3, 2017, 8:15:02 PM
    Author     : Benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Search Page</title>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="home.jsp" >KMITL review</a>
                </div>

                <ul class="nav navbar-nav">
                    <li><a href="home.jsp">Home</a></li>

                    <li class="active"><a href="subject_type.jsp">subject type</a></li>
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
                    <li >
                        <a href="profile.jsp">${sessionScope.user.getUsername()}
                        </a>
                    </li>
                </ul>

            </div>
        </nav>


        <div>
            <c:choose>
                <c:when test="${sessionScope.subjectList==[]}">
                    <h3 style="margin-left: 15%">There are no subject that you are searching for.</h3><br>
                </c:when>    
                <c:otherwise>
                    <h3 style="margin-left: 15%">The subjects you search for..</h3><br>
                    <c:forEach var = "subject" items = "${sessionScope.subjectList}">
                        <div class="col-md-10" >

                            <table  id="block" style="margin-left: 15%">
                                <tr><td>
                                        <br>
                                        <a href="viewSubjectServlet?id=${subject.getSubject_id()}" >
                                            ${subject.getSubject_id()}<br>
                                            ${subject.getSj_name_eng()}
                                            ${subject.getSj_name_thai()}<br>

                                        </a>
                                        <br>
                                    </td></tr>
                            </table>
                            <br>

                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>



        </div>

    </body>
</html>
<script src="js/bootstrap.js"/>
<script src="js/bootstrap.min.js"/>