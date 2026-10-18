package com.shareeat.social.config;

import com.shareeat.social.utils.LoginInterceptor;
import com.shareeat.social.utils.RefreshTokenIntercepter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Autowired
    private LoginInterceptor loginInterceptor;
    @Autowired
    private RefreshTokenIntercepter refreshTokenIntercepter;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //登录拦截器
        registry.addInterceptor(loginInterceptor)
                .excludePathPatterns(
                        "/shop/**",
                        "/voucher/**",
                        "/shop-type/**",
                        "/upload/**",
                        "/blog/hot",
                        "/user/code",
                        "/voucher/seckill",
                        "/user/login"
                ).order(1);
        //刷新token拦截器
        registry.addInterceptor(refreshTokenIntercepter)
                .addPathPatterns("/**").order(0);
    }
}
