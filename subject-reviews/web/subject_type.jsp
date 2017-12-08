<%-- 
    Document   : subject_type
    Created on : Nov 3, 2017, 4:54:27 PM
    Author     : Benny
--%>

<%@page import="Model.UserProfile"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject type</title>
        <meta charset="utf-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@ include file = "navbar.jsp" %>
        <h1 style="text-align: center">วิชาสอนบริการ</h1><br><hr>

        <div class="welcome" style="text-align: center">
            <label>${message}</label>
        </div>

        <div>
            <c:forEach var = "type" items = "${sessionScope.allType}">
                <div class="col-xs-6">

                    <table  id="block" >
                        <tr>
                            <td>
                                <br>
                                <c:choose>
                                    <c:when test="${type.getType_id() == '15'}">
                                        <a href="viewMajorServlet" >${type.getType_name()}</a><br>
                                    </c:when>    
                                    <c:otherwise>
                                        <a href="viewTypeServlet?id=${type.getType_id()}&name=${type.getType_name()}" >${type.getType_name()}</a><br>
                                    </c:otherwise>
                                </c:choose>


                                <br>
                            </td>
                        </tr>
                    </table>
                    <br>

                </div>
            </c:forEach>
        </div>
    </body>
</html>
<script src="js/bootstrap.js"/>
<script src="js/bootstrap.min.js"/>
