<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="static/tag_head.jsp" />
        <link rel="stylesheet" href="./jquery.Thailand.js/jquery.Thailand.min.css">
        <link rel="stylesheet" href="css/upload.css">
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

                    <div class="card">
                        <img src="{{ a.imgPath}}" id="img-preview" width="250" height="250" />
                        <label class="file-upload-container" for="file-upload">
                            <input id="file-upload" type="file" accept="image/*" style="display:none;">
                            เลือกรูปภาพ
                        </label>
                    </div>

                    <form action="${pageContext.request.contextPath}/AgentController?action=update" method="POST">
                        <legend>รายละเอียดข้อมูลส่วนตัว</legend>
                        <input type="hidden" value="{{ a.username}}" name="username" id="username" >
                        <input type="hidden"  value="{{ a.password}}" name="password" id="password" >
                        <input type="hidden" value="{{ a.imgPath }}" name="imgPath" id="imgPath" >
                        <input type="hidden" value="{{ a.imgName }}" name="imgName" id="imgName" >
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
                            <div class="col-lg-4">
                                <input type="hidden" id="idCard" name="idCard" value="{{ a.idcard}}" />
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
                            <div class="col-2">
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
                            <div class="col-2">
                                <select name="degreeId" class="form-control" required="required" ng-model="a.degreeId">
                                    <option value="1">DI</option>
                                    <option value="2">VIP</option>
                                    <option value="3">Main</option>
                                    <option value="4">Sub</option>
                                </select>
                            </div>
                        </div>
                        <hr>
                        <legend>รายละเอียดที่อยู่</legend>
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
                            <label for="facebook" class="col-2 col-form-label">facebook</label>
                            <div class="col-4">
                                <input type="text" name="facebook" placeholder="facebook" class="form-control" value="{{ a.facebook}}" required="required">
                            </div>
                            <label for="line" class="col-1 col-form-label">line</label>
                            <div class="col-3">
                                <input type="text" name="line" placeholder="line"  class="form-control" value="{{ a.line}}" required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="instagram" class="col-2 col-form-label">instagram</label>
                            <div class="col-4">
                                <input type="text" name="instagram" placeholder="instagram" class="form-control" value="{{ a.instagram}}" required="required">
                            </div>
                        </div>
                        <hr>
                        <legend>บุคคลที่เกี่ยวข้อง</legend>
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
                        </div><br>
                        <div align="center">
                            <button type="submit" class="btn btn-outline-success"><i class="fa fa-floppy-o" aria-hidden="true"></i> แก้ไข</button> &nbsp;&nbsp;
                            <input type="reset" class="btn btn-outline-danger" value="ล้างข้อมูล" />
                        </div>
                    </form>
                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->
            <!-- Modal -->
            <div class="modal fade" id="uploading" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">กำลังอัพโหลดรูปภาพกรุณารอสักครู่..</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->
        <jsp:include page="static/footer.jsp" />
        <script src='http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js'></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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

                                    var CLOUDINARY_URL = 'https://api.cloudinary.com/v1_1/jirayu/upload'
                                    var CLOUDINARY_DEL = 'https://api.cloudinary.com/v1_1/jirayu/imgage/upload?public_id=pbb5yas8mhekwjqot2zn'
                                    var CLOUDINARY_UPLOAD_PRESET = 'gcv0j4za'
                                    var imgPreview = document.getElementById('img-preview')
                                    var fileUpload = document.getElementById('file-upload')

                                    fileUpload.addEventListener('change', function (event) {
                                        //$('#myModal').data('bs.modal').options.keyboard = true;
                                        $('#uploading').modal('show')
                                        var file = event.target.files[0]
                                        var formData = new FormData()
                                        formData.append('file', file)
                                        formData.append('upload_preset', CLOUDINARY_UPLOAD_PRESET)
                                        axios({
                                            url: CLOUDINARY_URL,
                                            method: 'POST',
                                            header: {
                                                'Content-Type': 'application/x-www-form-urlencoded'
                                            },
                                            data: formData
                                        }).then(function (res) {
                                            //console.log(res)
                                            //console.log(res.data.public_id)
                                            //imgPreview.src = res.data.secure_url

                                            $.ajax({
                                                url: "AgentController?action=updateImg",
                                                type: "POST",
                                                data: {imgPath: res.data.secure_url,
                                                    imgName: res.data.public_id,
                                                    agentCode: $('#agentCode').val()},
                                                success: function (data, textStatus, jqXHR) {
                                                    $('#progress').modal('hide')
                                                    toastr.success('', 'อัพโหลดสำเร็จ !')
                                                    setTimeout(function () {
                                                        location.reload()
                                                    }, 1500)
                                                    
                                                },
                                                error: function (jqXHR, textStatus, errorThrown) {
                                                    toastr.error('', 'อัพโหลดล้มเหลว !')
                                                }
                                            });

                                        }).catch(function (err) {
                                            console.log(err)
                                        })

                                    })
        </script>
    </body>

</html>
