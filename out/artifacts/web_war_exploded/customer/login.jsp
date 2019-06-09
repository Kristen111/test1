<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/4/2
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>账号登录-马蜂窝</title>
    <link rel="stylesheet" href="../dist/css/bootstrap.css">
    <link rel="stylesheet" href="../dist/css/bootstrap-theme.css">
    <link rel="stylesheet" href="../css/login.css">
    <script src="../dist/js/jquery-3.3.1.min.js"></script>
    <script src="../dist/js/bootstrap.js"></script>
    <link rel="icon" href="../images/M-icon.png">
</head>
<body>
<div class="wrapper">
    <div class="wrapper-logo">
        <a href="../index.jsp"></a>
    </div>
    <div class="wrapper-login">
        <div class="inner-login">
            <form action="" method="post">
                <div class="form-field">
                    <input   id="username" name="username" type="text" placeholder="您的邮箱/手机号" value="">
                </div>
                <div class="form-group">
                    <span class="reg_tip"></span>
                </div>
                <div class="form-field">
                    <input  name="password" type="password" placeholder="您的密码" value="">
                </div>
                <div>
                    <span class="tip" style="color: red;font-size: 10px"></span>
                </div>
                <div >
                    <div class="logAgreementBox" >
                        <input type="checkbox" class="logAgreementCheckbox" name="auto" value="auto">
                    </div>
                    <div class="logAgreementTitle">
                        <span>记住我</span>
                    </div>
                    <div class="forget-psw">
                        <a href="" target="_blank"></a>
                    </div>
                    <input type="button" value="登录"class="login-button" id="loginBtn"/>
                </div>
            </form>
            <p>还没有账号？<a href="../customer/regist.jsp">马上注册</a></p>
        </div>
        <div class="bottom-link"></div>
    </div>
</div>
<script src="../js/customer/login.js"></script>
</body>
</html>
