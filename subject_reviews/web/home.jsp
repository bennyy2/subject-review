<%-- 
    Document   : home
    Created on : Oct 4, 2017, 9:44:19 PM
    Author     : Benny
--%>

<%@page import="Model.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KMITL Subject review system</title>
        <meta charset="utf-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#" >KMITL review</a>
                </div>

                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>

                    <li><a href="subject_type.jsp">subject type</a></li>
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

        <div class="header">
            <div class="container text-center">
                <h1>KMITL Subject review system</h1>      
                <p>Tell me what is in your mind.</p><br><hr>
            </div>
        </div>




        <!--        <h1 style="text-align: center">Recent Review</h1><br>-->
        
        <%
        Review review = new Review();
        ArrayList reviewList = new ArrayList<>();
        reviewList = review.showAllReview();
        session.setAttribute("reviewList", reviewList);
        %>
        

        <div>
            <c:forEach var = "review" items = "${sessionScope.reviewList}">
                <div class="col-md-4">

                    <table  id="block" >
                        <tr><td>
                                <br>
                                <a href="viewSubjectServlet?id=${review.getSubject_id()}">${review.getSubject_id()}</a><br>
                                <a href="viewSubjectServlet?id=${review.getSubject_id()}">${review.getSj_name()}</a><br>
                                ${review.getContent()}<br>
                                <c:choose>
                                    <c:when test="${review.getDisplay_user()=='no'}">
                                        User : Unknow User<br>
                                    </c:when>    
                                    <c:otherwise>
                                        User : ${review.getUser()}<br>
                                    </c:otherwise>
                                </c:choose><br>
                            </td></tr>
                    </table>
                    <br>

                </div>
            </c:forEach>
        </div>
        
        










<!--                <footer id="footer">
                    <p>Copyright &copy; 2017 KMITL Subject review. All rights reserved.</p>  
                </footer>-->



    </body>
</html>

<script src="js/bootstrap.js"/>
<script src="js/bootstrap.min.js"/>
