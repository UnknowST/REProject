package com.Interceptor;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("LoginInterceptor")
/*登录拦截器*/
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        boolean flag=false;
        //获取资源的请求路径
        String url=request.getRequestURI();
        String projectname=request.getServletContext().getContextPath();
        if(url.contains("/login.html")||url.contains("/login")||url.contains("/Js/")||url.contains("/css/")||url.contains("/img/")
                ||url.contains("/checkCode")||url.contains("/register.html")||url.contains("/manage.html")||url.contains("/Admin.html")
                ||url.contains("/admin/nownotice")
        ){
            flag=true;
            System.out.println(url+"#####"+flag);
        }else{
            //不包含，需要验证用户是否登陆
            Object user=request.getSession().getAttribute("user");
            if(user!=null){
                //登陆了
                flag=true;
            }else{
                System.out.println("url---"+url+"被拦截了");
                flag=false;
                response.sendRedirect("manage.html?num=1");   //跳转 地址栏改变
            }
        }

        return flag;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
