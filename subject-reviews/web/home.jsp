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
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KMITL Subject review system</title>
        <meta charset="utf-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.theme.default.css" rel="stylesheet" type="text/css"/>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2//2.0.0-beta.2.4/owl.carousel.min.js"></script>
        <script src="js/jquery.fullPage.min.js"></script>
        <script src="js/noframework.waypoints.min.js"></script>

    </head>

    <%
        Review review = new Review();
        Subject subject = new Subject();
        ArrayList reviewList = new ArrayList<>();
        reviewList = review.showAllReview();
        session.setAttribute("reviewList", reviewList);

        ArrayList topList = new ArrayList<>();
        topList = subject.getTopReview();
        session.setAttribute("topList", topList);

        float width1 = ((subject.getTopReview().get(0)).getTotal_score() * 100) / 5;
        float width2 = ((subject.getTopReview().get(1)).getTotal_score() * 100) / 5;
        float width3 = ((subject.getTopReview().get(2)).getTotal_score() * 100) / 5;
        float width4 = ((subject.getTopReview().get(3)).getTotal_score() * 100) / 5;
        float width5 = ((subject.getTopReview().get(4)).getTotal_score() * 100) / 5;
    %>
    <body>
        <%@ include file = "navbar.jsp" %>
        <div id="fullpage">
            <section class="vertical-scrolling">
                <div class="header" style="overflow: hidden;position: absolute;">

                    <div class="text-center" style="padding-top: 15%">
                        <p style="font-family: 'tcm';font-size: 50px !important;color: white;"><span style="color: #e9573e;font-size: 85px;" >KMITL</span> Subject review system</p>      
                        <p style="font-family: 'srb';font-size: 30px !important;color: white;">ระบบรีวิววิชาเลือกในสถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</p>
                    </div>
                    <div id="godown" align="center">
                        <a href="#secondSection"><span class="glyphicon glyphicon-menu-down" aria-hidden="true" style="color: #ffffff;"></span></a>
                    </div>
                </div>
                <div class="bg"></div>
            </section>
            <section class="vertical-scrolling" id="test">
                <div style="background-color: white;padding-top: 6%;height: -webkit-fill-available;" data-anchor="page2">
                    <h1 style="margin-left: 50px" align="center">Top review score</h1><br>
                    <div class="topReview" style="padding: 0 10% 0 10%;">
                        <a href="viewSubjectServlet?id=${topList[0].getSubject_id()}">${topList[0].getSj_name_eng()} ${topList[0].getSj_name_thai()}</a>
                        <div class="progress" >
                            <div class="progress-bar progress-bar-success1" style="width: <%=width1%>%;">

                            </div>
                        </div>
                        <a href="viewSubjectServlet?id=${topList[1].getSubject_id()}">${topList[1].getSj_name_eng()} ${topList[1].getSj_name_thai()}</a>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success2" style="width: <%=width2%>%">

                            </div>
                        </div>
                        <a href="viewSubjectServlet?id=${topList[2].getSubject_id()}">${topList[2].getSj_name_eng()} ${topList[2].getSj_name_thai()}</a>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success3" style="width: <%=width3%>%">

                            </div>
                        </div>
                        <a href="viewSubjectServlet?id=${topList[3].getSubject_id()}">${topList[3].getSj_name_eng()} ${topList[3].getSj_name_thai()}</a>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success4" style="width: <%=width4%>%">

                            </div>
                        </div>
                        <a href="viewSubjectServlet?id=${topList[4].getSubject_id()}">${topList[4].getSj_name_eng()} ${topList[4].getSj_name_thai()}</a>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success5" style="width: <%=width5%>%">

                            </div>
                        </div>
                    </div>

                    <br>
                </div>
            </section>
            <section class="vertical-scrolling">
                <div class="carousel-wrap" style="background-color: #e6e6e6;height: -webkit-fill-available;padding-top: 6%;" data-anchor="page3">
                    <br>
                    <h1 align="center">Recently review</h1><br>
                    <div class="owl-carousel">
                        <c:forEach var = "review" items = "${sessionScope.reviewList}">
                            <div class="item" >
                                <div class="initem">
                                    <a href="viewSubjectServlet?id=${review.getSubject_id()}" style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">${review.getSubject_id()}<br>
                                        ${review.getSj_name()}</a><hr style="width: 80%;">

                                    <br>

                                    <p style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden; font-size: 30px;">${review.getContent()}<p>
                                        <br>


                                    <hr style="width: 80%;">
                                    <p><c:choose>
                                            <c:when test="${review.getDisplay_user()=='no'}">
                                                User : Unknow User<br>
                                            </c:when>    
                                            <c:otherwise>
                                                User : ${review.getUser()}
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                </div>

            </section>
        </div>




    </body>
</html>

<script src="js/bootstrap.min.js"></script>
<script>

</script>

<script src="js/jsdown.js"></script>