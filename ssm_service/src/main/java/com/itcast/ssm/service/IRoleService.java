package com.itcast.ssm.service;

import com.itcast.ssm.domain.Role;

import java.util.List;

/**
 * Create by Kenson on 2018/10/15
 */

public interface IRoleService {


    //给用户添加角色
    void  saveRole(Role role) throws Exception;


    //查询所有角色
    List<Role> findAll() throws Exception;

    //查询角色的详细信息
    Role findById(String id) throws Exception;


    //查询角色并且查询该角色没有的权限
    Role findRoleByIdAndAllPer(String roleId)throws Exception;

    //给角色添加权限
    void addPerToRole(String roleId, String[] perIds)throws Exception;
}
