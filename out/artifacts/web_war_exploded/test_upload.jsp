
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>文件上传</title>
    <script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
<!--
    页面:
        form : method="post" ,
              enctype="multipart/form-data" : 文件二进制文件，request.getParameter("")
    服务器 接收上传的文件（servlet jsp == SmartUpload ）


 -->
<form  action="upload" method="post"  enctype="multipart/form-data">
    <input type="file" name="myfile" class="myfile"><br>
    <input type="submit" value="提交" class="submitBtn">
</form>
<div id="pre_img">
    <c:choose>
        <c:when test="${!empty msg}">
            ${msg}
        </c:when>
        <c:otherwise>
            <img src="${fileRealPath}" />
        </c:otherwise>
    </c:choose>
</div>


<script>
    /* var xhr = new XMLHttpRequest();
     $(".submitBtn").click(function () {
         var myfile =  $(".myfile").val();

         xhr.open("POST","upload");
        /!* xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");*!/
         xhr.onreadystatechange= fun1;
         xhr.send("myfile="+myfile);
     });


     function  fun1() {
         //若上传成功，需要将服务器中的图片展现在页面中
         if(xhr.readyState == 4 && xhr.status ==200){
             var result = JSON.parse(xhr.responseText);
             console.log("result:"+result);
             if(result =="文件类型不匹配"){
                     var ele = "<span style=\"color: red;font-size: 10px\">文件类型不匹配</span>";
                     $("#pre_img").append(ele);
             }else if(result == "文件上传失败"){
                 var ele = "<span style=\"color: red;font-size: 10px\">文件上传失败</span>";
                 $("#pre_img").append(ele);
             }else {//上传成功
                 var ele ="  <img src='' style=\"width: 100px;height: 100px;\" class=\"uploadImg\"/>";
                 $("#pre_img").append(ele);
                 //重新赋值该src的值
                 $(".uploadImg").src(result);
             }

         }

     }*/

</script>

</body>
</html>
