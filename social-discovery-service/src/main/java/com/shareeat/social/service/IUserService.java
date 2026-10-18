package com.shareeat.social.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shareeat.social.dto.LoginFormDTO;
import com.shareeat.social.dto.Result;
import com.shareeat.social.entity.User;

import javax.servlet.http.HttpSession;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @since 2021-12-22
 */
public interface IUserService extends IService<User> {

    /**
     * 发送验证码
     * @param phone
     * @param session
     * @return
     */
    Result sendCode(String phone, HttpSession session);

    /**
     * 用户登录
     * @param loginForm
     * @param session
     * @return
     */
    Result login(LoginFormDTO loginForm, HttpSession session);
}
