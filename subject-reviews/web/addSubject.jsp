<%-- 
    Document   : addSubject
    Created on : Dec 8, 2017, 3:29:05 PM
    Author     : Benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Add Subject</title>
    </head>
    <body>
        <%@ include file = "navbar.jsp" %>
        <h1 style="text-align: center">Add new Subject</h1><br>
        <form action="addSubjectServlet">


            <div class="container">
                <div class="form-group">
                    <label for="id">Subject ID</label>
                    <input type="text" class="form-control" id="id" placeholder="Enter Subject Id" name="id">
                </div>
                <div class="form-group">
                    <label for="subject_thai">Subject Name in Thai</label>
                    <input type="text" class="form-control" id="subject_thai" placeholder="Enter Subject Name" name="subject_thai">
                </div>
                <div class="form-group">
                    <label for="subject_eng">Subject Name in English</label>
                    <input type="text" class="form-control" id="subject_eng" placeholder="Enter Subject Name" name="subject_eng">
                </div>
                <div class="form-group">
                    <label for="des_thai">Description in Thai</label>
                    <textarea type="text" rows="4" cols="20" class="form-control" id="des_thai" placeholder="Enter Description" name="des_thai"></textarea>
                </div>
                <div class="form-group">
                    <label for="des_eng">Description in English</label>
                    <textarea type="text" rows="4" cols="20" class="form-control" id="des_eng" placeholder="Enter Description" name="des_eng"></textarea>
                </div>
                <label for="des_eng">Select Type Subject :    </label>

                <select name="type">
                    <c:forEach var = "type" items = "${sessionScope.allType}">
                        <option value="${type.getType_id()}">${type.getType_name()}</option>
                    </c:forEach>
                </select><br><br>

                <div class="message">
                    <label>${message}</label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </div>


        </form>
        <br>

        <%@ include file = "footer.jsp" %>
    </body>
</html>
<script src="js/bootstrap.min.js"></script>
