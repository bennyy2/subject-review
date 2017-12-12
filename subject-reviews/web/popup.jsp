<%-- 
    Document   : popup
    Created on : Dec 12, 2017, 2:27:18 PM
    Author     : 56070031
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h2 class="modal-title">Edit</h2>
                    </div>
                    <div class="modal-body">
                        <textarea class='form-control' rows='5' name='text1'></textarea>
                        <input type="checkbox" name="disable1" value="ON" /><label>Disable  username</label>
                        <br>
                        <input type="radio" name="score1" value="0" /> <label>0</label>
                        <input type="radio" name="score1" value="1" /> <label>1</label>
                        <input type="radio" name="score1" value="2" /> <label>2</label>
                        <input type="radio" name="score1" value="3" /> <label>3</label>
                        <input type="radio" name="score1" value="4" /> <label>4</label>
                        <input type="radio" name="score1" value="5" /> <label>5</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="save1" data-dismiss="modal">Save changes</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </body>
</html>
