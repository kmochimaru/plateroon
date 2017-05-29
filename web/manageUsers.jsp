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
        <div class="container" ng-app="profile" ng-controller="mainController">

            <div class="row" id="content">
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9" style="padding-left: 5%">
                    <form action="${pageContext.request.contextPath}/AgentController?action=change" method="POST">
                        <h2 align="center">เปลี่ยนชื่อและรหัสผู้ใช้</h2><br>
                        <input name="agentCode" type="hidden" value="{{ a.agentCode }}">
                        <div class="form-group row" >
                            <label for="username" class="col-2 col-form-label">ชื่อผู้ใช้</label>
                            <div class="col-lg-5">
                                <input class="form-control" type="text" placeholder="ชื่อผู้ใช้" value="{{ a.username}}" name="username" id="username" required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="password" class="col-2 col-form-label">รหัสผู้ใช้</label>
                            <div class="col-lg-5">
                                <input class="form-control" type="password" placeholder="รหัสผู้ใช้" value="{{ a.password}}" name="password" id="password" required="required">
                            </div>
                        </div>
                        <div align="center">
                            <button type="submit" class="btn btn-outline-success"><i class="fa fa-floppy-o" aria-hidden="true"></i> แก้ไข</button> &nbsp;&nbsp;
                            <input type="reset" class="btn btn-outline-danger" value="ล้างข้อมูล" />
                        </div>
                    </form>
                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->
        <jsp:include page="static/footer.jsp" />
        <script src='http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js'></script>
        <script src="js/editProfile.js"></script>
    </body>

</html>
