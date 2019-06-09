$(".myfile").change(function () {

    var exname = $(".myfile").val().split("\\")[2];
    console.log("exname:"+exname);

    if (exname.indexOf("png") != -1 || exname.indexOf("jpg") != -1 || exname.indexOf("gif") != -1 || exname.indexOf("bmp") != -1 || exname.indexOf("jpeg") != -1) {
        $.ajaxFileUpload(
            {
                url: '/trip/note/uploadImg',
                method:'post',
                secureuri: true,
                fileElementId: 'myfile',
                processData:false,
                contentType:false,
                success: function (data) {  // xhr.readyState ==4 && xhr.status ==200
                    var url = "url(upload/"+exname+")";
                    console.log("url:"+url);
                    $(".set-note-bg").css("backgroundImage",url);

                    $(".setNoteHeaderImgForm").hide();
                    $(".setNoteHeaderImgTip").hide();


                    $("#headImgPath").val("upload/"+exname);

                    /*  var ele = " <img src=\"\" id='pic' />";
                      $("#pre_img").append(ele);
                      $("#pic").attr("src", "upload/"+exname);*/
                },
                error: function (data) {
                    alert("error");
                }
            }
        )
    } else {
        alert("必须是图片！");
    }



});