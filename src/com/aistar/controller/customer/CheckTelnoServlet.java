package com.aistar.controller.customer;

import com.aistar.service.CustomerService;
import com.aistar.service.impl.CustomerServiceImpl;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
//cust/checkTelno
//cust/regist

//note//add
@WebServlet(name = "CheckTelnoServlet",urlPatterns = "/cust/checkTelno")
public class CheckTelnoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        System.out.println("进入post方法");
        String custTelnoStr = request.getParameter("telno");
        System.out.println(custTelnoStr);
        long custTelno = Long.valueOf(custTelnoStr);
        System.out.println(custTelno);
        CustomerService customerService = new CustomerServiceImpl();
        System.out.println("------------------------");
        boolean flag=customerService.isExistTelno(custTelno);
        System.out.println(flag);
        PrintWriter out = response.getWriter();
        if (customerService.isExistTelno(custTelno)) {//该手机号已经注册过了
            out.print(JSON.toJSONString("手机号已经注册过"));
        } else {
            out.print(JSON.toJSONString("success"));
        }
        out.flush();
        out.close();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
