/**
 * Created by MiltBluequer on 2019/3/9.
 */
/*
$(window).scroll(function () {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
        alert('bottom!!');
    }
});*/

$(document).ready(function () {
    $(window).scroll(function () {

    if ($(window).scrollTop() >1200) {
        /*alert('bottom!!');*/
        $(".pagelet-block").css("display","block");
        $(".view-right").css("position","fixed");
        $(".view-right").css("bottom","170px");
        $(".view-right").css("right","280px");
    }else if($(window).scrollTop()<1200 && $(window).scrollTop()>900){
        $(".view-right").css("position","static");
        $(".view-right").css("bottom","0");
        $(".view-right").css("right","0");
        $(".hide-header").css("display","block");
    }else if($(window).scrollTop()<900){
        $(".hide-header").css("display","none");
    }

      });
    });

