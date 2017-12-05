<%-- 
    Document   : edituser
    Created on : Oct 29, 2017, 1:55:36 PM
    Author     : oathiti
--%>
<%@page import="Model.UserProfile"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <title>KMITL Subject review system</title>
    </head>
    <body>
        <h3 id="header_name">KMITL Subject reviews</h3>
        <div class="container" id="login">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <h3>Edit</h3>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <form action="editServlet" method="POST">
                                <div class="form-group">
                                    <label for="username">Username:</label>
                                    <input type="text" class="form-control" id="username" name="username" value="${sessionScope.user.getUsername()}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" value="${sessionScope.user.getEmail()}" readonly>
                                    
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Old-Password:</label>
                                    <input type="password" class="form-control" id="password" name="o-password" >
                                </div>
                                <div class="form-group">
                                    <label for="pwd">New-Password:</label>
                                    <input type="password" class="form-control" id="password" name="n-password" placeholder="New-Password">
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Confirm-Password:</label>
                                    <input type="password" class="form-control" id="password" name="c-password" placeholder="Confirm-Password">
                                </div>
                                
                                <div class="message">
                                    <label>${message}</label>
                                </div>
                                <button type="submit" value="confirm" class="btn btn-default">save</button>
                            </form>
                        </div>
                                <div class="regis">
                                     <a href="login.jsp"><< Back to log in</a>
                                </div>
                      
                    </div>
                </div>
                

                </body>
                </html>
                <script src="js/bootstrap.js"/>
                <script src="js/bootstrap.min.js"/>

