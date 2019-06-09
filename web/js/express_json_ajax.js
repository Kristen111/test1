/**
 * Created by qianghj on 2019/3/27.
 */


/**
 * JS ----> JSON : 序列化  stringify()
 * JSON ----> JS  ： 解析  parse()
 */

/******************JS 转换成 JSON 格式: stringify() *********************/
console.log("JS 转换成 JSON 格式: stringify()");
//1. 将js字符串转换成json格式
var  name= "Smith";
var age = 20;
var value0 = JSON.stringify(name);
var value1 = JSON.stringify(age);
console.log(value0);
console.log(value1);

//2. 将js对象转换成json格式对象
var express ={
    company: "EMS",
    com: "ems",
    no: "1186465887499",
    status: "1"
}

var value2 = JSON.stringify(express);
console.log(value2);

//3. 将js数组转换成json格式数组
var names =['tom','smith','allen'];
var value3 = JSON.stringify(names);
console.log(value3);

//4. js复杂的对象 转换成json格式
var book = {
    bookName : "JSON学习",
    bookPrice:100,
    bookAuthors:['Tom','Smith','Allen']
};
var value4 = JSON.stringify(book);
console.log(value4);



/******************JSON 转换成 格式 JS:parse() *********************/

console.log("JSON 转换成 格式 JS:parse()");
var v2 = JSON.parse(value2);
console.log(v2);

var v4 = JSON.parse(value4);
console.log(v4);


/******************JS 转换成 JSON 格式: stringify(对象/数组, 要解析的内容) *********************/
//js 对象
var book1 = {
    bookName : "JSON学习",
    bookPrice:100,
    bookAuthors:['Tom','Smith','Allen'],
    bookStatus:4
};

//转换成json对象
var v5 = JSON.stringify(book1,['bookName','bookAuthors']);
console.log(v5);


/******************JS 转换成 JSON 格式，对结果进行处理 *********************/
var v6 = JSON.stringify(book1,function(key,value){
    switch (key) {
        case "bookName": return 'Java学习';
        case "bookPrice": return value;
        default  : return  value ;
    }
});
console.log(v6);
console.log(book1.bookName);

/******************JS 转换成 JSON 格式，对结果进行处理 ,缩进或空格*********************/
var v7 = JSON.stringify(book1,null,10);  // json结果缩进10个空格
console.log(v7);

var v8 = JSON.stringify(book1,null,'__');// json结果缩进2个下划线
console.log(v7);



//示例： 将JSON 解析为 JS
var json_value =JSON.stringify(
    {
        "resultcode": "200", /* 老版状态码，新用户请忽略此字段 */
        "reason": "查询物流信息成功",
        "result": {
            "company": "EMS", /* 快递公司名字 */
            "com": "ems",
            "no": "1186465887499", /* 快递单号 */
            "status": "1", /* 1表示此快递单的物流信息不会发生变化，此时您可缓存下来；0表示有变化的可能性 */
            "list": [
                {
                    "datetime": "2016-06-15 21:44:04",  /* 物流事件发生的时间 */
                    "remark": "离开郴州市 发往长沙市【郴州市】", /* 物流事件的描述 */
                    "zone": "" /* 快件当时所在区域，由于快递公司升级，现大多数快递不提供此信息 */
                },
                {
                    "datetime": "2016-06-15 21:46:45",
                    "remark": "郴州市邮政速递物流公司国际快件监管中心已收件（揽投员姓名：侯云,联系电话:）【郴州市】",
                    "zone": ""
                },
                {
                    "datetime": "2016-06-16 12:04:00",
                    "remark": "离开长沙市 发往贵阳市（经转）【长沙市】",
                    "zone": ""
                },
                {
                    "datetime": "2016-06-17 07:53:00",
                    "remark": "到达贵阳市处理中心（经转）【贵阳市】",
                    "zone": ""
                },
                {
                    "datetime": "2016-06-18 07:40:00",
                    "remark": "离开贵阳市 发往毕节地区（经转）【贵阳市】",
                    "zone": ""
                },
                {
                    "datetime": "2016-06-18 09:59:00",
                    "remark": "离开贵阳市 发往下一城市（经转）【贵阳市】",
                    "zone": ""
                },
                {
                    "datetime": "2016-06-18 12:01:00",
                    "remark": "到达  纳雍县 处理中心【毕节地区】",
                    "zone": ""
                },
                {
                    "datetime": "2016-06-18 17:34:00",
                    "remark": "离开纳雍县 发往纳雍县阳长邮政支局【毕节地区】",
                    "zone": ""
                },
                {
                    "datetime": "2016-06-20 17:55:00",
                    "remark": "投递并签收，签收人：单位收发章 *【毕节地区】",
                    "zone": ""
                }
            ]
        },
        "error_code": 0 /* 错误码，0表示查询正常，其他表示查询不到物流信息或发生了其他错误 */
    }
);

var js_value = JSON.parse(json_value);

console.log(js_value);

//(1)显示物流状态码
document.querySelector(".code").innerText = js_value.resultcode;
document.querySelector(".reason").innerText = js_value.reason;
document.querySelector(".company").innerText = js_value.result.company;
document.querySelector(".shortname").innerText = js_value.result.com;
document.querySelector(".no").innerText = js_value.result.no;
 var stationArr =   js_value.result.list;
console.log("以下显示具体物流站点的信息-------------");
 for(var i =0;i<stationArr.length;i++){
     var datetime = stationArr[i].datetime;
     var remark = stationArr[i].remark;
     var zone = stationArr[i].zone;
    var text = "时间 :" + datetime + ", 描述:"+remark+", 地点:" + zone;

     // 创建li元素
     var ele = document.createElement("li");
     ele.innerText = text;

     document.querySelector(".station").appendChild(ele);

 }

