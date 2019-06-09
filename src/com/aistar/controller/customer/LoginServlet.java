package com.aistar.controller.customer;

import com.aistar.entity.Customer;
import com.aistar.service.CustomerService;
import com.aistar.service.impl.CustomerServiceImpl;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet",urlPatterns = "/cust/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username  = request.getParameter("username");
        String password = request.getParameter("password");
        String auto = request.getParameter("auto");

        System.out.println("username =" + username);
        System.out.println("password =" + password);
        System.out.println("auto =" + auto);

        CustomerService service =  new CustomerServiceImpl();
        Customer customer = null;
        if(username.contains("@")){//邮箱+密码
            Customer emailLoginCust =   new Customer();
            emailLoginCust.setCustEmail(username);
            emailLoginCust.setCustPwd(password);
            customer =  service.getByEmailAndPwd(emailLoginCust);
        }else{//手机+密码
            Customer telnoLoginCust =   new Customer();
            long telno = Long.valueOf(username);
            telnoLoginCust.setCustTelno(telno);
            telnoLoginCust.setCustPwd(password);
            customer = service.getByTelnoAndPwd(telnoLoginCust);
        }



        System.out.println("customer :" + customer);

        PrintWriter out = response.getWriter();
        if(customer==null){//用户名或密码错误，保留在登陆页面

            out.print(JSON.toJSONString("用户名或密码错误"));

        }else{ // 跳转到首页面 index.jsp
            System.out.println("login successfully, go to index.jsp");


            //用户信息保存在一次会话中 HttpSession :
            HttpSession session = request.getSession();
            System.out.println("session id =" + session.getId());
            session.setAttribute("loginCustName",customer.getCustName());
            System.out.println("loginCustName=" + customer.getCustName());

            session.setAttribute("loginCustId",customer.getCustId());
            System.out.println("loginCustId=" + customer.getCustId());

            session.setAttribute("loginCustProfile",customer.getCustProfile());

            if(auto !=null && auto.equals("auto")) {

                Cookie cookieCustomer = null;
                // 服务器要创建cookie ,保存邮箱或手机与密码
                if(username.contains("@")){
                    cookieCustomer =  new Cookie("autoEmailLogin", customer.getCustEmail() + "&" + customer.getCustPwd());

                }else{
                    cookieCustomer = new Cookie("autoTelnoLogin", customer.getCustTelno() + "&" + customer.getCustPwd());
                    System.out.println("cookieCustomer=" + cookieCustomer);

                }
                System.out.println("cookieCustomer=" + cookieCustomer);




                //设置生命周期
                cookieCustomer.setMaxAge(365 * 24 * 60 * 60);//second
                //将cookie放在根目录下，项目中资源可以都获取得到
                cookieCustomer.setPath("/");

                //保存到客户端浏览器
                response.addCookie(cookieCustomer);

                System.out.println("servlet 选择记住我，保存用户信息到cookie");
            }


            out.print(JSON.toJSONString("success"));

        }

        out.flush();
        out.close();



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
