<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="static/tag_head.jsp" />
        <link rel="stylesheet" href="./jquery.Thailand.js/jquery.Thailand.min.css">
        <style>
            #card  {
                padding: 10px;
                -moz-transition: all 0.3s;
                -webkit-transition: all 0.3s;
                transition: all 0.3s;
                border: solid 1px #CCC;
                -moz-box-shadow: 5px 5px 0px #999;
                -webkit-box-shadow: 5px 5px 0px #999;
                box-shadow: 5px 5px 0px #999;
            }
            #card:hover {
                -moz-transform: scale(1.1);
                -webkit-transform: scale(1.1);
                transform: scale(1.1);
            }
            .top_space{
                margin-top: 10px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="static/navTop.jsp" />
        <!-- Page Content -->
        <div class="container">

            <div class="row" id="content" >
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9" align="center">
                    <h1>ค้นหาตัวแทน</h1><br>
                    <div class="col-lg-9 row">
                        <form class="form-group row" action="${pageContext.request.contextPath}/AgentController?action=searchAgent" method="POST">
                            <label class="col-lg-4" for="">อำเภอ</label>
                            <div class="col-lg-5" id="amphoe">
                                <input class="form-control" type="text" id="amphoe" name="amphoe"  placeholder="อำเภอ" >
                            </div>
                            <label class="col-lg-4 top_space" for="province">จังหวัด</label>
                            <div class="col-lg-5 top_space">
                                <input class="form-control" type="text" id="province" name="province"  placeholder="จังหวัด" >
                            </div>
                            <div class="col-lg-4 top_space"></div>
                            <div align="left" class="col-lg-5 top_space">
                                <input type="submit" class="btn btn-outline-info" value="ค้นหา" />
                            </div>
                        </form>
                    </div>
                    <c:if test="${searchSize <= 0}">
                        <h3 style="color: red; margin-top: 15%">ไม่พบตัวแทนจำหน่าย</h3>
                    </c:if>
                    <c:forEach items="${search}" var="bean">
                        <div class="row col-lg-9" id="card" style="margin-top: 20px;">
                            <div class="col-lg-4">
                                <img src="http://placehold.it/380x500" alt="" class="img-thumbnail" />
                            </div>

                            <div class="col-lg-7" style="padding-top: 8%; text-aling: center;">
                                <h4>${ bean.agentCode }</h4>
                                <small><cite title="location">ต.${ bean.district }&nbsp; อ.${ bean.amphur } จ.${bean.province} 
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    </cite></small>
                                <p>
                                    <i class="fa fa-id-badge" aria-hidden="true"></i> &nbsp; ${ bean.firstname } &nbsp; ${ bean.lastnames }
                                    <br />
                                    <i class="fa fa-phone" aria-hidden="true"></i> &nbsp; ${ bean.phonenumberMain }, ${ bean.phonenumberReserve }
                                    <br />
                                    <i class="glyphicon glyphicon-gift"></i>
                            </div>
                        </div>
                    </c:forEach>
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
