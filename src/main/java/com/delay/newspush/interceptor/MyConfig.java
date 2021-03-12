package com.delay.newspush.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyConfig implements WebMvcConfigurer {

    @Autowired
    LoginInterceptor loginInterceptor;
    @Autowired
    AdminInterceptor adminInterceptor;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {



//        //排除静态资源
//        registry.addInterceptor(loginInterceptor).excludePathPatterns("/css/**")
//                .excludePathPatterns("/js/**")
//                .excludePathPatterns("/font/**")
//                .excludePathPatterns("/img/**")
//                .excludePathPatterns("/res/**")
//                .excludePathPatterns("/images/**")
//                .excludePathPatterns("/lib/**")
//                .excludePathPatterns("/scss/**");

//管理后台登陆
        registry.addInterceptor(adminInterceptor).addPathPatterns(
                "/page/managerIndex"
        ).excludePathPatterns(
                "/css/**",
                "/js/**",
                "/font/**",
                "/img/**",
                "/res/**",
                "/images/**",
                "/lib/**",
                "/scss/**"
        );

        registry.addInterceptor(loginInterceptor).addPathPatterns(
                "/**"
        ).excludePathPatterns(
                "/page/managerLogin",
                "/page/login",
                "/page/register",
                "/user/register",
                "/user/login",
                "/css/**",
                "/js/**",
                "/font/**",
                "/img/**",
                "/res/**",
                "/images/**",
                "/lib/**",
                "/scss/**",
                "/page/managerIndex",
                "/login/doLogin",
                "/page/welcome",
                "/user/delete",
                "/user/findAll",
                "/user/setState",
                "/user/findAllByStatus",
                "/user/add",
                "/user/deleteAdmin",
                "/page/memberList",
                "/page/verifyList",
                "/page/reportList",
                "/page/add",
                "/warn/findAll",
                "/warn/refuse",
                "/warn/pass",
                "/page/adminList",
                "/user/findAllAdmin"


        );



        // 拦截配置
//        registry.addInterceptor(loginInterceptor).addPathPatterns("/**")
//                .excludePathPatterns("/page/login")
//                .excludePathPatterns("/page/register")
//                .excludePathPatterns("/user/register")
//                .excludePathPatterns("/user/login");

//        registry.addInterceptor(adminInterceptor).excludePathPatterns("/css/**")
//                .excludePathPatterns("/js/**")
//                .excludePathPatterns("/font/**")
//                .excludePathPatterns("/img/**")
//                .excludePathPatterns("/res/**")
//                .excludePathPatterns("/images/**")
//                .excludePathPatterns("/lib/**")
//                .excludePathPatterns("/scss/**");

//        registry.addInterceptor(adminInterceptor).addPathPatterns("/page/managerIndex");
    }
}
