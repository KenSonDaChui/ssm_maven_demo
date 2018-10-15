package com.itcast.ssm.controller;

import com.itcast.ssm.domain.UserInfo;
import com.itcast.ssm.service.IUserService;
import com.itcast.ssm.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Create by Kenson on 2018/10/14
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    //查询用户的所有信息
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userlist = userService.findAll();
        mv.addObject("userList",userlist);
        mv.setViewName("user-list");
        return mv;
    }

    //保存用户
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo) throws Exception {
        userService.save(userInfo);

        return "redirect:/user/findAll.do";

    }

    //查找用户详情信息
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo =  userService.findById(id);
        System.out.println("===========================userInfo=========================");
        System.out.println(userInfo);
        mv.addObject("user",userInfo);
        mv.setViewName("user-show");
        return mv;
    }
}
