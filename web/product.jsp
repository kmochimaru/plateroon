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

                    <div class="img-space-top" align="center"> 
                        <img class="img-zoom"  src="img/production1.jpg" width="350" height="350" >&nbsp;&nbsp;&nbsp;&nbsp;
                        <img class="img-zoom"  src="img/production2.jpg" width="350" height="350" >
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
