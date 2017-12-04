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
        <%@ include file = "navbar.jsp" %>
        <h1>Profile ${sessionScope.user.getUsername()}</h1><a href="edituser.jsp">edit</a>
        Username : ${sessionScope.user.getUsername()}<br>
        Email : ${sessionScope.user.getEmail()}<br>
        ID : ${sessionScope.user.getId()}<br>
        Role : ${sessionScope.user.getRole()}<br>
        
        <h1>Review History</h1>
        
        <c:forEach var = "review" items = "${sessionScope.showHistory}">
                Content : ${review.getContent()}<br>
                Date : ${review.getDate()}<br>
                Score : ${review.getScore()}<br>
                <c:choose>
                        <c:when test="${review.getDisplay_user()=='no'}">
                            Status : Hiding post
                        </c:when>    
                        <c:otherwise>
                            Status : Showing
                        </c:otherwise>
                </c:choose><br>
                Date : ${review.getDate()}<br>
                Subject : ${review.getSubject_id()} ${review.getSj_name()}<br>
                <hr>
        </c:forEach><br>
       
        
        
        

    </body>
</html>
<script src="js/bootstrap.js"/>
<script src="js/bootstrap.min.js"/>
