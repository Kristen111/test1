/**
 * Created by MiltBluequer on 2019/3/8.
 */



$(".gonglve-nav").mouseover(function(event){
    var ele = event.target;
    if(ele.className == "haiwai"){
        $("#haiwai-dest").css("display","block");
    } else if(ele.className == "guonei"){
        $("#guonei-dest").css("display","block");
    }else if(ele.className == "haidao"){
        $("#haidao-dest").css("display","block");
    }else if(ele.className == "zhuti"){
        $("#zhuti-dest").css("display","block");
    }
});
$(".gonglve-nav").mouseout(function(event) {
    var ele = event.target;
    if (ele.className == "haiwai") {
        $("#haiwai-dest").css("display", "none");
    } else if (ele.className == "guonei") {
        $("#guonei-dest").css("display", "none");
    } else if (ele.className == "haidao") {
        $("#haidao-dest").css("display", "none");
    } else if (ele.className == "zhuti") {
        $("#zhuti-dest").css("display", "none");
    }
});
