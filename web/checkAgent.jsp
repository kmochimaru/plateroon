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
        <div></div>
        <div class="container">

            <div class="row" id="content">
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9">

                    <h1 style="color: red; text-align: center; margin-top: 100px">กำลังอยู่ในช่วงปรับปรุง</h1>

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->
        <jsp:include page="static/footer.jsp" />
    </body>

</html>
