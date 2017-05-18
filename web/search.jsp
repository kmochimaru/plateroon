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
                    <div class="row" id="search">
                        <form class="form-inline" >
                            <label for="text">ค้นหารหัสตัวแทน</label> &nbsp;&nbsp;
                            <input class="form-control" type="text" placeholder="รหัสตัวแทน" required="required"> &nbsp;&nbsp;
                            <input class="btn btn-secondary" type="submit" value="ค้นหา" >
                        </form>
                        <img style="margin-top: 20px" src="img/Advertisement Banner_170216_0006.jpg" width="800" height="700" >
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
