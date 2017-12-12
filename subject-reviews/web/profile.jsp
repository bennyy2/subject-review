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
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css"/>

        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>

            function editReview(rID, d, s) {
                $('[name="text1"]').val($("#C" + rID).text());
                $('input:radio[value="' + s + '"]').attr('checked', 'true');
                if (d === "no") {
                    $('[name="disable1"]').attr('checked', 'true');
                } else {
                    $('[name="disable1"]').removeAttr('checked', 'true');
                }
                $('#save1').attr('onclick', 'save("' + rID + '");');


            }
            function save(rID) {
                $.post("editReview", {text: $('[name=text1]').val(), disable: $('[name=disable1]').is(':checked'), score: $('[name=score1]:checked').val(), review_id: rID, from: "pf"}, function (responseText) {

                    $("#review" + rID).html(responseText);///.delay(1200).fadeOut(1000);
                });
//                $("#test").text($('[name=text]').val());

            }
            function delre(rID) {

            }
        </script>
        <title>Profile</title>
    </head>
    <body>
        <%@ include file = "navbar.jsp" %>
        <div class="bgpf"></div>
        <div class="boxuser">
            <p>Username : ${sessionScope.user.getUsername()}</p>
            <p>Email : ${sessionScope.user.getEmail()}</p>
            <p>ID : ${sessionScope.user.getId()}</p>
            <p>Role : ${sessionScope.user.getRole()}</p>
            <a href="edituser.jsp" ><button id="edit" type="button" class="btn btn-default" >edit</button></a>
        </div>
<br><br><br>
<c:if test="${sessionScope.user.getUsername()!='admin'}"><p style="margin-left: 10%;margin-bottom: 20px; font-size: 35px !important;">Review History <i class="fa fa-history" aria-hidden="true"></i></p></c:if>
        

        <c:forEach var = "review" items = "${sessionScope.showHistory}">
            <div class="revHis">
                <div id="review${review.getReview_id()}">
                    <div id="icon">
                        <a style="font-size: 15px !important;" href="deleteReviewServlet?id=${review.getReview_id()}"><i class="fa fa-trash" aria-hidden="true"  style="position: absolute;width: 120px; color: black;"></i></a>
                        <i class="fa fa-pencil" aria-hidden="true" href="javascript:void(0)" onclick="editReview('${review.getReview_id()}', '${review.getDisplay_user()}', '${review.getScore()}'); return false;" style="position: absolute;right: 10px;" data-toggle="modal" data-target="#myModal1"></i> 
                    </div>
                    <p >Content : <span id="C${review.getReview_id()}">${review.getContent()}</span></p>
                    <p id="S${review.getReview_id()}">Score : ${review.getScore()}</p>
                    <p id="D${review.getReview_id()}">
                        <c:choose>
                            <c:when test="${review.getDisplay_user()=='no'}">
                                Status : Hiding User
                            </c:when>    
                            <c:otherwise>
                                Status : Show User
                            </c:otherwise>
                        </c:choose></p>
                    <p>Date : ${review.getDate()}</p>
                    <p>Subject : ${review.getSubject_id()} ${review.getSj_name()}</p>


                </div>
            </div>
        </c:forEach><br>




        <%@ include file = "popup.jsp" %>

    </body>
</html>
<script src="js/bootstrap.min.js"></script>
<script>
                            $('#myModal').on('shown.bs.modal', function () {
                                $('[name="text"]').focus();
                            });
</script>

