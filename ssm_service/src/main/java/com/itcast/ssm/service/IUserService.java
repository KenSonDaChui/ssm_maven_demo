package com.itcast.ssm.service;

import com.itcast.ssm.domain.Role;
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
    void save(UserInfo userInfo) throws Exception;


    //查询用户详细信息
    UserInfo findById(String id) throws Exception;


    //查询用户可添加的角色
    UserInfo findUserAndOtherRole(String id) throws Exception;


    //向用户添加角色
    void addRoleToUser(String id, String[] roleIds) throws Exception;

}
