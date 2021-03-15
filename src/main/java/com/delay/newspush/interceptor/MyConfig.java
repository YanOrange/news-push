package com.delay.newspush.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.servlet.config.annotation.*;

@SpringBootConfiguration
public class MyConfig implements WebMvcConfigurer {

    @Autowired
    LoginInterceptor loginInterceptor;
    @Autowired
    Login2Interceptor login2Interceptor;

    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        configurer.setUseSuffixPatternMatch(false);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        InterceptorRegistration addInterceptor = registry.addInterceptor(loginInterceptor);
        InterceptorRegistration addInterceptor2 = registry.addInterceptor(login2Interceptor);

        // 排除配置
//        addInterceptor.excludePathPatterns("/page/**");

        //排除静态资源
        addInterceptor.excludePathPatterns("/css/**")
                .excludePathPatterns("/js/**")
                .excludePathPatterns("/fonts/**")
                .excludePathPatterns("/images/**")
                .excludePathPatterns("/scss/**")
                .excludePathPatterns("/uploadImg/**")
                .excludePathPatterns("/lib/**");

        addInterceptor2.excludePathPatterns("/css/**")
                .excludePathPatterns("/js/**")
                .excludePathPatterns("/fonts/**")
                .excludePathPatterns("/images/**")
                .excludePathPatterns("/scss/**")
                .excludePathPatterns("/uploadImg/**")
                .excludePathPatterns("/lib/**");

        // 拦截配置
        addInterceptor.addPathPatterns("/page/index")
                .excludePathPatterns("/login/**")
                .excludePathPatterns("/page/login")
                .excludePathPatterns("/page/add")
                .excludePathPatterns("/user/add")
                .excludePathPatterns("/type/**")
                .excludePathPatterns("/essay/**")
                .excludePathPatterns("/page/home")
                .excludePathPatterns("/page/clientPerson")
                .excludePathPatterns("/page/clientLogin")
                .excludePathPatterns("/page/myFav");

        addInterceptor2.addPathPatterns(
                "/page/home",
                "/page/findById",
                "/page/clientPerson",
                "/page/myFav"
        ).excludePathPatterns(
                "/login/**",
                "/page/login",
                "/page/add",
                "/user/add",
                "/type/**",
                "/essay/**",
                "/page/clientLogin"
        );

    }
}
