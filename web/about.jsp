<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="static/tag_head.jsp" />
    </head>

    <body>
        <jsp:include page="static/navTop.jsp" />
        <!-- Page Content -->
        <div class="container">

            <div class="row" id="content">
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9">
                    <div class="row">
                        <!--h4 align="center">PLATEROON ผลิตภัณฑ์อาหารเสริม ด้วยสารสะกัดจากปลาทะเลและวิตตามินซี</h4-->
                        <img src="img/Advertisement Banner_170216_0066.jpg" >

                    </div>
                    <div class="img-space-top"> 
                        <img class="img-zoom"  src="img/Advertisement Banner_170216_0003.jpg" width="400" height="400" >&nbsp;&nbsp;&nbsp;
                        <img class="img-zoom"  src="img/Advertisement Banner_170216_0004.jpg" width="400" height="400" >
                    </div>

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->
        <jsp:include page="static/footer.jsp" />
    </body>

</html>
