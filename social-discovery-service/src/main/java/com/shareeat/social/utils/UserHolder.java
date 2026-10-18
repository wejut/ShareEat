package com.shareeat.social.utils;


import com.shareeat.social.dto.UserDTO;
public class UserHolder {
    private static final ThreadLocal<UserDTO> tl = new ThreadLocal<>();

    public static void saveUser(UserDTO UserDTO){
        tl.set(UserDTO);
    }

    public static UserDTO getUser(){
        return tl.get();
    }

    public static void removeUser(){
        tl.remove();
    }
}
