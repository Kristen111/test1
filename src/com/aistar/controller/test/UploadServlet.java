package com.aistar.controller.test;

import com.alibaba.fastjson.JSON;
import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UploadServlet",urlPatterns = "/upload")
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




        SmartUpload smartUpload = new SmartUpload();
        smartUpload.initialize(this.getServletConfig(),request,response);

        //限制文件的参数信息
//        smartUpload.setAllowedFilesList("png");

        String savePath =this.getServletContext().getRealPath("/") +"upload";
        System.out.println("savePath:"+savePath);
        if(! new java.io.File(savePath).exists()){
            new java.io.File(savePath).mkdir();
        }



        try {
            smartUpload.upload();
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }catch (SecurityException e){
            //The extension of the file is not allowed to be uploaded (1010).
            System.out.println( "异常处理："+e.getMessage());
            if(e.getMessage().contains("The extension of the file is not allowed to be uploaded")) {
                //返回json数据
                request.setAttribute("msg","文件格式不匹配");
                request.getRequestDispatcher("/test_upload.jsp").forward(request,response);
                return;
            }
        }


        try {
            smartUpload.save(savePath);
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }

        long size =  smartUpload.getFiles().getSize();
        System.out.println("size :"+size);

        if( smartUpload.getFiles().getSize()>0) {

            File file = smartUpload.getFiles().getFile(0);
            String filename = file.getFileName();
            int fileSize = file.getSize();
            String fileContentType = file.getContentType();
            String filePath = file.getFilePathName();
            String fileRealPath = "upload/" + filename;
            System.out.println("filename =" + filename);
            System.out.println("fileSize =" + fileSize);
            System.out.println("fileContentType =" + fileContentType);  //image/jpeg  , image/png
            System.out.println("filePath =" + filePath);

            request.setAttribute("fileRealPath",fileRealPath);
            request.getRequestDispatcher("/test_upload.jsp").forward(request,response);


        }else{
            request.setAttribute("msg","文件上传失败");
            request.getRequestDispatcher("/test_upload.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
