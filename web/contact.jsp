<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="static/tag_head.jsp" />

    </head>

    <body>
        <jsp:include page="static/navTop.jsp" />
        <!-- Page Content -->
        <div class="container">

            <div class="row" id="content">
                <jsp:include page="static/navLeft.jsp" />
                <div class="col-lg-9">
                    <dl class="row" style="margin-top: 70px">
                        <dt class="col-sm-3">เบอร์โทร</dt>
                        <dd class="col-sm-9">064-7159899</dd>

                        <dt class="col-sm-3">อีเมล</dt>
                        <dd class="col-sm-9">plateroonbrand@gmail.com</dd>

                        <dt class="col-sm-3">ที่อยู่</dt>
                        <dd class="col-sm-9">511/23 หมู่ที่ 7 ตำบล กำแพง อำเภอ อุทุมพรพิสัย จังหวัด ศรีสะเกษ </dd>

                        <dt class="col-sm-4">ที่อยู่สำนักงาน Plateroon Brand</dt>
                        <dd class="col-sm-8">511/23 หมู่ที่ 7 ตำบล กำแพง อำเภอ อุทุมพรพิสัย จังหวัดศรีสะเกษ</dd>
                    </dl>
                    <div align="center" style="margin-top: 50px">
                        <div id="map" style="width: 700px;height: 400px;"></div>
                    </div>
                    <script>
                        function initAutocomplete() {
                            var map = new google.maps.Map(document.getElementById('map'), {
                                center: {lat: -33.8688, lng: 151.2195},
                                zoom: 13,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            });

                        }
                    </script>

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfzFXRym0QsWTMLXPc8KZLmr6-mhqNJOc&libraries=places&callback=initAutocomplete"
        async defer></script>
        <jsp:include page="static/footer.jsp" />
    </body>

</html>
