<%@page import="daoImp.DegreeDaoImp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
        <title>ลงทะเบียน</title>
        <link rel="shortcut icon" href="img/Plateroon-LOGO.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./jquery.Thailand.js/jquery.Thailand.min.css">
        <link href="https://fonts.googleapis.com/css?family=Prompt" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    </head>
    <body>
        <% 
            DegreeDaoImp dao = new DegreeDaoImp();
            request.getSession().setAttribute("allDegree", dao.getAllDegree());
        %>
        <div class="wrapper">
            <div class="container" ng-app="profile" ng-controller="mainController">
                <!-- Name Section -->

                <div class="row" style="margin-left: 10%">
                    <div class="col-md-8 col-md-offset-1" id="register-box">
                        <h1 align="center" class="font-color" >ลงทะเบียนเป็นตัวแทนจำหน่าย</h1><br>
                        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/AgentController?action=add" method="POST" data-toggle="validator">
                            <fieldset>

                                <!-- Form Name -->
                                <legend class="font-color">รายละเอียดข้อมูลส่วนตัว</legend>

                                <!-- Text input-->
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <input type="text" name="fistName" placeholder="ชื่อ" class="form-control" required="required">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" name="lastName" placeholder="นามสกุล" class="form-control" required="required">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="number" id="idCard" name="idCard" maxlength="13" value="" placeholder="เลขประจำตัวประชาชน" class="form-control" required="required">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <input type="date" name="birthday" placeholder="วันเกิด" class="form-control" required="required">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" name="nationality" placeholder="สัญชาติ" class="form-control" required="required">
                                    </div>
                                    <div class="col-sm-2">
                                        <select name="gender" class="form-control" required="required">
                                            <option value="" selected disabled>เพศ</option>
                                            <option value="หญิง">หญิง</option>
                                            <option value="ชาย">ชาย</option>
                                        </select>
                                    </div>
                                </div>

                                <legend class="font-color">รหัส เลขประจำตัว วันหมดอายุ ของสมาชิก</legend>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <input type="text" name="agentId" maxlength="16" placeholder="รหัสตัวแทน" class="form-control" required="required">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" name="agentCode"  placeholder="เลขประจำตัวของตัวแทน" class="form-control" required="required">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="date" name="expiredDate" id="expired_date"  class="form-control" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <select name="degreeId" class="form-control" required="required">
                                            <option value="" selected disabled>ระดับ</option>
                                            <c:forEach items="${allDegree}" var="d"> 
                                                <c:if test="${ d.degreeId > degreeId}">
                                                    <option value="${ d.degreeId }">${ d.degreeName }</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <!-- Address Section -->
                                <!-- Form Name -->
                                <legend class="font-color">รายละเอียดที่อยู่</legend>
                                <!-- Text input-->
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <input type="text" name="address"  placeholder="ที่อยู่" class="form-control" required="required">
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div  id="address" style="display:none;">
                                    <div class="form-group">
                                        <div class="col-sm-5">
                                            <input type="text" name="district" placeholder="ตำบล" class="form-control" required="required">
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="text" name="amphoe" placeholder="อำเภอ" class="form-control" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-5">
                                            <input type="text" name="province" placeholder="จังหวัด" class="form-control" required="required">
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="text" name="zipcode" placeholder="รหัสไปรษณี" class="form-control" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-3">
                                            <input type="text" name="phoneMain"  placeholder="เบอร์โทรหลัก" class="form-control" required="required">
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="text" name="phoneReserve"  placeholder="เบอร์โทรรอง" class="form-control" required="required">
                                        </div>
                                    </div>
                                </div>

                                <!-- Parent/Guadian Contact Section -->
                                <!-- Form Name -->
                                <legend class="font-color">บุคคลที่เกี่ยวข้อง</legend>
                                <!-- Text input-->
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <input type="text" name="relationship"  placeholder="บุคคลที่เกี่ยวข้อง" class="form-control" required="required">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" name="relationshipRelatedpersons"  placeholder="ความสัมพันธ์" class="form-control"required="required">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" name="phonenumberRelatedpersons"  placeholder="เบอร์โทรของบุคคลที่เกี่ยวข้อง" class="form-control"required="required">
                                    </div>
                                </div>

                                <!-- Command -->
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-4" align="left">
                                        <a href="index.jsp" align="left" >
                                            <button type="button" class="btn btn-default btn-sm">
                                                <i class="fa fa-chevron-circle-left" aria-hidden="true">&nbsp;ไปยังเว็บไซต์</i>
                                            </button>
                                        </a>
                                    </div>
                                    <div class="col-sm-4" align="center">
                                        <button type="reset" class="btn btn-danger">ยกเลิก</button>
                                        <button id="btnSubmit" type="submit" class="btn btn-success">ลงทะเบียน</button>
                                    </div>
                                    <div class="col-sm-4" align="right">
                                        <a href="login.jsp" align="left" >
                                            <button type="button" class="btn btn-default btn-sm">
                                                <i class="fa fa-sign-in" aria-hidden="true">&nbsp;เข้าสู่ระบบ</i>
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div><!-- /.col-lg-12 -->
                </div><!-- /.row -->
            </div><!-- container -->
        </div>

        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="jquery.Thailand.js/dependencies/JQL.min.js"></script>
        <script type="text/javascript" src="jquery.Thailand.js/dependencies/typeahead.bundle.js"></script>
        <script type="text/javascript" src="jquery.Thailand.js/jquery.Thailand.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="js/register.js"></script>
        <style>

            body{
                font-family: 'Prompt', sans-serif;
                height: 100vh;
                background: url("img/Advertisement Banner_170216_0027.jpg") 50% fixed;
                background-size: cover;

            }

            #register-box{
                background-color: white;
                -webkit-box-shadow: 5px 5px 17px 0px rgba(87, 90, 94, 0.73);
                -moz-box-shadow:    5px 5px 17px 0px rgba(87, 90, 94, 0.73);
                box-shadow:         5px 5px 17px 0px rgba(87, 90, 94, 0.73);
            }

            .wrapper {
                display: flex;
                align-items: center;
                flex-direction: column;
                justify-content: center;
                width: 100%;
                min-height: 100%;
                padding: 20px;
                background: rgba(4, 40, 68, 0.85);
            }

            .font-color{
                color: black;
            }

            label{
                font-size: 1.6em;
                display: block;
            }
            input[type=number]::-webkit-outer-spin-button,
            input[type=number]::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            input[type=number] {
                -moz-appearance:textfield;
            }
        </style>
    </body>
</ht