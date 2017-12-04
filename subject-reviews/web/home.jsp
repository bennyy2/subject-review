<%-- 
    Document   : home
    Created on : Oct 4, 2017, 9:44:19 PM
    Author     : Benny
--%>

<%@page import="Model.Subject"%>
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
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <%@ include file = "navbar.jsp" %>

        <div class="header">
            <div class="container text-center">
                <h1>KMITL Subject review system</h1>      
                <p>Tell me what is in your mind.</p><br><hr>
            </div>
        </div>




        <h1 style="margin-left: 50px">Top review score</h1><br>

        <%
            Review review = new Review();
            Subject subject = new Subject();
            ArrayList reviewList = new ArrayList<>();
            reviewList = review.showAllReview();
            session.setAttribute("reviewList", reviewList);

            ArrayList topList = new ArrayList<>();
            topList = subject.getTopReview();
            session.setAttribute("topList", topList);
        
            float width1 = ((subject.getTopReview().get(0)).getTotal_score()*40)/5+50;
            float width2 = ((subject.getTopReview().get(1)).getTotal_score()*40)/5+50;
            float width3 = ((subject.getTopReview().get(2)).getTotal_score()*40)/5+50;
            float width4 = ((subject.getTopReview().get(3)).getTotal_score()*40)/5+50;
            float width5 = ((subject.getTopReview().get(4)).getTotal_score()*40)/5+50;
        %>
        
        <div class="top5" style="margin-left: 4%;">
            <ul class="top5_bar">
                <li class="top5_bar_li" style="background: rgba(255, 57, 65, 0.9) !important;
                    width: <%out.print(width1);%>% !important;">${topList[0].getSj_name_eng()}<br>${topList[0].getSj_name_thai()}
                    <span class="top5_bar_hold">
                        <p class="top5_score">${topList[0].getTotal_score()}</p>
                        <span class="top5_bar_tri"></span>
                    </span>
                </li>
                <li class="top5_bar_li" style="background: rgba(255, 103, 57, 0.9) !important;
                    width: <%out.print(width2);%>% !important;">${topList[1].getSj_name_eng()}<br>${topList[1].getSj_name_thai()}
                    <span class="top5_bar_hold">
                        <p class="top5_score">${topList[1].getTotal_score()}</p>
                        <span class="top5_bar_tri"></span>
                    </span>
                </li>
                <li class="top5_bar_li" style="background: rgba(255, 218, 57, 0.9) !important;
                    width: <%out.print(width3);%>% !important;">${topList[2].getSj_name_eng()}<br>${topList[2].getSj_name_thai()}
                    <span class="top5_bar_hold">
                        <p class="top5_score">${topList[2].getTotal_score()}</p>
                        <span class="top5_bar_tri"></span>
                    </span>
                </li>
                <li class="top5_bar_li" style="    background: rgba(193, 241, 78, 0.9) !important;
                    width: <%out.print(width4);%>% !important;">${topList[3].getSj_name_eng()}<br>${topList[3].getSj_name_thai()}
                    <span class="top5_bar_hold">
                        <p class="top5_score">${topList[3].getTotal_score()}</p>
                        <span class="top5_bar_tri"></span>
                    </span>
                </li>
                <li class="top5_bar_li" style="background: rgba(29, 195, 246, 0.9) !important;
                    width: <%out.print(width5);%>% !important;">${topList[4].getSj_name_eng()}<br>${topList[4].getSj_name_thai()}
                    <span class="top5_bar_hold">
                        <p class="top5_score">${topList[4].getTotal_score()}</p>
                        <span class="top5_bar_tri"></span>
                    </span>
                </li>
            </ul>
        </div>
        <hr><br>
        <h1 style="margin-left: 50px">Recently review</h1><br>



        <div class="body2" style="padding-left: 30px; padding-right: 30px;">
            <div class="grid">
                <c:forEach var = "review" items = "${sessionScope.reviewList}">
                    <div class="box" >

                        <a href="viewSubjectServlet?id=${review.getSubject_id()}">${review.getSubject_id()}<br>
                            ${review.getSj_name()}</a><br>
                        <p style="    white-space: nowrap;
                           text-overflow: ellipsis;
                           overflow: hidden;">${review.getContent()}<p><br>
                            <c:choose>
                                <c:when test="${review.getDisplay_user()=='no'}">
                                    User : Unknow User<br>
                                </c:when>    
                                <c:otherwise>
                                    User : ${review.getUser()}
                                </c:otherwise>
                            </c:choose>

                    </div>
                </c:forEach>
            </div>
        </div>


                        <footer id="footer">
                            <p>Copyright &copy; 2017 KMITL Subject review. All rights reserved.</p>  
                        </footer>



    </body>
</html>

<script src="js/bootstrap.js"/>
<script src="js/bootstrap.min.js"/>
