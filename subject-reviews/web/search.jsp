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
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <title>Search Page</title>
    </head>
    <body>
        <%@ include file = "navbar.jsp" %>


        <div>
            <c:choose>
                <c:when test="${sessionScope.subjectList==[]}">
                    <h3 style="margin-left: 15%">There are no subject that you are searching for.</h3><br>
                </c:when>    
                <c:otherwise>
                    <h2 style="margin-left: 15%">The subjects you search for..  ${sessionScope.search}</h2>
                    <ul id="myUL">
                        <c:forEach var = "subject" items = "${sessionScope.subjectList}">
                            <li>
                                <a href="viewSubjectServlet?id=${subject.getSubject_id()}" style="text-align: center">
                                    ${subject.getSubject_id()}<br>
                                    ${subject.getSj_name_eng()}
                                    ${subject.getSj_name_thai()}<br>

                                </a>
                            </li>
                        </c:forEach>
                    </ul>>
                </c:otherwise>
            </c:choose>



        </div>

    </body>
</html>
<script src="js/bootstrap.min.js"></script>