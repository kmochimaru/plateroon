<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="static/tag_head.jsp" />
        <link href="css/agentCard.css" rel="stylesheet" />
    </head>

    <body>
        <jsp:include page="static/navTop.jsp" />
        <c:if test="${username == null}">
            <jsp:forward page="login.jsp"/>
        </c:if>
        <!-- Page Content -->
        <div></div>
        <div class="container" ng-app="profile" ng-controller="mainController">

            <div class="row" id="content">
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9" align="center">

                    <!--img src="agentCard/DL.jpg" width="600" height="500" -->
                    <div class="row" id="printAgentCard" align="center" 
                         style="background-image:{{ url }}">
                        <div class="col-7" align="left">
                            <img id="img-profile" src="{{ a.imgPath }}" width="194" height="264">

                            <div class="form-group">
                                <h5 class="div-left">{{ a.agentId}}</h5>
                            </div>
                            <div class="form-group" ng-show="field_of_work.text">
                                <h5 class="div-left" style="padding-left: 5px;">{{ field_of_work.text }}</h5>
                            </div>
                            <div class="form-group" ng-show="!field_of_work.text">
                                <h5 class="div-left" style="padding-left: 55px;">-</h5>
                            </div>
                        </div>
                        <div class="col-5">
                            <div class="form-group" style="text-align: left; padding-top: 62%;">
                                <h5>{{ a.firstname}}
                                    {{ a.lastnames}}</h5>
                            </div>
                            <div class="form-group">
                                <h5>{{ a.facebook}}</h5>
                            </div>
                            <div class="form-group">
                                <h5>{{ a.line}}</h5>
                            </div>
                            <div class="form-group">
                                <h5>{{ a.instagram}}</h5>
                            </div>
                            <div class="form-group">
                                <h5>{{ a.phonenumberMain}}</h5>
                            </div>
                            <div class="form-group" style="margin-bottom: 65px;">
                                <h5>{{a.amphur}} {{a.province}}</h5>
                            </div>

                            <div class="form-group">
                                <h6>{{a.agentCode}}</h6>
                            </div>
                            <div class="form-group" ng-show="pick_up_from.text">
                                <h6>{{ pick_up_from.text }}</h6>
                            </div>
                            <div class="form-group" ng-show="!pick_up_from.text">
                                <h6>-</h6>
                            </div>
                            <div class="form-group">
                                <h6>{{a.expiredDate}}</h6>
                            </div>
                        </div>

                    </div><!-- row img -->

                    <br>
                    <div class="col-sm-9">
                        <div class="form-inline">
                            <label class="col-sm-3">สายงาน</label>
                            <input type="text" maxlength="11" class="form-control col-sm-5" ng-init="field_of_work = {text:''}" ng-model="field_of_work.text">
                        </div><br>
                        <div class="form-inline">
                            <label class="col-sm-3">รับของจาก</label>
                            <input type="text" maxlength="13" class="form-control col-sm-5" ng-init="pick_up_from = {text:''}" ng-model="pick_up_from.text">
                        </div><br>
                        <div class="form-inline">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-info" onclick="printCard()"><i class="fa fa-print" aria-hidden="true"></i></button>
                        </div>
                        <script>
                                    function printCard() {
                                        $("#printAgentCard").print({
                                            globalStyles: true,
                                            mediaPrint: false,
                                            stylesheet: null,
                                            noPrintSelector: ".no-print",
                                            iframe: true,
                                            append: null,
                                            prepend: null,
                                            manuallyCopyFormValues: true,
                                            deferred: $.Deferred(),
                                            timeout: 750,
                                            title: null,
                                            doctype: '<!doctype html>'
                                        });
                                    }
                        </script>
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
        <script src="js/jQuery.print.js"></script>
    </body>

</html>
