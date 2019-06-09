
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>文件上传</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/ajaxfileupload.js"></script>
</head>
<body>

<form  method="post"  enctype="multipart/form-data">
    <input type="file" id = "myfile" name="myfile" class="myfile"><br>

</form>
<div id="pre_img">

</div>


<script>
    $(".myfile").change(function () {

        var exname = $(".myfile").val().split("\\")[2];
        console.log("exname:"+exname);

        if (exname.indexOf("png") != -1 || exname.indexOf("jpg") != -1 || exname.indexOf("gif") != -1 || exname.indexOf("bmp") != -1 || exname.indexOf("jpeg") != -1) {
            $.ajaxFileUpload(
                {
                    url: 'uploadAjax',
                    method:'post',
                    secureuri: true,
                    fileElementId: 'myfile',
                    processData:false,
                    contentType:false,
                    success: function (data) {  // xhr.readyState ==4 && xhr.status ==200

                        var ele = " <img src=\"\" id='pic' />";
                        $("#pre_img").append(ele);
                        $("#pic").attr("src", "upload/"+exname);
                    },
                    error: function (data) {
                        alert("error");
                    }
                }
            )
        } else {
            alert("必须是图片！");
        }



    });

</script>

</body>
</html>
