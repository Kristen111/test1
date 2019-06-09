/**

 ajax :  光标移开手机号码输入框，检查该手机号码是否已经注册过
 若注册过，ajax 返回json "该手机号已经注册过"
 若没有注册过，接收注册信息，添加记录到数据库中，跳转到登录页面
 */




//验证手机号
$("input[name=telno]").blur(function () {
    var telno = $("input[name=telno]").val();
    console.log("telno="+telno);
    var xhr = new XMLHttpRequest();
    xhr.open("POST","/trip/cust/checkTelno",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status ==200){
            var result = JSON.parse(xhr.responseText);
            if(result != "success"){/*已注册过,信息提示*/
                console.log("手机号不可以使用");
                $(".tip").text(result);

            }else{
                console.log("手机号可以使用");
                $(".tip").text("");
            }

        }
    }
    xhr.send("telno="+telno);
})

//点击注册按钮
$("#regButton").click(function () {
    var telno = $("input[name=telno]").val();
    console.log("telno="+telno);
    var xhr = new XMLHttpRequest();
    xhr.open("POST","/trip/cust/checkTelno",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status ==200){
            var result = JSON.parse(xhr.responseText);
            if(result != "success"){/*已注册过,信息提示*/
                console.log("手机号不可以使用");
                $(".tip").text(result);

            }else{
                console.log("手机号可以使用");
                $(".tip").text("");
                regist();
            }

        }
    }
    xhr.send("telno="+telno);
})




//注册功能实现
function  regist() {
    var username = $("input[name=username]").val();
    var password = $("input[name=password]").val();
    var telno = $("input[name=telno]").val();

    var xhr = new XMLHttpRequest();
    xhr.open("POST","/trip/cust/regist",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status ==200){
            var result =  JSON.parse(xhr.responseText);
            if(result == "success"){
                //跳转到登陆页面
                window.location.href="../customer/login.jsp";
                $(".tip").text("");
            }else{//注册失败，提示失败的原因
                $(".tip").text(result);
            }
        }
    };
    xhr.send("username="+username+"&password="+password+"&telno="+telno);

}

