<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navigation -->
<nav class="navbar fixed-top navbar-toggleable-md navbar-inverse" style="background-color: #66ccff;">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarExample" aria-controls="navbarExample" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="container">
        <a class="navbar-brand" href="index.jsp" style="margin-left: 30px;"><h3 id="nav-text">PLATEROON Co.,LTD.</h3></a>
        <div class="collapse navbar-collapse" id="navbarExample">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> หน้าแรก <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp"><i class="fa fa-book" aria-hidden="true"></i> เกี่ยวกับ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp"><i class="fa fa-envelope" aria-hidden="true"></i> ติดต่อเรา</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="" id="member" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-user-circle" aria-hidden="true"></i>
                        <c:if test="${username == null}">สมาชิก</c:if>
                        <c:if test="${username != null}">${username}</c:if>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="member">
                        <c:if test="${username == null}">
                            <a class="dropdown-item" href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;เข้าสู่ระบบ</a>
                        </c:if>
                        <c:if test="${username != null && username != 'ผู้ดูแลระบบ' }">
                            <a class="dropdown-item" href="logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;ออกระบบ</a>
                            <a class="dropdown-item" href="editProfile.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;แก้ไขข้อมูลส่วนตัว</a>
                            <a class="dropdown-item" href="agentCard.jsp"><i class="fa fa-id-card-o" aria-hidden="true"></i>&nbsp;ออกบัตรตัวแทนจำหน่าย</a>
                            <a class="dropdown-item" href="manageUsers.jsp"><i class="fa fa-key" aria-hidden="true"></i>&nbsp;เปลี่ยนชื่อและรหัสผู้ใช้</a>
                            <a class="dropdown-item" href="manageMember.jsp"><i class="fa fa-users" aria-hidden="true"></i>&nbsp;จัดการสมาชิก</a>
                            <a class="dropdown-item" href="register.jsp"><i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;ลงทะเบียน</a>
                        </c:if>
                        <c:if test="${username == 'ผู้ดูแลระบบ'}">
                            <a class="dropdown-item" href="logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;ออกระบบ</a>
                            <a class="dropdown-item" href="register.jsp"><i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;ลงทะเบียน</a>
                            <a class="dropdown-item" href="admin/dashboard.jsp"><i class="fa fa-users" aria-hidden="true"></i>&nbsp;จัดการข้อมูล</a>
                        </c:if>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
