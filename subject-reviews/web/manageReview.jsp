<%@page import="Model.UserProfile"%>
<%@page import="Model.Report"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
            function delReportAndReview(Rep, Rev) {
                $.get("manageReport", {report: Rep, review: Rev}, function (responseText) {

                    $("#re" + Rep).text(responseText).delay(1200).fadeOut(1000);
                });


            }
            function delReport(Rep) {
                $.get("manageReport", {report: Rep}, function (responseText) {

                    $("#re" + Rep).text(responseText).delay(1200).fadeOut(1000).css('font-size','30px !mportant');
                });
            }
            var a = "0";
            setInterval(function () {
                
                $.post("manageReport", function (responseText) {
                    if (responseText !== a && responseText!=="0") {
                        $("#refresh").fadeIn();
                        $("#refresh").delay(5000).fadeOut();
                        a = responseText;

                    }
                });

            }, 1000);
        </script>
        <%
            Report report = new Report();
            ArrayList reportList = new ArrayList<>();
            reportList = report.showReport();
            session.setAttribute("showReport", reportList);
        %>
    <body>
        <%@ include file = "navbar.jsp" %>

        <div class="header">
            <div class="container text-center">
                <h1>KMITL Subject review system</h1>      
                <p>Tell me what is in your mind.</p>
            </div>
        </div>



        <h1>Review report</h1><br>
        <p id="refresh" style="display: none; position: fixed; padding:10px 20px 15px 20px; background-color: darkgray;border-radius: 10px 10px 10px 10px; left: 10px; bottom: 10px; width: auto;height: 50px; z-index: 1;">
            <a id="newR" style="font-size: 20px ;color: white;"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>  You have new report</a>

        </p><br>


        <c:forEach var = "show" items = "${sessionScope.showReport}">
            <div id="re${show.getReport_id()}" style="position: relative;padding-left: 5%;padding-right: 5%;"><i class="fa fa-times" aria-hidden="true" style="float: right;" onclick="delReport('${show.getReport_id()}')"></i>
                
                <p>topic : ${show.getReport()}</p>
                <p>Content :${show.getContent()}</p>
                <p>Report by : ${show.getUser_report()}</p>
                <p>Date : ${show.getDate()}</p>  
                <p>Post by : ${show.getUser_post()}</p>
                <p>subject : ${show.getsubject()}<span style="font-size: 15px !important;"><i class="fa fa-trash" aria-hidden="true" style="float: right;" onclick="delReportAndReview('${show.getReport_id()}', '${show.getReviewid()}')"></i></span>></p>

                <hr>
            </div>

        </c:forEach><br>



        



    </body>
</html>

<script src="js/bootstrap.min.js"></script>
