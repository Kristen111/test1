
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="icon" href="../images/favicon.ico">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/vacations.css">
    <link rel="stylesheet" href="../css/note/write.css">
    <link rel="stylesheet" href="../css/header_nav.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="../js/ajaxfileupload.js"></script>





</head>
<body>
<div class="header-nav container">
    <div class="row">
        <div class="logo col-md-2">
            <img src="../images/TA_logo_primary.svg">
        </div>
        <div class="first-nav col-md-7">
            <ul>
                <li><a href="">目的地</a></li>
                <li><a href="">酒店</a></li>
                <li><a href="">景点</a></li>
                <li><a href="">美食</a></li>
                <li><a href="note/list">游记</a></li>
                <li><a href="">指南</a></li>
                <li><a href="">旅行者</a></li>
                <li><a href="">App下载</a></li>
                <li><a href="">...</a></li>
            </ul>
        </div>
        <div class="nav-action col-md-3">
            <ul>
                <li><a href="javascript:;" id="icon1" title="写点评"></a></li>
                <li id="travel"><a href="javascript:;"  id="icon2" title="旅行" ></a></li>

                <c:choose>
                    <c:when test="${empty loginCustId}">

                        <li class="unlogin"><a href="customer/login.jsp"  id="icon3" title="登录用户"></a></li>
                        <li class="unlogin"><a href="customer/regist.jsp" class="login-btn" title="加入"  >注册</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="haslogin"><a href="cust/get?id=${loginCustId}"  id="loginName"  >${loginCustName}</a></li>
                        <li class="haslogin"><a href="javascript:;" class="login-btn" title="加入"  id="logout">退出</a></li>
                    </c:otherwise>
                </c:choose>


                <li><span class="sperator"></span></li>
                <li><a href="javascript:;"  id="icon4" title="搜索"></a></li>
            </ul>
        </div>
    </div>
</div>

<!-- 2. 设置游记头图-->

<div class="set-note-bg">
    <div class="set-bg-comp">

        <!-- 图片上传-->
        <form  method="post"  enctype="multipart/form-data" class="setNoteHeaderImgForm" >
            <input type="file" id ="myfile" name="myfile" class="myfile">
        </form>


        <%-- <a href=""></a>--%>
        <div class="setNoteHeaderImgTip">
            <p>设置游记头图</p>
            <p>图片建议选择尺寸大于1680px的高清大图，如相机原图</p>
        </div>
    </div>
</div>


<div style="width: 80%;margin: 0 auto;margin-top: 40px">


    <form action="${pageContext.request.contextPath}/note/add" method="post" id="noteForm">

        <input type="hidden" id="headImgPath" name="noteHeadImg">

        <ul style="margin: 0;padding: 0;">
            <li style="list-style: none">
                <label style="font-size: 14px;font-weight: bold">出发时间:</label><input type="date" name="noteTripDate" style="margin-left:20px;margin-top:10px;width: 280px;height: 40px;line-height: 40px">
            </li>
            <li style="list-style: none">
                <label style="font-size: 14px;font-weight: bold">出行天数:</label><input type="text" name="noteTripDays" style="margin-left:20px;margin-top:10px;width: 280px;height: 40px;line-height: 40px">
            </li>
            <li style="list-style: none">
                <label style="font-size: 14px;font-weight: bold">同行人:</label>
                <select name="noteTripPartner" style="margin-left:20px;margin-top:10px;width: 280px;height: 40px;line-height: 40px">
                    <option value="0">家人</option>
                    <option value="1">同事</option>
                    <option value="2">一个人</option>
                    <option value="3">朋友</option>
                </select>
            </li>
            <li style="list-style: none">
                <label style="font-size: 14px;font-weight: bold">人均费用:</label><input type="text" name="noteTripFeePerPeople" style="margin-left:20px;margin-top:10px;width: 280px;height: 40px;line-height: 40px">
            </li>
        </ul>
        <label style="font-size: 14px;font-weight: bold">标题:</label>
        <input type="text" name="noteTitle" style="margin-left:20px;margin-top:15px;width: 680px;height: 40px;line-height: 40px"><br>
        <div id="editor" name="noteContent" type="text/plain"  style="width: 1000px;height: 400px;margin-top: 10px"
        ></div>

        <br> <input type="submit" value="提交游记" style="border: none;width: 80px;height: 40px;background-color: #116644;color: white;">
    </form>

</div>

<script type="text/javascript">
    var ue = UE.getEditor('editor');
    var len =  ue.getContentTxt().length;
    console.log(len);

</script>






<!-- 4. 底部-->
<div id="footer">
    <div class="responsive-footer">
        <div class="response-item">
            <h3>关于马蜂窝</h3>
            <ul>
                <li><a href="">品牌故事</a></li>
                <li><a href="">公司信息</a></li>
            </ul>
        </div>

        <div class="response-item">
            <h3>关于马蜂窝</h3>
            <ul>
                <li><a href="">品牌故事</a></li>
                <li><a href="">公司信息</a></li>
                <li><a href="">品牌故事</a></li>
                <li><a href="">公司信息</a></li>
            </ul>
        </div>
        <div class="response-item">
            <h3>关于马蜂窝</h3>
            <ul>
                <li><a href="">品牌故事</a></li>
                <li><a href="">公司信息</a></li>
                <li><a href="">品牌故事</a></li>
                <li><a href="">公司信息</a></li>
            </ul>
        </div>
        <div class="response-item">
            <h3>关于马蜂窝</h3>
            <ul>
                <li><a href="">品牌故事</a></li>
                <li><a href="">公司信息</a></li>
                <li><a href="">品牌故事</a></li>
                <li><a href="">公司信息</a></li>
            </ul>
        </div>
    </div>

</div>
</div>




<script src="../js/customer/logout.js"></script>
<script src="../js/note/upload.js"></script>
</body>
</html>