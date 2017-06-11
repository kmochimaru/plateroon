<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="static/tag_head.jsp" />
        <link href="css/checkAgent.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="static/navTop.jsp" />
        <c:if test="${username == null}">
            <jsp:forward page="login.jsp"/>
        </c:if>
        <!-- Page Content -->
        <div class="container" ng-app="profile" ng-controller="mainController">

            <div class="row" id="content">
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9" style="padding-left: 5%">
                    <div>
                        <div class="wrapper">
                            <form class="login" action="${pageContext.request.contextPath}/AgentController?action=change" method="POST">
                                <input name="agentCode" type="hidden" value="{{ a.agentCode}}">
                                <p class="title" align="center">เปลี่ยนชื่อและรหัสของผู้ใช้</p>
                                <input type="text" id="username" name="username" value="{{a.username}}" placeholder="ชื่อผู้ใช้" autofocus required="required"/>
                                <i class="fa fa-user"></i>
                                <input type="password" name="password" value="{{ a.password}}"  placeholder="รหัสผ่าน" required="required"/>
                                <i class="fa fa-key"></i>
                                <button type="submit">
                                    <i cl ass="spinner"></i>
                                    <div class="fail"></div>
                                    <span class="state" style="font-family: 'Prompt', sans-serif;">ตกลง</span>
                                </button>
                            </form>
                        </div>
                    </div>
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
