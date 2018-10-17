package com.itcast.ssm.service.impl;

import com.itcast.ssm.dao.IPermissionDao;
import com.itcast.ssm.domain.Permission;
import com.itcast.ssm.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Create by Kenson on 2018/10/15
 */

@Service
@Transactional
public class IPermissionServiceImpl implements IPermissionService {

    @Autowired
    private IPermissionDao permissionDao;

    @Override
    public List<Permission> findAll() throws Exception {

        return permissionDao.findAll();

    }

    @Override
    public void save(Permission per) throws Exception {
        permissionDao.save(per);
    }
}
