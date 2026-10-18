package com.shareeat.merchant.controller.user;

import com.shareeat.merchant.constant.JwtClaimsConstant;
import com.shareeat.merchant.dto.UserLoginDTO;
import com.shareeat.merchant.entity.User;
import com.shareeat.merchant.properties.JwtProperties;
import com.shareeat.merchant.result.Result;
import com.shareeat.merchant.service.UserService;
import com.shareeat.merchant.utils.JwtUtil;
import com.shareeat.merchant.vo.UserLoginVO;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@Slf4j
@RequestMapping("/user/user")
@Api(tags = "C端用户接口")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private JwtProperties jwtProperties;

    @PostMapping("/login")
    public Result<UserLoginVO> login(@RequestBody UserLoginDTO userLoginDTO){
        log.info("微信用户验证码：{}",userLoginDTO.getCode());
        //微信登录
        User user = userService.wxlogin(userLoginDTO);
        //jwt
        Map<String, Object> claims = new HashMap<>();
        claims.put(JwtClaimsConstant.USER_ID,user.getId());
        String token = JwtUtil.createJWT(jwtProperties.getUserSecretKey(),jwtProperties.getUserTtl(),claims);
        UserLoginVO userLoginVO = UserLoginVO.builder()
                .id(user.getId())
                .openid(user.getOpenid())
                .token(token)
                .build();
        return Result.success(userLoginVO);
    }

}
