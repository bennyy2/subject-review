<%-- 
    Document   : showSubject
    Created on : Oct 21, 2017, 10:56:17 PM
    Author     : Benny
--%>
<%@page import="Model.Subject"%>
<%@page import="Model.Review"%>
<%@page import="Model.UserProfile"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>

        <title>Review subject</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
            function reportFunction(i, u) {
                $("#bc").attr("class", "fa fa-bug");
                $("#" + i).css("visibility", "hidden");
                $("#textarea" + i).css("visibility", "hidden");
                var text = $('textarea[name="' + i + '1"]').val();
                $.post("ReportServlet", {text: text, user_report: "${sessionScope.user.getId()}", review_id: i, user_post: u}, function (responseText) {
                    $("#msg" + i).text(responseText).fadeIn(1);
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
        <%@ include file = "navbar.jsp" %>
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
                <div class="content">
                    <div id="report${show.getReview_id()}" style="float: right;position: relative;width: 0;height: 90px;">
                        <p id="msg${show.getReview_id()}" style="position: absolute;right: 15px;width: 120px;"></p><i class="fa fa-bug" aria-hidden="true" onclick="showForm('${show.getReview_id()}')" id="bc" style="float: right;"></i>
                        <a href="javascript:void(0)" id="${show.getReview_id()}" onclick="reportFunction('${show.getReview_id()}', '${show.getUser()}'); return false;" style="position: absolute;margin-top: 75px;right: 0px;visibility: hidden;">Send</a>
                        <textarea id="textarea${show.getReview_id()}" name="${show.getReview_id()}1"  style="position: absolute;right: 0px;height: 60px;width: 300px; visibility: hidden;margin-top: 15px; resize: none;padding: 5px;" placeholder="Write report . . ."></textarea>
                    </div>
                    <p>${show.getContent()}</p> 
                    <p><b>Score : </b>${show.getScore()}</p>


                    <c:choose>
                        <c:when test="${show.getDisplay_user()=='no'}">
                            <p><b>User : </b>Unknow User</p>
                        </c:when>    
                        <c:otherwise>
                            <p><b>User : </b>${show.getUser()}</p>
                        </c:otherwise>
                    </c:choose>
                    <p><b>Time : </b> ${show.getDate()}</p>
                    <hr>
                </div>
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
                    <input type="radio" name="score" value="0" /> 0
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
