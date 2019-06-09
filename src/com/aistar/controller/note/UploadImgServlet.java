package com.aistar.controller.note;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;

@WebServlet(name = "UploadImgServlet",urlPatterns = "/note/uploadImg")
public class UploadImgServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SmartUpload su = new SmartUpload();
        su.initialize(this.getServletConfig(), request, response);
        su.setMaxFileSize(100 * 1024 * 1024);
        su.setAllowedFilesList("jpg,jpeg,bmp,gif,tif,png");
        try {
            String path =this.getServletContext().getRealPath("/") +"upload";
            su.upload();
            su.save(path);

            Writer writer = response.getWriter();
            String relativePath ="upload/"+su.getFiles().getFile(0).getFileName();
            System.out.println("relativePath:"+relativePath);
            writer.write(relativePath);
            System.out.println("path:"+path);
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
