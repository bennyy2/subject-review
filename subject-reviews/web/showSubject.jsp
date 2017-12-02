<%-- 
    Document   : showSubject
    Created on : Oct 21, 2017, 10:56:17 PM
    Author     : Benny
--%>
<%@page import="Model.Subject"%>
<%@page import="Model.Review"%>
<%@page import="Model.UserProfile"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>

        <title>Review subject</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
            function reportFunction(i, u) {
                $("#bc").attr("class", "fa fa-bug");
                $("#" + i).css("visibility", "hidden");
                $("#textarea" + i).css("visibility", "hidden");
                var text = $('textarea[name="' + i + '1"]').val();
                $.post("ReportServlet", {text: text, user_report: "${sessionScope.user.getId()}", review_id: i, user_post: u}, function (responseText) {
                    $("#msg" + i).text(responseText).delay(1200).fadeOut(1000);
                });


            }
            function showForm(id) {
                if ($("#bc").attr("class").toString() == "fa fa-bug") {
                    $("#bc").attr("class", "fa fa-times");
                    $("#" + id).css("visibility", "visible");
                    $("#textarea" + id).css("visibility", "visible");
                } else {
                    $("#bc").attr("class", "fa fa-bug");
                    $("#" + id).css("visibility", "hidden");
                    $("#textarea" + id).css("visibility", "hidden");
                }
            }
        </script>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="home.jsp" >KMITL review</a>
                </div>

                <ul class="nav navbar-nav">
                    <li><a href="home.jsp">Home</a></li>

                    <li class="active"><a href="subject_type.jsp">subject type</a></li>
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
        <div class="container">
            <div class="jumbotron" style="text-align: center">
                <h1>${sessionScope.subject.getSubject_id()}</h1>

                <h2>${sessionScope.subject.getSj_name_eng()}<br><br>
                    ${sessionScope.subject.getSj_name_thai()}<br><br></h2></div>

            <h3 >Description : </h3>${sessionScope.subject.getSj_description_eng()}<br><br>
            <h3>คำอธิบายรายวิชา : </h3>${sessionScope.subject.getSj_description_thai()}<br><br>
            <h3>score : </h3>${sessionScope.subject.getTotal_score()}


            <br><br><hr>
        </div>
        <div class="container" style="word-wrap: break-word;">
            <c:forEach var = "show" items = "${sessionScope.showReview}">
                <div id="report${show.getReview_id()}" style="float: right;">
                    <p id="msg${show.getReview_id()}" style="position: absolute;right: 400px;"></p><i class="fa fa-bug" aria-hidden="true" onclick="showForm('${show.getReview_id()}')" id="bc"></i>
                    <a id="${show.getReview_id()}" onclick="reportFunction('${show.getReview_id()}', '${show.getUser()}')" style="position: absolute;margin-top: 50px;right: 380px;visibility: hidden;">Send</a>
                    <textarea id="textarea${show.getReview_id()}" name="${show.getReview_id()}1"  style="position: absolute;right: 380px;height: 50px;width: 300px; visibility: hidden;"></textarea>
                </div>
                ${show.getContent()}<br> 
                Score : ${show.getScore()}<br><br>


                <c:choose>
                    <c:when test="${show.getDisplay_user()=='no'}">
                        <b>User : </b>Unknow User
                    </c:when>    
                    <c:otherwise>
                        <b>User : </b>${show.getUser()}
                    </c:otherwise>
                </c:choose>
                <b>Time : </b> ${show.getDate()}

                <br>


                <hr>
            </c:forEach><br>



        </div>

        <div class="container">
            <c:if test="${sessionScope.user.getRole() == 'student'}">
                <form action="insertReviewServlet" method="POST">
                    <div class="form-group">
                        <label for="comment">Comment:</label>
                        <textarea class="form-control" rows="5" name="text">
                        </textarea></div><br>
                    <input type="checkbox" name="disable" value="ON" />Disable  username <br><br>
                    Score : 
                    <input type="radio" name="score" checked="true" value="0" /> 0
                    <input type="radio" name="score" value="1" /> 1
                    <input type="radio" name="score" value="2" /> 2
                    <input type="radio" name="score" value="3" /> 3
                    <input type="radio" name="score" value="4" /> 4
                    <input type="radio" name="score" value="5" /> 5
                    <br><br>
                    <button type="submit" value="submit" class="btn btn-primary btn-md">submit</button>
                </form>

            </c:if>
        </div>



    </body>




</html>
