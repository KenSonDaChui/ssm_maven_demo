package com.itcast.ssm.service;

import com.itcast.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * Create by Kenson on 2018/10/13
 */

public interface IUserService extends UserDetailsService {

    //查询用户信息的方法
    public List<UserInfo> findAll() throws  Exception;



    //保存用户信息
    void save(UserInfo userInfo);


    //查询用户详细信息
    UserInfo findById(String id);
}
