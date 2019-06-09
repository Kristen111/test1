
$("#loginBtn").click(function () {
    var username = $("input[name=username]").val(); //手机号码或者邮箱
    var password = $("input[name=password]").val();
    var auto = $("input[name=auto]").val();
console.log(username);
    var xhr = new XMLHttpRequest();
    xhr.open("POST","../cust/login",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status ==200){
            var result = JSON.parse(xhr.responseText);
            if(result == "success"){
                $(".tip").text("");
                window.location.href="../index.jsp";
            }else{
                $(".tip").text(result);
            }
        }
    };
    xhr.send("username="+username+"&password="+password+"&auto="+auto);
});
