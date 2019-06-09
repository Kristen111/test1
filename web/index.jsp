<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>旅游攻略，自由行，自助游攻略，旅游社交分享网站-马蜂窝</title>

  <link rel="stylesheet" href="dist/css/bootstrap.css">
  <link rel="stylesheet" href="dist/css/bootstrap-theme.css">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/second-bottom.css">
  <script src="dist/js/jquery-3.3.1.min.js"></script>
  <script src="dist/js/bootstrap.js"></script>
  <link rel="icon" href="images/M-icon.png">

</head>
<body>
<div class="header">
  <div class="header-logo">
    <a class="mfw-logo" href="index.jsp" alt="马蜂窝自由行" target="_blank"></a>
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

          <li class="unlogin"><a href="customer/login.jsp" class="login-btn">登录</a></li>

          <li class="unlogin"><a href="customer/login.jsp"  id="icon3" title="登录用户"></a></li>
          <li class="unlogin"><a href="customer/regist.jsp" class="login-btn" title="加入"  >注册</a></li>
        </c:when>
        <c:otherwise>
          <li class="haslogin"><a href="cust/get?id=${loginCustId}"  id="loginName"  >${loginCustName}</a></li>
          <li class="haslogin"><a href="javascript:;" class="login-btn" title="加入"  id="logout">退出</a></li>
        </c:otherwise>
      </c:choose>



    <%--class="login-btn"--%>
    <%--

        <a href=""><img src="../images/weibo-26.svg"></a>
        <a href=""><img src="../images/qq-26.svg"></a>
        <a href=""><img src="../images/wecha.svg"></a>

            <a href="login.jsp">登录</a>
            <span class="split">|</span>
            <a href="regist.jsp">注册</a>
    --%>

  </div>
</div>
<div class="top-container">
  <ul class="show-image">
    <img src="images/bg8.jpeg">
    <!-- <p>烦嚣之外，去杭州度个周末吧</p>
     <p>图片来源于<a>杭州</a>此目的地共收藏了<a>2332435</a>张<a>杭州</a>图片。本片由<a>快乐的冻秋梨荣誉出品</a></p>-->
  </ul>
  <ul class="show-nav">
    <li>
      <a onclick="fun(this)"><img src="images/bg8.jpeg"></a>
    </li>
    <li>
      <a onclick="fun(this)"><img src="images/bg7.jpeg"></a>
    </li>
    <li>
      <a onclick="fun(this)"><img src="images/bg3.jpeg"></a>
    </li>
    <li>
      <a onclick="fun(this)"><img src="images/bg4.jpeg"></a>
    </li>
    <li>
      <a onclick="fun(this)"><img src="images/bg5.jpeg"></a>
    </li>
  </ul>
</div>
<div class="search-container">
  <form>
    <input type="radio" value="" name="search" checked>全部
    <input type="radio" value="" name="search">酒店
    <input type="radio" value="" name="search">目的地
    <input type="radio" value="" name="search">旅行商城
    <p><input type="text" placeholder="搜目的地/攻略/酒店/旅行特价" value="">
      <a href=""><img src="images/search-40.svg"></a>
    </p>
  </form>

</div>
<div  class="mfw-container">
  <div class="mfw-wrapper">
    <div class="nav-bar">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#d1" data-toggle="tab">热门游记</a></li>
        <li><a href="#d2"  data-toggle="tab">最新发表</a></li>
      </ul>
      <div class="tn-write">
        <a href="note/add.jsp" target="_blank">写游记</a>
      </div>
      <div class="tab-content">
        <div id="d1" class="tab-pane active">
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="select-youji.html">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="select-youji.html">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
        </div>
        <div id="d2" class="tab-pane">
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
          <div class="tn-item">
            <img src="images/item1.jpeg">
            <div class="tn-wrapper">
              <a href="">逛吃逛吃广州行~</a>
              <p>鉴于过年放假时间得宜，南京下雪太冷，几个同事商量着南下避寒，于是一拍即合促成了这次为期四天半的 广州 之旅。机票：2.10 南京 —— 广州 10：25-12：45 2.14 广州...........</p>
              <div class="extra">
                <span class="ding"><a><span>21</span><img src="images/ding.svg"></a></span>
                <span class="place"><img src="images/position-16.svg"><a href="">广州</a>，by</span>
                <span class="user"><a href=""><img src="images/user1.jpeg">杨呆</a></span>
                <span class="nums"><a href=""><img src="images/view-16.svg">93/1</a></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="mfw-asider">
    <div class="box-gonglve">
      <div class="aside-hd">
        <h2>旅游攻略推荐</h2>
        <a href="">更多</a>
      </div>
      <div class="aside-bd">
        <a href=""><img src="images/side1.jpeg"></a>
        <h3><a href="">2019火人节抢票指南（更新版）</a></h3>
        <ul>
          <li>
            <a href="">喵星人在</a>点评了 大津市的<a href="">大津琵琶湖王</a>
          </li>
          <li>
            <a href="">娜塔丽雅</a>点评了 市北区的<a href="">海草屋·海鲜</a>
          </li>
          <li>
            <a href="">秋海棠</a>点评了 市北区的<a href="">海草屋·海鲜</a>
          </li>
          <li>
            <a href="">刺客心跳</a>点评了 市北区的<a href="">海草屋·海鲜</a>
          </li>
          <li>
            <a href="">oasis</a>点评了 胡志明市的<a href="">放心盒子酒店</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="second-bottom">
  <a href="" class="return-top"><img src="images/return-50.svg"></a>
</div>

<script src="js/index.js"></script>
<script src="js/return_top.js"></script>
<script src="js/customer/logout.js"></script>
</body>
</html>