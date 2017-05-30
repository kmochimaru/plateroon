<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Plateroon Brand</title>
        <link rel="shortcut icon" href="img/Plateroon-LOGO.ico">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/icon-social.css">
        <link href="https://fonts.googleapis.com/css?family=Prompt" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

    </head>

    <body>
        <div class="wrapper">
            <form class="login" action="${pageContext.request.contextPath}/LoginController" method="POST">
                <p class="title">เข้าสู่ระบบ</p>
                <input type="text" id="username" name="username" placeholder="ชื่อผู้ใช้" autofocus required="required"/>
                <i class="fa fa-user"></i>
                <input type="password" name="password"  placeholder="รหัสผ่าน" required="required"/>
                <i class="fa fa-key"></i>
                <a href="#" data-toggle="tooltip" title="Tooltip on top">ลืมรหัสผ่าน ?</a>
                <button type="submit">
                    <i class="spinner"></i>
                    <span class="state" style="font-family: 'Prompt', sans-serif;">เข้าสู่ระบบ</span>
                </button>
            </form>
            <footer>
                    <c:if test="${username == 'ผู้ดูแลระบบ'}"><a href="admin/dashboard.jsp" align="left" >กลับสู่หน้าหลัก</a></c:if>
                    <c:if test="${username != 'ผู้ดูแลระบบ'}"><a href="index.jsp" align="left" >กลับสู่หน้าหลัก</a></c:if>
                    &nbsp;&nbsp;&nbsp; 
                    <c:if test="${username != null}">
                        <a href="register.jsp">สมัครเป็นตัวแทนจำหน่าย</a>
                    </c:if>
            </footer>
        </div>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="js/login.js"></script>
        
    </body>
</html>
