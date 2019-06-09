/**
 * Created by MiltBluequer on 2019/3/10.
 */


/*
 * 左导航*/
/* $(".setting-aside a").click(function(){
 $(".setting-aside a").css("background-color","#ffa800");
 $(".setting-aside a").css("color","#ffffff");
 });*/
document.querySelector(".setting-aside").onclick= function(event){
    var ele = event.target;
    var all = document.querySelectorAll(".setting-aside a");
    for(var i = 0;i<all.length;i++){
        all[i].style.backgroundColor="#fff";
        all[i].style.color="#000000";
    }
    ele.style.backgroundColor="#ffa800";
    ele.style.color="#fff";
}



/**
 * 下拉列表联动
 * */
window.onload=function(){
    initProvince();
}

var provinceSelect = document.querySelector("select.province");
function initProvince(){
    var provinces = ["安徽省","澳门特别行政区","北京市","重庆市","福建省","甘肃省"];
    fillSelect(provinces,provinceSelect);
}

provinceSelect.onchange=function(){
    //1. 获得第一个下拉列表中选中的值

    var citySelect = document.querySelector("select.city");


    var  anhuiArr= ["安庆市","蚌阜市","毫州市","池州市"];
    var aomenArr= ["澳门半岛","氹仔岛","路氹城","路环岛"];
    var beijingArr= ["昌平区","大兴区","东城区","房山区","丰台区","海淀区"];
    var chongqingArr= ["巴南区","璧山区"];
    var fujianArr= ["福州市","龙岩市","南平市","宁德市","莆田市","泉州市"];
    var gansuArr= ["白银市","定西市","甘南藏族自治州","嘉峪关市","金昌市","酒泉市"];

    switch( provinceSelect.selectedIndex ){
        case 0: fillSelect( null,citySelect);break;
        case 1: fillSelect(anhuiArr,citySelect);break;
        case 2: fillSelect(aomenArr,citySelect);break;
        case 3: fillSelect(beijingArr,citySelect);break;
        case 4: fillSelect(chongqingArr,citySelect);break;
        case 5: fillSelect(fujianArr,citySelect);break;
        case 6: fillSelect(gansuArr,citySelect);break;

    }


}

//将数组中的数据 填充到 下拉列表中
function fillSelect(arr,selectEle) {
    if(arr==null || arr.length==0){
        selectEle.options.length = 1;
    }else{
        //1. select下有几个option
        selectEle.options.length = arr.length+1;

        //2. 将数组中的每个值 依次赋值到每个option中
        for(var i =1;i<selectEle.options.length;i++){
            selectEle.options[i].text = arr[i-1];
        }
    }


}