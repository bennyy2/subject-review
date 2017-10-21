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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${requestScope.type_name}</h1>

        <c:forEach var = "sub" items = "${sessionScope.allSub}">
            <a href="viewSubjectServlet?id=${sub.getSubject_id()}">${sub.getSubject_id()}   ${sub.getSj_name_eng()}</a><br>

        </c:forEach>

    </body>
</html>
