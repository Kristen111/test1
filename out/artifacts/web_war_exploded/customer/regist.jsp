<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/3/28
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>账号注册-马蜂窝</title>
    <link rel="stylesheet" href="../dist/css/bootstrap.css">
    <link rel="stylesheet" href="../dist/css/bootstrap-theme.css">
    <link rel="stylesheet" href="../css/regist.css">
    <script src="../dist/js/jquery-3.3.1.min.js"></script>
    <script src="../dist/js/bootstrap.js"></script>

    <link rel="icon" href="../images/M-icon.png">
</head>
<body>
<div class="wrapper">
    <div class="wrapper-logo">
        <a href="../index.jsp"></a>
    </div>
    <div class="wrapper-regist">
        <div class="inner-regist">
            <form method="post" action="cust/regist">
                <div class="form-field">
                    <input  name="username" type="text" placeholder="您的用户名" value="">
                </div>
                <div class="form-field">
                    <input name="password" type="password" placeholder="您的密码" value="">
                </div>
                <div class="form-field">
                    <input name="repassword" type="password" placeholder="确认您的密码" value="">
                </div>
                <div class="form-field">
                    <input name="telno" type="text" placeholder="手机号码" value="">
                    <span  class="tip" style="color: red;font-size: 10px"></span>
                </div>

                <div class="submit-btn">
                    <input  id="regButton" type="button" value="注册">
                </div>
            </form>
            <p>已有账号？<a href="login.jsp">点我登录</a></p>
        </div>
    </div>
</div>
<script src="../js/customer/regist.js"></script>
</body>
</html>
