<%@page import="java.util.ArrayList"%>
<%@page import="entities.Agent"%>
<%@page import="entities.Agent"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
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
                    <div>
                        <div class="wrapper">
                            <form class="login" action="${pageContext.request.contextPath}/AgentController?action=checkAgent" method="GET">
                                <p class="title">กรอกเลขประจำตัวของตัวแทน</p>
                                <input type="text" id="agentCode" name="agentCode" placeholder="" required="required"/>
                                <i class="fa fa-user"></i>
                                <button type="submit">
                                    <i class="spinner"></i>
                                    <div class="fail"></div>
                                    <span class="state" style="font-family: 'Prompt', sans-serif;">ตรวจสอบ</span>
                                </button>
                            </form>
                        </div>
                    </div>

                        
                    <!-- Modal -->
                    
                        <div class="modal fade" id="checkAgent" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="label"></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <!--
                                        <div class="col-lg-4">
                                            <img src="http://placehold.it/380x500" class="img-thumbnail" />
                                        </div><br>
                                        <div class="col-lg-7" style="text-aling: center;">
                                            <h4>{{ agent.agentCode }}</h4>
                                            <small><cite title="location">ต.{{ agent.district }}&nbsp; อ.{{ agent.amphur }} จ.{{agent.province}} 
                                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                </cite></small>
                                            <p>
                                                <i class="fa fa-id-badge" aria-hidden="true"></i> &nbsp; {{ agent.firstname }} &nbsp; {{ agent.lastnames }}
                                                <br />
                                                <i class="fa fa-phone" aria-hidden="true"></i> &nbsp; {{ agent.phonenumberMain }}, {{ agent.phonenumberReserve }}
                                                <br />
                                                <i class="glyphicon glyphicon-gift"></i>
                                        </div> -->


                                    </div><!-- body -->
                                </div>
                            </div>
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
    </body>

</html>
