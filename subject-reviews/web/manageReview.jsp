<%@page import="Model.UserProfile"%>
<%@page import="Model.Report"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KMITL Subject review system</title>
    </head>
    <body>
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

                    $("#re" + Rep).text(responseText).delay(1200).fadeOut(1000);
                });
            }
            setInterval(function () {

                $.post("manageReport", function (responseText) {
                    if (responseText !== "0") {
                        $("#refresh").css("visibility", "visible");
                        $("#newR").text("  new " + responseText + " report").fadeIn();
                    }else{
                        $("#refresh").css("visibility", "hidden");
                    }
                });

            }, 10000);
        </script>
    </head>
    <body>
        <%@ include file = "navbar.jsp" %>

        <div class="header">
            <div class="container text-center">
                <h1>KMITL Subject review system</h1>      
                <p>Tell me what is in your mind.</p>
            </div>
        </div>



        <h1>Review report</h1><br>
        <a href="ReportServlet">refresh</a><br>
        <%int c = 0;%>

        <div id="refresh" style="display: block; position: fixed;top: 20%; right: 0;visibility: hidden; background-color: #029f5b">
            <i class="fa fa-refresh fa-spin fa-fw"></i><a id="newR"></a></div>


        <c:forEach var = "show" items = "${sessionScope.showReport}">
            <div id="re${show.getReport_id()}" style="position: relative;padding-left: 5%;padding-right: 5%;"><i class="fa fa-times" aria-hidden="true" style="float: right;" onclick="delReport('${show.getReport_id()}')"></i>
                ${c.toString()}
                topic : ${show.getReport()}<br>
                Content :${show.getContent()}<br>
                Report by : ${show.getUser_report()}<br>
                Date : ${show.getDate()}<br>  
                Post by : ${show.getUser_post()}<br>
                subject : ${show.getsubject()}<i class="fa fa-trash" aria-hidden="true" style="float: right;" onclick="delReportAndReview('${show.getReport_id()}', '${show.getReviewid()}')"></i><br>

                <hr>
            </div>

        </c:forEach><br>



        <footer id="footer">
            <p>Copyright &copy; 2017 KMITL Subject review. All rights reserved.</p>  
        </footer>



    </body>
</html>

<script src="js/bootstrap.js"/>
<script src="js/bootstrap.min.js"/>
