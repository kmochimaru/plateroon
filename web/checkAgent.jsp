<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="static/tag_head.jsp" />
        <link href="css/checkAgent.css" rel="stylesheet">
    </head>

    <body ng-app="profile">
        <jsp:include page="static/navTop.jsp" />
        <!-- Page Content -->
        <div></div>
        <div class="container">

            <div class="row" id="content" ng-controller="checkAgentCode">
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9" align="center">
                    <h1>ตรวจสอบสถานะตัวแทน</h1><br>
                    <!--div class="col-lg-5">
                        <form action="${pageContext.request.contextPath}/AgentController?action=checkAgent" method="GET">
                        <div class="input-group">
                            <input type="text" class="form-control" name="agentCode" placeholder="เลขประจำตัวของตัวแทน" required="required">
                            <span class="input-group-btn">
                                <button class="btn btn-outline-info" type="submit"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;ค้นหา</button>
                            </span>
                        </div>
                        </form>
                    </div-->
                    <div>
                    <div class="wrapper">
                        <form class="login" action="${pageContext.request.contextPath}/AgentController?action=checkAgent" method="GET">
                            <p class="title">กรอกเลขประจำตัวของตัวแทน</p>
                            <input type="text" id="agentCode" name="agentCode" placeholder="" autofocus required="required"/>
                            <i class="fa fa-user"></i>
                            <button type="submit">
                                <i class="spinner"></i>
                                <div class="fail"></div>
                                <span class="state" style="font-family: 'Prompt', sans-serif;">ตรวจสอบ</span>
                            </button>
                        </form>
                    </div>
                            <div>
                        
                    
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
