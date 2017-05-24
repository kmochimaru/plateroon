<%-- 
    Document   : test
    Created on : May 23, 2017, 1:57:34 AM
    Author     : PEEPO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./jquery.Thailand.js/jquery.Thailand.min.css">
    </head>
    <body>
        <div id="address" style="display:none;">
            <div class="form-group">
                <div class="col-sm-5">
                    <input type="text" name="district" placeholder="ตำบล" class="form-control" required="required">
                </div>
                <div class="col-sm-5">
                    <input type="text" name="amphoe" placeholder="อำเภอ" class="form-control" required="required">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-5">
                    <input type="text" name="province" placeholder="จังหวัด" class="form-control" required="required">
                </div>
                <div class="col-sm-5">
                    <input type="text" name="zipcode" placeholder="รหัสไปรษณี" class="form-control" required="required">
                </div>
            </div>
        </div>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="jquery.Thailand.js/dependencies/JQL.min.js"></script>
        <script type="text/javascript" src="jquery.Thailand.js/dependencies/typeahead.bundle.js"></script>
        <script type="text/javascript" src="jquery.Thailand.js/jquery.Thailand.min.js"></script>
        <script>
            $(document).ready(function(){
                //Load address
                $.Thailand({
                    database: 'jquery.Thailand.js/data3.json',
                    onComplete: function () {
                        $('#loader, #address').toggle();
                        console.log('complete')
                    }
                });
            })
        </script>
    </body>
</html>
