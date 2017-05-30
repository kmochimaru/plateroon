<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation -->
<nav class="navbar fixed-top navbar-toggleable-md navbar-inverse" style="background-color: #66ccff;">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarExample" aria-controls="navbarExample" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="container">
        <a class="navbar-brand" href="dashboard.jsp" style="margin-left: 30px;"><h3 id="nav-text">PLATEROON Co.,LTD.</h3></a>
        <div class="collapse navbar-collapse" id="navbarExample">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="" id="member" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${username}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="member">
                        <a class="dropdown-item" href="../logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;ออกระบบ</a>
                        <a class="dropdown-item" href="../register.jsp"><i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;ลงทะเบียน</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
