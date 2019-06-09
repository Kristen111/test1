package com.aistar.controller.customer;

import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LogoutServlet",urlPatterns = "/cust/logout")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("999");
        //退出 将用户信息从session和cookie中移除
        //退出，将用户信息从session,cookie中移除
        HttpSession session =  request.getSession();
        session.removeAttribute("loginCustName");
        session.removeAttribute("loginCustId");
        session.removeAttribute("loginCustProfile");

        Cookie[] cookies = request.getCookies();
        if(cookies!= null && cookies.length>0) {
            for (Cookie cookie : cookies) {
                System.out.println("cookie name:" + cookie.getName()+ "value:"+cookie.getValue());
                if (cookie.getName().equals("autoEmailLogin") ||cookie.getName().equals("autoTelnoLogin") ) {
                    cookie.setMaxAge(0);
                    cookie.setValue("");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    System.out.println(cookie.getMaxAge());
                }

            }
        }
        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString("success"));
        System.out.println("用户退出servlet");
        out.flush();
        out.close();


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
