package com.delay.newspush.interceptor;

import com.delay.newspush.entity.Admin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class AdminInterceptor implements HandlerInterceptor {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        HttpSession session = request.getSession();

        Admin user = (Admin) session.getAttribute("admin");
        if(user == null){
//            user = new User();
//            user = userService.findById(1).orElse(null);
//            session.setAttribute("user",user);
        }
        if(user!=null){

            return true;
        }
        response.sendRedirect("/page/managerLogin");
        return false;
    }
}
