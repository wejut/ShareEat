package com.shareeat.merchant.service;

import com.shareeat.merchant.dto.UserLoginDTO;
import com.shareeat.merchant.entity.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    User wxlogin(UserLoginDTO userLoginDTO);
}
