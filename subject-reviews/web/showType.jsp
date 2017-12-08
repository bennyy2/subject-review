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
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<<<<<<< HEAD
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Type</title>
=======
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <title>JSP Page</title>
>>>>>>> 40c950fab75c08611804bc1c3cee27f1e3dd20b7
    </head>
    <body>
        <%@ include file = "navbar.jsp" %>
        <h1 style="text-align: center">${requestScope.type_name}</h1><br>
        
        <a href="addSubject.jsp">Add New Subject</a><br>

        <div>
            <c:forEach var = "sub" items = "${sessionScope.allSub}">
                <div class="col-md-10" style="width: 100%">

                    <table  id="block">
                        <tr><td>
                                <br>
                                <a href="viewSubjectServlet?id=${sub.getSubject_id()}">${sub.getSubject_id()}   ${sub.getSj_name_eng()}</a><br>

                                <br>
                            </td></tr>
                    </table>
                    <br>

                </div>
            </c:forEach>
        </div>

    </body>
</html>
<script src="js/bootstrap.min.js"></script>