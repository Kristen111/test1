//异步更新请求
$(".updateBtn").click(function () {
    var username = $("input[name=username]").val(); //手机号码或者邮箱
    var gender = $("input[name=gender]").val();


    var city = $("input[name=city]").val();
    var birth = $("input[name=birth]").val();
    var desc = $("input[name=desc]").val();
    console.log("username:" + username );
    console.log("gender:" + gender );
    console.log("city:" + city );
    console.log("birth:" + birth );
    console.log("desc:" + desc );


    var data = $("form").serialize();

    // 将表单内容序列化成一个字符串。
// 　　这样在ajax提交表单数据时，就不用一一列举出每一个参数。只需将data参数设置为 $("form").serialize() 即可。


    //表单序列化

    var xhr = new XMLHttpRequest();
    xhr.open("POST","../cust/modify",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status ==200){
            var customer = JSON.parse(xhr.responseText);  // 更新 dao update() --int --service --boolean (更新是否成功)
            $("input[name=username]").text(customer.custName);
            $("input[name=city]").text(customer.custCity);     // 根据id 再查询用户对象 customer ---JSON
            $("input[name=username]").text(customer.custName);
            $("input[name=birth]").text(customer.custBirth);
            $("input[name=desc]").text(customer.others1);
            var gender = customer.custGender;
            console.log("gender:"+gender);
            var ele ;
            if(gender =="M"){
               ele = "<input  type=\"radio\" name=\"gender\" value=\"M\"  checked=\"true\"> 男\n" +
                    "                        <input  type=\"radio\" name=\"gender\" value=\"F\" >  女";

            }else{
                ele = "<input  type=\"radio\" name=\"gender\" value=\"M\"  > 男\n" +
                    "                            <input  type=\"radio\" name=\"gender\" value=\"F\" checked=\"true\">  女";
            }

            $(".sexcheck dd").after(ele);


        }
    };
    // xhr.send("username="+username+"&gender="+gender+"&city="+city+"&birth="+birth+"&desc="+desc);
       xhr.send(data);

});