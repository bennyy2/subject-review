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
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
            function bind() {

                if ($('[name="textre"]').val() != "") {
                    $('#save').attr('disabled', false);

                } else {
                    $('#save').attr('disabled', true);
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

            function editReview(rID, d, s) {
                $('[name="text1"]').val($("#C" + rID).text());
                $('input:radio[value="' + s + '"]').attr('checked', 'true');
                if (d === "no") {
                    $('[name="disable1"]').attr('checked', 'true');
                } else {
                    $('[name="disable1"]').removeAttr('checked', 'true');
                }
                $('#save1').attr('onclick', 'save("' + rID + '");');
                console.log('pass');

            }
            function save(rID) {
                $.post("editReview", {text: $('[name=text1]').val(), disable: $('[name=disable1]').is(':checked'), score: $('[name=score1]:checked').val(), review_id: rID, from:"ss",user:"${sessionScope.user.getUsername()}"}, function (responseText) {

                    $("#review" + rID).html(responseText);///.delay(1200).fadeOut(1000);
                });
//                $("#test").text($('[name=text]').val());

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

            <h2 >Description : </h2><p>${sessionScope.subject.getSj_description_eng()}</p><br>
            <h2>คำอธิบายรายวิชา : </h2><p>${sessionScope.subject.getSj_description_thai()}</p><br>
            <h1>score : <span><fmt:formatNumber type="number" maxFractionDigits="2" value="${sessionScope.subject.getTotal_score()}"/></span></h1>


            <br><br><hr>
        </div>
        <!--          ///popup///  -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h2 class="modal-title">Report</h2>
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
                <div class="content" id="review${show.getReview_id()}">
                    <c:choose>
                        <c:when test="${show.getUser()==sessionScope.user.getUsername()}">
                            <div id="icon">
                                <a style="font-size: 15px !important;" href="deleteReviewServlet?id=${show.getReview_id()}"><i class="fa fa-trash" aria-hidden="true"  style="position: absolute;width: 120px; color: black;"></i></a>
                                <i class="fa fa-pencil" aria-hidden="true" href="javascript:void(0)" onclick="editReview('${show.getReview_id()}', '${show.getDisplay_user()}', '${show.getScore()}');
                                        return false;" style="position: absolute;right: 10px;" data-toggle="modal" data-target="#myModal1"></i> 
                            </div>
                        </c:when>    
                        <c:otherwise>
                            <i class="fa fa-bug" aria-hidden="true" onclick="toggle_visible('${show.getUser()}', '${show.getReview_id()}');
                                    return false;" id="bc" style="float: right;" data-toggle="modal" data-target="#myModal" data-placement="top" title="Report"></i>
                        </c:otherwise>
                    </c:choose>

                    <p ><b>Content : </b><span id="C${show.getReview_id()}">${show.getContent()}</span></p>
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
                    <input type="checkbox" name="disable" value="ON" /><label>Disable  username</label><br>
                    <label>Score :</label> 
                    <input type="radio" name="score" value="0" checked=""/> <label>0</label>
                    <input type="radio" name="score" value="1" /> <label>1</label>
                    <input type="radio" name="score" value="2" /> <label>2</label>
                    <input type="radio" name="score" value="3" /> <label>3</label>
                    <input type="radio" name="score" value="4" /> <label>4</label>
                    <input type="radio" name="score" value="5" /> <label>5</label>
                    <br><br>
                    <button type="submit" value="submit" class="btn btn-primary btn-md">submit</button>
                </form>

            </c:if>
        </div>

        <%@ include file = "popup.jsp" %>
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
