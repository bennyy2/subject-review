<%-- 
    Document   : profile
    Created on : Oct 12, 2017, 6:43:58 PM
    Author     : Benny
--%>

<%@page import="Model.UserProfile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
            function editReview(rID, d, s) {
                $("#test").text(rID);
                var strTextarea = "<textarea class='form-control' rows='5' name='text'>" + $("#C" + rID).text() + "</textarea>";
                if (d === 'yes') {
                    var display = "<br><input type='checkbox' name='disable' value='yes' />Disable  username <br>";
                } else {
                    var display = "<br><input type='checkbox' name='disable' value='no' />Disable  username <br>";
                }
                if (s === '0') {
                    var score = "<br><input type='radio' name='score' checked='true' value='0' checked=''/> 0<input type='radio' name='score' value='1' /> 1<input type='radio' name='score' value='2' /> 2<input type='radio' name='score' value='3' /> 3<input type='radio' name='score' value='4' /> 4<input type='radio' name='score' value='5' /> 5<br>";
                } else if (s === '1') {
                    var score = "<br><input type='radio' name='score' checked='true' value='0' /> 0<input type='radio' name='score' value='1' checked=''/> 1<input type='radio' name='score' value='2' /> 2<input type='radio' name='score' value='3' /> 3<input type='radio' name='score' value='4' /> 4<input type='radio' name='score' value='5' /> 5<br>";
                } else if (s === '2') {
                    var score = "<br><input type='radio' name='score' checked='true' value='0' /> 0<input type='radio' name='score' value='1' /> 1<input type='radio' name='score' value='2' checked=''/> 2<input type='radio' name='score' value='3' /> 3<input type='radio' name='score' value='4' /> 4<input type='radio' name='score' value='5' /> 5<br>";
                } else if (s === '3') {
                    var score = "<br><input type='radio' name='score' checked='true' value='0' /> 0<input type='radio' name='score' value='1' /> 1<input type='radio' name='score' value='2' /> 2<input type='radio' name='score' value='3' checked=''/> 3<input type='radio' name='score' value='4' /> 4<input type='radio' name='score' value='5' /> 5<br>";
                } else if (s === '4') {
                    var score = "<br><input type='radio' name='score' checked='true' value='0' /> 0<input type='radio' name='score' value='1' /> 1<input type='radio' name='score' value='2' /> 2<input type='radio' name='score' value='3' /> 3<input type='radio' name='score' value='4' checked=''/> 4<input type='radio' name='score' value='5' /> 5<br>";
                } else if (s === '5') {
                    var score = "<br><input type='radio' name='score' checked='true' value='0' /> 0<input type='radio' name='score' value='1' /> 1<input type='radio' name='score' value='2' /> 2<input type='radio' name='score' value='3' /> 3<input type='radio' name='score' value='4' /> 4<input type='radio' name='score' value='5' checked=''/> 5<br>";
                }
                var Bclick = "<a href='#' onclick='save(" + '"' + rID + '"' + ");'>save</a><hr>";
                $("#review" + rID).html(strTextarea + display + score + Bclick);



            }
            function save(rID) {
                $.post("editReview", {text: $('[name=text]').val(), disable: $('[name=disable]').val(), score: $('[name=score]:checked').val(), review_id: rID}, function (responseText) {

                    $("#review" + rID).html(responseText);///.delay(1200).fadeOut(1000);
                });
//                $("#test").text($('[name=text]').val());

            }

        </script>
        <title>Profile</title>
    </head>
    <body>
        <%@ include file = "navbar.jsp" %>
        <h1>Hi... ${sessionScope.user.getUsername()}</h1><a href="edituser.jsp">edit</a>
        Username : ${sessionScope.user.getUsername()}<br>
        Email : ${sessionScope.user.getEmail()}<br>
        ID : ${sessionScope.user.getId()}<br>
        Role : ${sessionScope.user.getRole()}<br>

        <h1>Review History <i class="fa fa-history" aria-hidden="true"></i></h1>
        <div style="margin-left: 86px;margin-right: 100px;">
            <c:forEach var = "review" items = "${sessionScope.showHistory}">
                <div id="review${review.getReview_id()}">
                    <div id="icon">
                        <i class="fa fa-trash" aria-hidden="true" href="deleteReviewServlet?id=${review.getReview_id()}" style="position: absolute;width: 120px;"></i>  
                        <i class="fa fa-pencil" aria-hidden="true" href="javascript:void(0)" onclick="editReview('${review.getReview_id()}', '${review.getDisplay_user()}', '${review.getScore()}');
                        return false;" style="position: absolute;right: -100px;width: 120px;"></i> 
                    </div>
                    <p >Content : <span id="C${review.getReview_id()}">${review.getContent()}</span></p>
                    <p id="S${review.getReview_id()}">Score : ${review.getScore()}</p>
                    <p id="D${review.getReview_id()}">
                        <c:choose>
                            <c:when test="${review.getDisplay_user()=='no'}">
                                Status : Hiding post
                            </c:when>    
                            <c:otherwise>
                                Status : Showing
                            </c:otherwise>
                        </c:choose></p>
                    Date : ${review.getDate()}<br>
                    Subject : ${review.getSubject_id()} ${review.getSj_name()}<br>

                    <hr>
                </div>

            </c:forEach><br>
        </div>




    </body>
</html>
<script src="js/bootstrap.min.js"></script>
