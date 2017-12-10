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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            
            function bind() {
                
                if ($('[name="textre"]').val()!=""){ 
                    $('#save').attr('disabled',false);
                    
                } else {
                    $('#save').attr('disabled',true);
                }
            }
            function reportFunction() {


                $.post("ReportServlet", {text: $('textarea[name="textre"]').val(), user_report: "${sessionScope.user.getId()}", review_id: $("#rID").text(), user_post: $("#userR").text()}, function (responseText) {
                    $("#test").text(responseText).fadeIn(1);
                    $("#test").text(responseText).delay(1200).fadeOut(1000);

                });


            }
            function toggle_visible(usp, rID) {
                $("#userR").text("");
                $("#rID").text("");
                $('textarea[name="textre"]').val("");
                $("#userR").text(usp);
                $("#rID").text(rID);


            }
            function closepop() {

                $("#userR").text("");
                $("#rID").text("");
                $('textarea[name="textre"]').val("");
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
            <h3>score : </h3><fmt:formatNumber type="number" maxFractionDigits="2" value="${sessionScope.subject.getTotal_score()}"/>


            <br><br><hr>
        </div>
        <!--          ///popup///  -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Report</h4>
                    </div>
                    <div class="modal-body">
                        <p id="userR" hidden=""></p>
                        <p id="rID" hidden=""></p>
                        <textarea class='form-control' rows='5' name='textre' onkeyup="bind();"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="save" data-dismiss="modal" onclick="reportFunction();" disabled="true">Send report</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="container" style="word-wrap: break-word;">
            <c:forEach var = "show" items = "${sessionScope.showReview}">
                <div class="content">

                    <i href="javascript:void(0)" class="fa fa-bug" aria-hidden="true" onclick="toggle_visible('${show.getUser()}', '${show.getReview_id()}');
                            return false;" id="bc" style="float: right;" data-toggle="modal" data-target="#myModal"></i>
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
                        <textarea class="form-control" rows="5" name="text" style="resize: vertical;"></textarea></div><br>
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


        <%@ include file = "footer.jsp" %>
        <script>
            $("#cover").click(function () {
                closepop();
            });
        </script>
    </body>




</html>
<script src="js/bootstrap.min.js"></script>
<script>
            $('#myModal').on('shown.bs.modal', function () {
                $('[name="text"]').focus();
            });

</script>
