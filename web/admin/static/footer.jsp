<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Footer -->
<footer class="py-5 bg-inverse" >
    <div class="container">
        <div align="left">
            <ul class="agileits_social_icons">
                <li><h6 class="text-white">&nbsp;&nbsp;&nbsp;ติดต่อพวกเรา</h6></li><br>
                <li><a href="https://www.facebook.com/Plateroon/" class="facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="#" class="twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="http://www.instagram.com/plateroon" class="instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
            </ul>
        </div>
        <p class="m-0 text-center text-white">Copyright © 2017 JTMSolutions Co.,Ltd</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/tether/tether.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.1/angular.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ngStorage/0.3.11/ngStorage.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/angular-confirm.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/admin/js/jconfirmaction.jquery.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/dashboard.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery.Thailand.js/dependencies/JQL.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery.Thailand.js/dependencies/typeahead.bundle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery.Thailand.js/jquery.Thailand.min.js"></script>
<script>
    $(document).ready(function () {
        //Load address
        $.Thailand({
            database: '../jquery.Thailand.js/data3.json',
            onComplete: function () {
                $('#loader, #address').toggle();
            }
        });
    })
</script>
