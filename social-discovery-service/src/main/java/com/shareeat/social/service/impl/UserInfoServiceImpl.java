package com.shareeat.social.service.impl;

import com.shareeat.social.entity.UserInfo;
import com.shareeat.social.mapper.UserInfoMapper;
import com.shareeat.social.service.IUserInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @since 2021-12-24
 */
@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements IUserInfoService {

}
