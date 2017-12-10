<%-- 
    Document   : showMajor
    Created on : Dec 8, 2017, 2:58:59 PM
    Author     : Benny
--%>

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
        <%@ include file = "navbar.jsp" %>
        <h1 style="text-align: center">วิชาเลือกคณะ</h1><br>

        <div>
            <c:forEach var = "major" items = "${sessionScope.allMajor}">
                <div class="col-md-10" style="width: 100%">

                    <table  id="block">
                        <tr><td>
                                <br>
                                <a href="viewSubjectServlet?id=${major.getMajor_id()}">${major.getMajor_name()}</a><br>

                                <br>
                            </td></tr>
                    </table>
                    <br>

                </div>
            </c:forEach>
        </div>

    </body>
</html>
<script src="js/bootstrap.js"/>
<script src="js/bootstrap.min.js"/>
