<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="static/tag_head.jsp" />
        <link rel="stylesheet" href="./jquery.Thailand.js/jquery.Thailand.min.css">
    </head>

    <body>
        <jsp:include page="static/navTop.jsp" />
        <!-- Page Content -->
        <div class="container">

            <div class="row" id="content">
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9">
                    <div class="col-lg-9 row">
                        <form class="form-group row" >
                            <label class="col-lg-4" for="">ค้นหารหัสตัวแทนตาม อำเภอ</label>
                            <div class="col-lg-5" id="search">
                                <input class="form-control" type="text" id="search" name="amphoe" placeholder="อำเภอ" required="required">
                            </div>
                        </form>
                        <!--img style="margin-top: 20px" src="img/Advertisement Banner_170216_0006.jpg" width="800" height="700" -->
                    </div>
                    <div class="col-lg-9 row">
                        <form class="form-group row" >
                            <label class="col-lg-4" for="province">ค้นหารหัสตัวแทนตาม จังหวัด</label>
                            <div class="col-lg-5">
                                <input class="form-control" type="text" id="province" name="province" placeholder="จังหวัด" required="required">
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->
        <jsp:include page="static/footer.jsp" />
        <script type="text/javascript" src="jquery.Thailand.js/dependencies/JQL.min.js"></script>
        <script type="text/javascript" src="jquery.Thailand.js/dependencies/typeahead.bundle.js"></script>
        <script type="text/javascript" src="jquery.Thailand.js/jquery.Thailand.min.js"></script>
        <script>
            //Load address
            $.Thailand({
                database: 'jquery.Thailand.js/data3.json',
                onComplete: function () {
                    $('#loader, #address').toggle();
                }
            });
        </script>
    </body>

</html>
