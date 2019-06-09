
$("#logout").click(function () {
    var xhr = new XMLHttpRequest();

    xhr.open("GET","/trip/cust/logout",true);

    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status ==200){
            var result = JSON.parse(xhr.responseText);
            if(result == "success"){
                window.location.href="/trip/index.jsp";

              //  console.log("ajax logout success");
/*
                $(".haslogin").remove();  // 移除元素
                var ele = "\n" +
                    "          <li class=\"unlogin\"><a href=\"customer/login.jsp\"  id=\"icon3\" title=\"登录用户\"></a></li>\n" +
                    "          <li class=\"unlogin\"><a href=\"customer/regist.jsp\" class=\"login-btn\" title=\"加入\"  >注册</a></li>\n" +
                    "       ";
                $(".login-out").append(ele); //在该元素后面添加  ， append是在该元素内部添加

                */
            }
        }
    };
    xhr.send();
});
