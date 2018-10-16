package com.itcast.ssm.controller;

import com.itcast.ssm.domain.UserInfo;
import com.itcast.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    //查询用户的所有信息(带有模糊查询)
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
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(String id) throws Exception {
        ModelAndView mv = new ModelAndView();
       UserInfo us= userService.findUserAndOtherRole(id);
        System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        System.out.println(us);

        mv.addObject("user",us);
        mv.setViewName("user-role-add");
        return mv;
    }



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

    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name = "userId",required = true) String id, @RequestParam(name = "ids",required = true) String[] roleIds) throws Exception {
        userService.addRoleToUser(id,roleIds);


        return "redirect:/user/findAll.do";
    }

}
