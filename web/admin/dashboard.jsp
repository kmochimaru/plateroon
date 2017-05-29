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
            <div class="container" ng-app="myApp" ng-controller="mainController">

                <div class="row" id="content">
                    <jsp:include page="static/navLeft.jsp" />
                    <div class="col-lg-9" align="center">
                        <table class="table table-hover">
                            <thead>
                            <th width="20%">รหัสตัวแทน</th>
                            <th width="20%">เลขประจำตัวของตัวแทน</th>
                            <th width="20%">ชื่อ-นามสกุล</th>
                            <th width="20%">ที่อยู่</th>
                            <th width="10%">เบอร์โทรศัพท์</th>
                            <th width="10%">รออนุมัติ</th>
                            </thead>
                            <tbody>
                                <tr ng-repeat="(key, a) in agent" >
                                    <td>
                                        {{ a.agentId}}
                                    </td>
                                    <td>
                                        {{ a.agentCode}}
                                    </td>
                                    <td>
                                        {{ a.firstname}} &nbsp; {{ a.lastnames}}
                                    </td>
                                    <td>
                                        ต. {{ a.district}} &nbsp; อ. {{ a.amphur}} &nbsp; จ. {{ a.province}} &nbsp; {{ a.zipcode}}
                                    </td>
                                    <td>
                                        {{ a.phonenumberMain}}, {{ a.phonenumberReserve}}
                                    </td>
                                    <td>
                                        <a style="color: green;" href="${pageContext.request.contextPath}/AgentController?action=Approve&agentCode={{ a.agentCode}}"><i class="fa fa-check fa-2x" aria-hidden="true"></i></a>
                                        <a style="color: red;" href="${pageContext.request.contextPath}/AgentController?action=Disapproved&agentCode={{ a.agentCode}}"><i class="fa fa-close fa-2x" aria-hidden="true"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

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
