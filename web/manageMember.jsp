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
            <div class="container" ng-app="profile" ng-controller="agentController">
                <div class="row" id="content">
                    <jsp:include page="static/navLeft.jsp" />
                    <div class="col-lg-9" align="center">
                        <h3>ตัวแทนจำหน่ายทั้งหมด &nbsp; {{ sizeAgent}} &nbsp; คน</h3>
                        <table class="table table-hover col-lg-9">
                            <thead>
                            <th>สถานะตัวแทน</th>
                            <th width="20%">รหัสตัวแทน</th>
                            <th width="20%">เลขประจำตัวของตัวแทน</th>
                            <th width="20%">ชื่อ-นามสกุล</th>
                            <th width="20%">ที่อยู่</th>
                            <th width="10%">เบอร์โทรศัพท์</th>
                            <th width="10%">แก้ไข/ลบ</th>
                            </thead>
                            <tbody>
                                <tr ng-repeat="(key, a) in agent" >
                                    <td align="center">
                                        <i style="color: green" class="fa fa-check-circle-o fa-2x" aria-hidden="true" ng-if="chkExpiredDate(a.expiredDate) == true"></i>
                                        <i style="color: red" class="fa fa-window-close-o fa-2x" aria-hidden="true" ng-if="chkExpiredDate(a.expiredDate) == false"></i>
                                    </td>
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
                                        <a style="color: #025aa5;" href="#" data-toggle="modal" data-target="#edit{{ a.agentId}}"><i class="fa fa-id-badge fa-2x" aria-hidden="true"></i></a>

                                        <div class="modal fade" id="edit{{ a.agentId}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <form class="editAgent" action="${pageContext.request.contextPath}/AgentController?action=update" method="POST">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">แก้ไขข้อมูลตัวแทนจำหน่าย</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <input type="hidden" name="password" value="{{ a.password}}" />
                                                            <input type="hidden" name="username" value="{{ a.username}}" />
                                                            <div class="form-group row">
                                                                <label for="fistName" class="col-2 col-form-label">ชื่อ</label>
                                                                <div class="col-10">
                                                                    <input class="form-control" type="text" placeholder="ชื่อ" value="{{ a.firstname}}" name="fistName" id="fistName" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="lastName" class="col-2 col-form-label">นามสกุล</label>
                                                                <div class="col-10">
                                                                    <input class="form-control" type="text" placeholder="นามสกุล" value="{{ a.lastnames}}" id="lastName" name="lastName" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="idCard" class="col-2 col-form-label">เลขบัตรประจำตัวประชาชน</label>
                                                                <div class="col-10">
                                                                    <input type="hidden" name="idCard" value="{{ a.idcard}}" />
                                                                    <input class="form-control" type="text" maxlength="13" placeholder="เลขบัตรประจำตัวประชาชน" value="{{ a.idcard}}" name="idCard" id="idCard" required="required" disabled="disabled">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="nationality" class="col-2 col-form-label">สัญชาติ</label>
                                                                <div class="col-lg-10">
                                                                    <input class="form-control" type="text" placeholder="สัญชาติ" value="{{ a.nationality}}" name="nationality" id="nationality" required="required" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="birthday" class="col-2 col-form-label">วันเกิด</label>
                                                                <div class="col-10">
                                                                    <input type="date" id="birthday" name="birthday" placeholder="วันเกิด" value="{{ a.birthday}}" class="form-control" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="gender" class="col-2 col-form-label">เพศ</label>
                                                                <div class="col-10">
                                                                    <select id="gender" name="gender" class="form-control" required="required" ng-model="a.gender" >  
                                                                        <option value="หญิง">หญิง</option>
                                                                        <option value="ชาย">ชาย</option>
                                                                    </select>  
                                                                </div>
                                                            </div>  
                                                            <div class="form-group row">
                                                                <label for="agentId" class="col-2 col-form-label">รหัสตัวแทน</label>
                                                                <div class="col-10">
                                                                    <input type="text" value="{{ a.agentId}}" id="agentId" maxlength="16" name="agentId" placeholder="รหัสตัวแทน" class="form-control" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="agentCode" class="col-2 col-form-label">เลขประจำตัวของตัวแทน</label>
                                                                <div class="col-10">
                                                                    <input type="text" value="{{ a.agentCode}}" id="agentCode" name="agentCode" placeholder="เลขประจำตัวของตัวแทน" class="form-control" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="expiredDate" class="col-2 col-form-label">วันหมดอายุ</label>
                                                                <div class="col-10">
                                                                    <input type="date" name="expiredDate" id="expired_date"  class="form-control" value="{{ a.expiredDate}}" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="degreeId" class="col-2 col-form-label">ระดับสมาชิก</label>
                                                                <div class="col-10">
                                                                    <select name="degreeId" class="form-control" required="required" ng-model="a.degreeId">
                                                                        <option value="1">DI</option>
                                                                        <option value="2">VIP</option>
                                                                        <option value="3">Main</option>
                                                                        <option value="4">Sub</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="address" class="col-2 col-form-label">ที่อยู่</label>
                                                                <div class="col-10">
                                                                    <input type="text" name="address" placeholder="ที่อยู่"  class="form-control" value="{{ a.address}}" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="district" class="col-2 col-form-label">ตำบล</label>
                                                                <div class="col-10">
                                                                    <input type="text" name="district" placeholder="ตำบล" class="form-control" value="{{ a.district}}" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="amphoe" class="col-2 col-form-label">อำเภอ</label>
                                                                <div class="col-10">
                                                                    <input type="text" name="amphoe" placeholder="อำเภอ"  class="form-control" value="{{ a.amphur}}" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="province" class="col-2 col-form-label">จังหวัด</label>
                                                                <div class="col-10">
                                                                    <input type="text" value="{{ a.province}}" id="province" name="province" placeholder="จังหวัด" class="form-control" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="zipcode" class="col-2 col-form-label">รหัสไปรษณี</label>
                                                                <div class="col-10">
                                                                    <input type="text" value="{{ a.zipcode}}" id="zipcode" name="zipcode" placeholder="รหัสไปรษณี" class="form-control" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="phoneMain" class="col-2 col-form-label">เบอร์โทรหลัก</label>
                                                                <div class="col-10">
                                                                    <input type="text" value="{{ a.phonenumberMain}}" id="phoneMain" name="phoneMain" placeholder="เบอร์โทรหลัก" class="form-control" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="phoneReserve" class="col-2 col-form-label">เบอร์โทรรอง</label>
                                                                <div class="col-10">
                                                                    <input type="text" value="{{ a.phonenumberReserve}}" id="phoneReserve" name="phoneReserve" placeholder="เบอร์โทรรอง" class="form-control" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="relationship" class="col-2 col-form-label">บุคคลที่เกี่ยวข้อง</label>
                                                                <div class="col-10">
                                                                    <input type="text" value="{{ a.relatedpersons}}" id="relationship" name="relationship" placeholder="บุคคลที่เกี่ยวข้อง" class="form-control" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="relationshipRelatedpersons" class="col-2 col-form-label">ความสัมพันธ์</label>
                                                                <div class="col-10">
                                                                    <input type="text" value="{{ a.relationshipRelatedpersons}}" id="relationshipRelatedpersons" name="relationshipRelatedpersons" placeholder="ความสัมพันธ์" class="form-control" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="phonenumberRelatedpersons" class="col-2 col-form-label">เบอร์โทรของบุคคลที่เกี่ยวข้อง</label>
                                                                <div class="col-10">
                                                                    <input type="text" value="{{ a.phonenumberRelatedpersons}}" id="phonenumberRelatedpersons" name="phonenumberRelatedpersons" placeholder="เบอร์โทรของบุคคลที่เกี่ยวข้อง" class="form-control" required="required">
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
                                        <a style="color: red;" href="${pageContext.request.contextPath}/AgentController?action=Disapproved&agentId={{ a.agentId}}"><i class="fa fa-remove fa-2x" aria-hidden="true"></i></a>
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
            <script src='http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js'></script>
            <script src="js/editProfile.js"></script>
        </c:if>
    </body>

</html>
