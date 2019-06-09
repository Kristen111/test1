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

@WebServlet(name = "RegistServlet",urlPatterns = "/cust/regist")
public class RegistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

       String custNameStr= request.getParameter("custame");
       String custPwdStr= request.getParameter("custpwd");
       String custTelnoStr= request.getParameter("telno");

        long custTelno=Long.valueOf(custTelnoStr);


        Customer customer = new Customer();
        customer.setCustName(custNameStr);
        customer.setCustPwd(custPwdStr);
        customer.setCustTelno(custTelno);



        CustomerService customerService= new CustomerServiceImpl();
        boolean flag =  customerService.save(customer);
        if(flag){
            //跳转到登录页面
            response.sendRedirect(request.getContextPath()+"/customer/login.jsp");
            System.out.println("跳转到登录页面");
        }else{
            // 保留在注册页面,注册失败
            String msg = "注册失败";
            request.setAttribute("regMsg",msg);
            request.getRequestDispatcher("/index.jsp").forward(request,response);

            System.out.println("保留在注册页面,注册失败");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
