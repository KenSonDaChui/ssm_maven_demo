package com.itcast.ssm.controller;

import com.itcast.ssm.domain.Permission;
import com.itcast.ssm.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Create by Kenson on 2018/10/15
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private IPermissionService IPermissionServiceImpl;

    @RequestMapping("/findAll.do")
    public ModelAndView findRoleByIdAndPer() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Permission> permissionList = IPermissionServiceImpl.findAll();
        mv.addObject("permissionList",permissionList);
        mv.setViewName("permissionList-list");
        return mv;

    }


    @RequestMapping("/save.do")
    public String save(Permission per) throws Exception {
        ModelAndView mv = new ModelAndView();
        IPermissionServiceImpl.save(per);
        return "redirect:/permission/findAll.do";

    }
}
