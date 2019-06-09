package com.aistar.controller.customer;

import com.aistar.entity.Customer;
import com.aistar.service.CustomerService;
import com.aistar.service.impl.CustomerServiceImpl;
import com.aistar.util.DateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "ModifyServlet",urlPatterns = "/cust/modify")
public class ModifyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收请求参数
        String username =  request.getParameter("username");
        String gender =  request.getParameter("gender");
        String city =  request.getParameter("city");
        String desc =  request.getParameter("desc");
        String birth =  request.getParameter("birth");
        //数据类型转换
        Date custBirth = DateUtil.stringToDate(birth,DateUtil.DATE_PATTERN);
        //customer
        Customer customer=  new Customer();
        int id = (int)request.getSession().getAttribute("loginCustId");
        customer.setCustId(id);
        customer.setCustName(username);
        customer.setCustGender(gender);
        customer.setCustCity(city);
        customer.setCustBirth(custBirth);
        customer.setCustSdasd(desc);


        // service更新
        CustomerService service = new CustomerServiceImpl();
        boolean result = service.update(customer);
        if(result){
            System.out.println("修改成功");
        }else{
            System.out.println("修改失败");
        }

        //根据id查询

        request.getRequestDispatcher("/cust/getForModify").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
