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
                $('[name="text"]').val($("#C" + rID).text());
                $('input:radio[value="'+s+'"]').attr('checked','true');
                if(d==="no"){
                    $('[name="disable"]').attr('checked','true');
                }else{
                    $('[name="disable"]').removeAttr('checked','true');
                }
                $('#save').attr('onclick','save("'+rID+'");')
                

            }
            function save(rID) {
                $.post("editReview", {text: $('[name=text]').val(), disable: $('[name=disable]').is(':checked'), score: $('[name=score]:checked').val(), review_id: rID}, function (responseText) {

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
<<<<<<< HEAD
        <h1>Profile ${sessionScope.user.getUsername()}</h1>
=======
        <h1>Hi... ${sessionScope.user.getUsername()}</h1><a href="edituser.jsp">edit</a>
>>>>>>> 5074711778ee6f96d7a9d01da92541f4459d9673
        Username : ${sessionScope.user.getUsername()}<br>
        Email : ${sessionScope.user.getEmail()}<br>
        ID : ${sessionScope.user.getId()}<br>
        Role : ${sessionScope.user.getRole()}<br>
        <a href="edituser.jsp">edit password</a>

        <h1>Review History <i class="fa fa-history" aria-hidden="true"></i></h1>
        <div style="margin-left: 86px;margin-right: 100px;">
            <c:forEach var = "review" items = "${sessionScope.showHistory}">
                <div id="review${review.getReview_id()}">
                    <div id="icon">
                        <a style="color: black" href="deleteReviewServlet?id=${review.getReview_id()}"><i class="fa fa-trash" aria-hidden="true"  style="position: absolute;width: 120px;"></i></a>
                        <i class="fa fa-pencil" aria-hidden="true" href="javascript:void(0)" onclick="editReview('${review.getReview_id()}', '${review.getDisplay_user()}', '${review.getScore()}'); return false;" style="position: absolute;right: 10px;" data-toggle="modal" data-target="#myModal"></i> 
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



        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Edit</h4>
                    </div>
                    <div class="modal-body">
                        <textarea class='form-control' rows='5' name='text'></textarea>
                        <input type="checkbox" name="disable" value="ON" />Disable  username
                        <br>
                        <input type="radio" name="score" value="0" /> 0
                        <input type="radio" name="score" value="1" /> 1
                        <input type="radio" name="score" value="2" /> 2
                        <input type="radio" name="score" value="3" /> 3
                        <input type="radio" name="score" value="4" /> 4
                        <input type="radio" name="score" value="5" /> 5
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="save" data-dismiss="modal">Save changes</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        
    </body>
</html>
<script src="js/bootstrap.min.js"></script>
<script>
                            $('#myModal').on('shown.bs.modal', function () {
                                $('[name="text"]').focus();
                            });
</script>

