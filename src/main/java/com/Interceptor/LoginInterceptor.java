package com.Interceptor;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@RequestMapping("LoginInterceptor")
/*登录拦截器*/
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      /*  System.out.println("进行拦截");
        //获取请求的RUi:去除http:localhost:8080这部分剩下的
        String uri = request.getRequestURI();
        System.out.println(uri);
        //设置拦截状态
        boolean flag=false;
            //UTL:除了login.jsp是可以公开访问的，其他的URL都进行拦截控制
        if (uri.indexOf("/login.html") >= 0||uri.indexOf("/Admin.html") >= 0||uri.indexOf("/manage.html") >= 0||uri.indexOf("/register.html") >= 0
        ||uri.indexOf("/login") >= 0
        ) {
            flag=true;
        }
        if (flag==false){
            //获取session
            HttpSession session = request.getSession();
            //判断session中是否有用户数据，如果有，则返回true，继续向下执行
            if ( session.getAttribute("user") != null) {
                flag=true;

            }else {
                System.out.println("非法");
                flag=false;}
        }

        //不符合条件的给出提示信息，并转发到登录页面
        response.sendRedirect("manage.html?num=1");
        //request.getRequestDispatcher("manage.html?num=1").forward(request, response);*/
        boolean flag=false;
        //获取资源的请求路径
        String url=request.getRequestURI();

        if(url.contains("/login.html")||url.contains("/login")||url.contains("/Js/")||url.contains("/css/")||url.contains("/img/")
                ||url.contains("/checkCode")||url.contains("/register.html")||url.contains("/manage.html")
        ){
            flag=true;
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
