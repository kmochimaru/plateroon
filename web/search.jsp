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

            <div class="row" id="content" >
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9" align="center">
                    <!--form ng-submit="submit()"  class="form-group col-lg-9" -->
                        <div class="col-lg-9 row">
                            <form class="form-group row" action="${pageContext.request.contextPath}/AgentController?action=searchAgent" method="POST">
                                <label class="col-lg-4" for="">อำเภอ</label>
                                <div class="col-lg-8" id="amphoe">
                                    <input class="form-control" type="text" id="amphoe" name="amphoe"  placeholder="อำเภอ" >
                                </div>
                                <label class="col-lg-4" for="province">จังหวัด</label>
                                <div class="col-lg-8">
                                    <input class="form-control" type="text" id="province" name="province"  placeholder="จังหวัด" >
                                </div>
                                <input type="submit" class="btn btn-outline-info" value="ค้นหา" />
                            </form>
                            <!--img style="margin-top: 20px" src="img/Advertisement Banner_170216_0006.jpg" width="800" height="700" -->
                        </div>
                    
                    <!--/form-->
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>เลขประจำตัวของตัวแทน</th>
                                    <th>ชื่อนาม-สกุล</th>
                                    <th>เบอร์โทรหลัก</th>
                                    <th>เบอร์โทรรอง</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${search}" var="bean">
                                <tr>
                                    <td>${ bean.agentCode }</td>
                                    <td>${ bean.firstname } &nbsp; ${ bean.lastnames }</td>
                                    <td>${ bean.phonenumberMain }</td>
                                    <td>${ bean.phonenumberReserve }</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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
        <script src='http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js'></script>
        <script src="js/editProfile.js"></script>
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
