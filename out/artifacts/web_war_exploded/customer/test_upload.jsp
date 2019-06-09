<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/4/4
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
</head>
<body>
    <!--
        页面：form：method="POST"
        enctype="multipart/form-data"

        服务器接收上传的文件 servlet jsp==SmartUpload

    -->

    <form method="post" enctype="multipart/form-data">
        <input type="file" name="myfile" class="myfile" ><br>
        <input type="button" value="提交" class="submitBtn">
    </form>






</body>
</html>
