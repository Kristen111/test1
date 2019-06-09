<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/4/6
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>添加文字-写游记</title>
    <link rel="stylesheet" href="../dist/css/bootstrap.css">
    <link rel="stylesheet" href="../dist/css/bootstrap-theme.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/note/write.css">
    <script src="../dist/js/jquery-3.3.1.min.js"></script>
    <script src="../dist/js/bootstrap.js"></script>
    <link rel="icon" href="../images/M-icon.png">

    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="../js/ajaxfileupload.js"></script>




    <style>
        .header_nav{
            width: 1100px;
            height: 58px;
            font-size: 14px;
            line-height: 58px;
            display: inline;
            text-align: center;
            float: left;
        }
        .header_nav li img{
            border-radius: 50%;
            width: 20px;
            height: 20px;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="header-logo">
        <a class="mfw-logo" href="../index.jsp" alt="马蜂窝自由行" target="_blank"></a>
    </div>
    <ul class="header_nav">
        <li class="first"><a  href="">首页</a></li>
        <li><a href="destination.html">目的地</a></li>
        <li><a href="gonglve.html">旅游攻略</a></li>
        <li><a href="javascript:;">旅行商城</a>
            <ul class="second-down-menu">
                <li><a href="">自由行</a></li>
                <li><a href="">跟团游</a></li>
                <li><a href="">当地游</a></li>
                <li><a href="">国内机票</a></li>
                <li><a href="">签证</a></li>
            </ul>
        </li>
        <li><a href="">酒店</a></li>
        <li><a href="">社区</a>
            <ul class="second-down-menu">
                <li><a href="">问答</a></li>
                <li><a href="">马蜂窝周边</a></li>
                <li><a href="">蜂首俱乐部</a></li>
                <li><a href="">结伴</a></li>
            </ul>
        </li>
        <li><a href="">APP</a></li>
    </ul>
    <div class="login-out">



        <c:choose>
            <c:when test="${empty loginCustId}">

                <li class="unlogin"><a href="../customer/login.jsp" class="login-btn">登录</a></li>

                <li class="unlogin"><a href="../customer/login.jsp"  id="icon3" title="登录用户"></a></li>
                <li class="unlogin"><a href="../customer/regist.jsp" class="login-btn" title="加入"  >注册</a></li>
            </c:when>
            <c:otherwise>
                <li class="haslogin"><a href="cust/get?id=${loginCustId}"  id="loginName"  >${loginCustName}</a></li>
                <li class="haslogin"><a href="javascript:;" class="login-btn" title="加入"  id="logout">退出</a></li>
            </c:otherwise>
        </c:choose>
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

    <form action="${pageContext.request.contextPath}/note/add.jsp" method="post" id="noteForm">

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

        <div>
            <h1>完整demo</h1>
            <form action="saveNewServlet" method="post">
                标题:<input type="text" name="author"><br>
                内容：<div id="editor" name="content" type="text/plain" 			style="width:1024px;height:500px;"></div>
                <br> <input type="button" value="提交游记" class="submitBtn">
            </form>
        </div>

        <%--<label style="font-size: 14px;font-weight: bold">标题:</label>
        <input type="text" name="noteTitle" style="margin-left:20px;margin-top:15px;width: 680px;height: 40px;line-height: 40px"><br>
        <div id="editor" name="noteContent" type="text/plain"  style="width: 1000px;height: 400px;margin-top: 10px"
        ></div>

        <br> <input type="submit" value="提交游记" style="border: none;width: 80px;height: 40px;background-color: #116644;color: white;">--%>
    </form>

</div>

<!-- 实例化富文本编辑器-->
<script type="text/javascript">
    var ue = UE.getEditor('editor');
</script>



<%--
<script type="text/javascript">
    var ue = UE.getEditor('editor');
    var len =  ue.getContentTxt().length;
    console.log(len);

</script>
--%>


<!-- footer -->
<div class="footer">
    <div class="footer-content">
        <div class="ft-info">
            <ul class="ft-info-intro">
                <li class="big-font">全球旅游消费指南 </li>
                <li>覆盖全球200多个国家和地区</li>
                <li><span>100,000,000</span> 位旅行者</li>
                <li><span>920,000</span> 家国际酒店</li>
                <li><span>21,000,000</span> 条真实点评</li>
                <li><span>382,000,000</span> 次攻略下载</li>
                <li><a href="">马蜂窝全球自由行“玩法”</a></li>
            </ul>
            <ul class="ft-info-about">
                <li class="big-font">关于我们</li>
                <li><a href="">关于马蜂窝</a><a href="">联系我们</a></li>
                <li><a href="">隐私政策</a><a href="">商标声明</a></li>
                <li><a href="">服务协议</a><a href="">游记协议</a></li>
                <li><a href="">商城平台服务协议</a></li>
                <li><a href="">网络信息侵权通知指引</a></li>
                <li><a href="">网站地图</a><a class="highlight" href="">加入马蜂窝</a></li>
            </ul>
            <ul class="ft-info-service">
                <li class="big-font">旅行服务</li>
                <li><a href="">旅游攻略</a><a href="">酒店预订</a></li>
                <li><a href="">旅游特价</a><a href="">国际租车</a></li>
                <li><a href="">旅游问答</a><a href="">旅游保险</a></li>
                <li><a href="">旅游指南</a><a href="">订火车票</a></li>
                <li><a href="">旅游资讯</a><a href="">APP下载</a></li>
                <li><a class="highlight" href="">旅行商城全球商家入驻</a></li>
            </ul>
            <ul class="ft-info-qrcode">
                <li>
                    <img src="../images/APP.png">
                    <p>马蜂窝良品<br>官方服务号</p>
                </li>
                <li>
                    <img src="../images/APP.png">
                    <p>马蜂窝旅游<br>订阅号</p>
                </li>
                <li class="">
                    <img src="../images/APP.png">
                    <p>马蜂窝APP<br>扫描立即下载</p>
                </li>
            </ul >
            <ul class="ft-info-social">
                <li><span>向崇尚自由的加勒比海盗致敬！</span></li>
                <a href=""><img src="../images/weibo.svg"></a>
                <a href=""><img src="../images/weibo.svg"></a>
                <a href=""><img src="../images/weibo.svg"></a>
            </ul>


        </div>
        <div class="footer-copyright">
            <a><img src="../images/weibo.svg"></a>
            <p>© 2019 Mafengwo.cn 京ICP备11015476号 京公网安备11010502013401号</p>
            <p>网络出版服务许可证：(总)网出证(京)字第161号</p>

        </div>
        <div class="footer-safety">

        </div>
    </div>
</div>







<script src="../js/index.js"></script>

<script src="../js/customer/logout.js"></script>
<script src="../js/note/upload.js"></script>

</body>
</html>
