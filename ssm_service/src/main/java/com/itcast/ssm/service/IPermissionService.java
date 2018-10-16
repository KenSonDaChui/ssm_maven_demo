package com.itcast.ssm.service;

import com.itcast.ssm.domain.Permission;

import java.util.List;

/**
 * Create by Kenson on 2018/10/15
 */

public interface IPermissionService {

    List<Permission> findAll() throws Exception;

    void save(Permission per) throws Exception;

}
