package com.itcast.ssm.service.impl;

import com.itcast.ssm.dao.IRoleDao;
import com.itcast.ssm.domain.Role;
import com.itcast.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Create by Kenson on 2018/10/15
 */

@Service
@Transactional
public class RoleServiceImpl implements IRoleService{

    @Autowired
    private IRoleDao roleDao;
    @Override
    public void saveRole(Role role) throws Exception{
        roleDao.saveRole(role);
    }

    @Override
    public List<Role> findAll() throws Exception {

        return roleDao.findAll();
    }

    @Override
    public Role findById(String id) throws Exception {

        return roleDao.findById(id);
    }

    @Override
    public Role findRoleByIdAndAllPer(String roleId) throws Exception {
        return roleDao.findRoleByIdAndAllPer(roleId);
    }

    @Override
    public void addPerToRole(String roleId, String[] perIds)throws Exception {
        for (String perId : perIds) {
            roleDao.addPerToRole(roleId,perId);
        }
    }

}
