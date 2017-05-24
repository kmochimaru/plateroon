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
        <div class="container" ng-app="profile" ng-controller="mainController">

            <div class="row" id="content">
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9" style="padding-left: 5%">
                    <form action="${pageContext.request.contextPath}/AgentController?action=update" method="POST">
                        <div class="form-group row">
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
                        <div class="form-group row">
                            <label for="fistName" class="col-1 col-form-label">ชื่อ</label>
                            <div class="col-lg-4">
                                <input class="form-control" type="text" placeholder="ชื่อ" value="{{ a.firstname}}" name="fistName" id="fistName" required="required">
                            </div>
                            <label for="lastName" class="col-1 col-form-label">นามสกุล</label>
                            <div class="col-lg-4">
                                <input class="form-control" type="text" placeholder="นามสกุล" value="{{ a.lastnames}}" id="lastName" name="lastName" required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="idCard" class="col-3 col-form-label">เลขบัตรประจำตัวประชาชน</label>
                            <div class="col-lg-5">
                                <input type="hidden" name="idCard" value="{{ a.idcard}}" />
                                <input class="form-control" type="text" maxlength="13" placeholder="เลขบัตรประจำตัวประชาชน" value="{{ a.idcard}}" name="idCard" id="idCard" required="required" disabled="disabled">
                            </div>
                            <label for="nationality" class="col-1 col-form-label">สัญชาติ</label>
                            <div class="col-lg-2">
                                <input class="form-control" type="text" placeholder="สัญชาติ" value="{{ a.nationality}}" name="nationality" id="nationality" required="required" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="birthday" class="col-1 col-form-label">วันเกิด</label>
                            <div class="col-3">
                                <input type="date" id="birthday" name="birthday" placeholder="วันเกิด" value="{{ a.birthday}}" class="form-control" required="required">
                            </div>
                            <label for="gender" class="col-1 col-form-label">เพศ</label>
                            <div class="col-3">
                                <select id="gender" name="gender" class="form-control" required="required" ng-model="a.gender" >  
                                    <option value="หญิง">หญิง</option>
                                    <option value="ชาย">ชาย</option>
                                </select>  
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="agentId" class="col-2 col-form-label">รหัสตัวแทน</label>
                            <div class="col-3">
                                <input type="text" value="{{ a.agentId}}" id="agentId" maxlength="16" name="agentId" placeholder="รหัสตัวแทน" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="agentCode" class="col-3 col-form-label">เลขประจำตัวของตัวแทน</label>
                            <div class="col-5">
                                <input type="text" value="{{ a.agentCode}}" id="agentCode" name="agentCode" placeholder="เลขประจำตัวของตัวแทน" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="expiredDate" class="col-2 col-form-label">วันหมดอายุ</label>
                            <div class="col-3">
                                <input type="date" name="expiredDate" id="expired_date"  class="form-control" value="{{ a.expiredDate}}" required="required">
                            </div>
                            <label for="degreeId" class="col-2 col-form-label">ระดับสมาชิก</label>
                            <div class="col-3">
                                <select name="degreeId" class="form-control" required="required" ng-model="a.degreeId">
                                    <option value="1">DI</option>
                                    <option value="2">VIP</option>
                                    <option value="3">Main</option>
                                    <option value="4">Sub</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            
                        </div>
                        <div class="form-group row">
                            <label for="address" class="col-1 col-form-label">ที่อยู่</label>
                            <div class="col-7">
                                <input type="text" name="address" placeholder="ที่อยู่"  class="form-control" value="{{ a.address}}" required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="district" class="col-1 col-form-label">ตำบล</label>
                            <div class="col-4">
                                <input type="text" name="district" placeholder="ตำบล" class="form-control" value="{{ a.district}}" required="required">
                            </div>
                            <label for="amphoe" class="col-1 col-form-label">อำเภอ</label>
                            <div class="col-4">
                                <input type="text" name="amphoe" placeholder="อำเภอ"  class="form-control" value="{{ a.amphur}}" required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="province" class="col-1 col-form-label">จังหวัด</label>
                            <div class="col-5">
                                <input type="text" value="{{ a.province}}" id="province" name="province" placeholder="จังหวัด" class="form-control" required="required">
                            </div>
                            <label for="zipcode" class="col-2 col-form-label">รหัสไปรษณี</label>
                            <div class="col-3">
                                <input type="text" value="{{ a.zipcode}}" id="zipcode" name="zipcode" placeholder="รหัสไปรษณี" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="phoneMain" class="col-2 col-form-label">เบอร์โทรหลัก</label>
                            <div class="col-3">
                                <input type="text" value="{{ a.phonenumberMain}}" id="phoneMain" name="phoneMain" placeholder="เบอร์โทรหลัก" class="form-control" required="required">
                            </div>
                            <label for="phoneReserve" class="col-2 col-form-label">เบอร์โทรรอง</label>
                            <div class="col-3">
                                <input type="text" value="{{ a.phonenumberReserve}}" id="phoneReserve" name="phoneReserve" placeholder="เบอร์โทรรอง" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="relationship" class="col-3 col-form-label">บุคคลที่เกี่ยวข้อง</label>
                            <div class="col-3">
                                <input type="text" value="{{ a.relatedpersons}}" id="relationship" name="relationship" placeholder="บุคคลที่เกี่ยวข้อง" class="form-control" required="required">
                            </div>
                            <label for="relationshipRelatedpersons" class="col-2 col-form-label">ความสัมพันธ์</label>
                            <div class="col-3">
                                <input type="text" value="{{ a.relationshipRelatedpersons}}" id="relationshipRelatedpersons" name="relationshipRelatedpersons" placeholder="ความสัมพันธ์" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="phonenumberRelatedpersons" class="col-4 col-form-label">เบอร์โทรของบุคคลที่เกี่ยวข้อง</label>
                            <div class="col-3">
                                <input type="text" value="{{ a.phonenumberRelatedpersons}}" id="phonenumberRelatedpersons" name="phonenumberRelatedpersons" placeholder="เบอร์โทรของบุคคลที่เกี่ยวข้อง" class="form-control" required="required">
                            </div>
                        </div>
                            <input type="submit" class="btn btn-outline-success" value="แก้ไข" /> &nbsp;&nbsp;
                            <input type="reset" class="btn btn-outline-danger" value="ยกเลิก" />
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
        <script type="text/javascript" src="jquery.Thailand.js/dependencies/JQL.min.js"></script>
        <script type="text/javascript" src="jquery.Thailand.js/dependencies/typeahead.bundle.js"></script>
        <script type="text/javascript" src="jquery.Thailand.js/jquery.Thailand.min.js"></script>
        <script>
                                $(document).ready(function () {
                                    //Load address
                                    $.Thailand({
                                        database: 'jquery.Thailand.js/data3.json',
                                        onComplete: function () {
                                            $('#loader, #address').toggle();
                                        }
                                    });
                                })
        </script>
    </body>

</html>
