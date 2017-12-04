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
        <%@ include file = "navbar.jsp" %>


        <div>
            <c:choose>
                <c:when test="${sessionScope.subjectList==[]}">
                    <h3 style="margin-left: 15%">There are no subject that you are searching for.</h3><br>
                </c:when>    
                <c:otherwise>
                    <h3 style="margin-left: 15%">The subjects you search for..</h3><br>
                    <c:forEach var = "subject" items = "${sessionScope.subjectList}">
                        <div class="col-md-10" style="width: 100%">

                            <table  id="block">
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