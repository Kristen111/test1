package com.aistar.controller.customer;

import com.aistar.entity.Customer;
import com.aistar.service.CustomerService;
import com.aistar.service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetServlet",urlPatterns = "/cust/get")
public class GetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String custIdStr = request.getParameter("id");
        int id = Integer.valueOf(custIdStr);
        CustomerService service =  new CustomerServiceImpl();
        Customer customer = service.getById(id);
        System.out.println("查询个人信息："+customer);
        if(customer!=null){
            request.setAttribute("customer",customer);
            request.getRequestDispatcher("/customer/info.jsp").forward(request,response);
        }else{
            //用户没找到
            System.out.println("用户没找到");
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
