package com.aistar.filter;

import com.aistar.entity.Customer;
import com.aistar.service.CustomerService;
import com.aistar.service.impl.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 自动登录过滤器
 *  登录 customer/login.jsp
 *      cust/login
 */
@WebFilter(filterName = "AutoLoginFilter",
            urlPatterns = {"/customer/login.jsp",},
            servletNames = {"LoginServlet"}
)
public class AutoLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;

        System.out.println("filter 当前请求服务器的uri:" + request.getRequestURI());


        HttpSession session = request.getSession();
        String loginCustName =(String) session.getAttribute("loginCustName");
        System.out.println("filter loginCustName:" + loginCustName);

        if(loginCustName == null){//用户尚未登录,查找cookie
            Cookie[] cookies = request.getCookies();
            String autoLoginNameAndPwd = null;
            if(cookies == null || cookies.length==0){
                System.out.println("说明是第一次登录，cookie中没有登录信息，显示登录页面");
                chain.doFilter(request,response);

            }else{
                for(Cookie cookie:cookies){
                    if(cookie.getName().startsWith("auto")){
                        autoLoginNameAndPwd = cookie.getValue();
                        System.out.println("cookie :" + cookie.getValue() );
                    }
                }

                if(autoLoginNameAndPwd == null) { //cookie中没有保存用户登录信息，
                    System.out.println("cookie中没有保存用户登录信息");
                    chain.doFilter(request, response);
                }else{ //cookie中获得到用户登录信息，解析登录信息
                    System.out.println("cookie中获得到用户登录信息，解析登录信息");
                   String[] nameAndPwd =  autoLoginNameAndPwd.split("&");
                   String username = nameAndPwd[0];  // 邮箱还是手机
                   String password = nameAndPwd[1];
                    Customer c = new Customer();
                    CustomerService service =   new CustomerServiceImpl();
                    Customer result = null;
                    if(username.contains("@")){ //邮箱登录
                        c.setCustEmail(username);
                        c.setCustPwd(password);
                        result =    service.getByEmailAndPwd(c);

                    }else{
                        c.setCustTelno(Long.valueOf(username));
                        c.setCustPwd(password);
                        result =    service.getByTelnoAndPwd(c);
                    }


                    if(result ==null){ //表示用户名或密码是错误的，需要重新输入登录信息
                        System.out.println("表示用户名或密码是错误的，需要重新输入登录信息");
                        chain.doFilter(request,response);

                    }else{//表示Cookie中的用户与密码是正确的，直接保存登录信息到session中，并跳转首页面
                        System.out.println("表示Cookie中的用户与密码是正确的，直接保存登录信息到session中，并跳转首页面");
                        session.setAttribute("loginCustName",c.getCustName());
                        session.setAttribute("loginCustId",c.getCustId());
                        session.setAttribute("loginCustProfile",c.getCustProfile());
                        response.sendRedirect(request.getContextPath() + "/index.jsp");

                    }
                }

            }


        }else{//用户已登陆，不用再进行登录请求与操作，直接返回首页面
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }



    }

    public void init(FilterConfig config) throws ServletException {

    }

}
