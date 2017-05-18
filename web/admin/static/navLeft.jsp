<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="fb-root"></div>
<script>(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/th_TH/sdk.js#xfbml=1&version=v2.9";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>

<div class="col-lg-3">
    <div id="logo" align="center">
        <img src="../img/Plateroon-LOGO.ico" width="150" height="150"  />
    </div>
    <!--h1 class="my-4">PLATEROON</h1-->
    <div class="list-group">
        <a href="#" class="list-group-item active"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;จัดการข้อมูลต่างๆ</a>
        <a href="dashboard.jsp" class="list-group-item list-group-item-action"><span class="badge badge-warning" ng-if="notify > 0">{{ notify}}</span> &nbsp;<b>รออนุมัติ</b></a>
        <a href="agent.jsp" class="list-group-item list-group-item-action"> &nbsp;<b>ตัวแทนจำหน่าย</b></a>
        <a href="degree.jsp" class="list-group-item list-group-item-action">&nbsp;<b>ระดับผู้ใช้ระบบ</b></a>
    </div>
    <div align="center">
        <div class="fb-page" data-href="https://www.facebook.com/Plateroon/?fref=ts" data-tabs="timeline" data-width="270" data-small-header="false" data-adapt-container-width="false" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/Plateroon/?fref=ts" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/Plateroon/?fref=ts">Plateroon Thailand</a></blockquote></div>
    </div>
    <div class="img-space-top" align="center">
        <img src="../img/Advertisement Banner_170216_0069.jpg" width="270" height="270" />
    </div>
    <!--div class="icon-social" align="center">
        <h5 align="center">โซเชียลมิเดีย</h5><br>
        <a href="http://twitter.com/minimalmonkey" class="icon-button twitter"><i class="fa fa-twitter"></i><span></span></a>
        <a href="https://www.facebook.com/Plateroon/" class="icon-button facebook"><i class="fa fa-facebook"></i><span></span></a>
        <a href="http://www.instagram.com/plateroon" class="icon-button instagram"><i class="fa fa-instagram"></i><span></span></a>  
    </div-->
</div>
<!-- /.col-lg-3 -->
