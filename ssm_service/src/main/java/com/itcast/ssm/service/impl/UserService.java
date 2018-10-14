package com.itcast.ssm.service.impl;

import com.itcast.ssm.dao.IUserDao;
import com.itcast.ssm.domain.Role;
import com.itcast.ssm.domain.UserInfo;
import com.itcast.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Create by Kenson on 2018/10/13
 */

@Service("userService")
@Transactional
public class UserService implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        UserInfo userInfo = userDao.findByUsername(s);
       // User user = new User(userInfo.getUsername(), userInfo.getPassword(), getAuthority());
        User user = new User(userInfo.getUsername(),userInfo.getPassword(),userInfo.getStatus()==0?false:true,true,true,true,getAuthority(userInfo.getRoles()));
        System.out.println(user);
        return user;
    }

   List<SimpleGrantedAuthority> getAuthority(List<Role> autothrylist){
       List<SimpleGrantedAuthority> list = new ArrayList<>();
       for (Role role : autothrylist) {
           list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
       }
       return list;
   }

  /*  List<SimpleGrantedAuthority> getAuthority() {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        list.add(new SimpleGrantedAuthority("ROLE_USER"));
        list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        return list;
    }*/
}
