package com.delay.newspush.interceptor;

import com.delay.newspush.entity.User;
import com.delay.newspush.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class Login2Interceptor implements HandlerInterceptor {

    @Autowired
    UserService userService;
    Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user2");
//        if(user==null){
//            user = userService.findById(1);
//            session.setAttribute("user",user);
//        }
        if (user != null) {

            return true;
        }
        response.sendRedirect("/page/clientLogin");
        return false;
    }
}
