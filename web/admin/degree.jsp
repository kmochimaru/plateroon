<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="static/tag_head.jsp" />
        <style>
            th,td{
                font-size: 14px;
            }
            i{
                font-size: 18px;
            }
            .container{
                width: 90%;
            }
        </style>
    </head>

    <body>
        <c:if test="${username != null}">
            <jsp:include page="static/navTop.jsp" />
            <!-- Page Content -->
            <div></div>
            <div class="container" ng-app="myApp" ng-controller="degreeController">

                <div class="row" id="content">
                    <jsp:include page="static/navLeft.jsp" />
                    <div class="col-lg-9" align="center">
                        <h3>ระดับผู้ใช้</h3>
                        <table class="table table-hover col-lg-9">
                            <thead>
                                <tr>
                                    <th class="col-log-3">รหัสระดับ</th>
                                    <th class="col-log-3">ชื่อระดับ</th>
                                    <th class="col-log-3">แก้ไข/ลบ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="(key, d) in degree">
                                    <td>{{ d.degreeId}}</td>
                                    <td>{{ d.degreeName}}</td>
                                    <td>
                                        <!-- edit degree -->
                                        <a style="color: #025aa5;" href="#" data-toggle="modal" data-target="#edit{{ d.degreeId}}"><i class="fa fa-gears fa-2x" aria-hidden="true"></i></a>
                                        <div class="modal fade" id="edit{{ d.degreeId}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <form class="editDegree" action="${pageContext.request.contextPath}/DegreeController?action=update" method="POST">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">แก้ไขข้อมูลระดับผู้ใช้</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <input type="hidden" name="degreeId" value="{{ d.degreeId}}" />
                                                            <div class="form-group row">
                                                                <label for="degreeId" class="col-2 col-form-label">รหัสระดับ</label>
                                                                <div class="col-10">
                                                                    <input class="form-control" type="text" placeholder="รหัสระดับ" value="{{ d.degreeId}}" name="degreeId" id="degreeId" required="required" disabled>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="degreeName" class="col-2 col-form-label">ชื่อระดับ</label>
                                                                <div class="col-10">
                                                                    <input class="form-control" type="text" placeholder="ชื่อระดับ" value="{{ d.degreeName}}" id="degreeName" name="degreeName" required="required">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">ยกเลิก</button>
                                                            <button type="submit" id="btnSubmit" class="btn btn-primary">ยืนยัน</button>
                                                        </div>
                                                    </div> <!-- content -->
                                                </form>
                                            </div>
                                        </div>
                                        &nbsp;&nbsp;
                                        <!-- delete degree -->
                                        <a class="ask-custom" style="color: red;" href="${pageContext.request.contextPath}/DegreeController?action=del&degreeId={{ d.degreeId}}"><i class="fa fa-trash fa-2x" aria-hidden="true"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <!-- add degree -->
                        <div align="left">
                            <a style="color: green;" href="#" data-toggle="modal" data-target="#add"><i class="fa fa-plus-circle fa-2x" aria-hidden="true"></i></a>
                        </div>
                        <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <form class="addDegree" action="${pageContext.request.contextPath}/DegreeController?action=add" method="POST">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลระดับผู้ใช้</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group row">
                                                <label for="degreeId" class="col-2 col-form-label">รหัสระดับ</label>
                                                <div class="col-10">
                                                    <input class="form-control" type="number" placeholder="รหัสระดับ" name="degreeId" id="degreeId" required="required">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="degreeName" class="col-2 col-form-label">ชื่อระดับ</label>
                                                <div class="col-10">
                                                    <input class="form-control" type="text" placeholder="ชื่อระดับ" id="degreeName" name="degreeName" required="required">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">ยกเลิก</button>
                                            <button type="submit" id="btnSubmit" class="btn btn-primary">ยืนยัน</button>
                                        </div>
                                    </div> <!-- content -->
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
        </c:if>
    </body>

</html>
