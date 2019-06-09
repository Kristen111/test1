package com.aistar.controller.customer;

import com.aistar.entity.Customer;
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

@WebServlet(name = "Get4ModifyServlet",urlPatterns = "/cust/getForModify")
public class Get4ModifyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = (int)request.getSession().getAttribute("loginCustId");

        CustomerService service =  new CustomerServiceImpl();
        Customer customer = service.getById(id);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString(customer));
        System.out.println("json:"+JSON.toJSONString(customer));
        out.flush();
        out.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
