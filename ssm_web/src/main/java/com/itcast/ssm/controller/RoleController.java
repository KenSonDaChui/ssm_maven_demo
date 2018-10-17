package com.itcast.ssm.controller;

import com.itcast.ssm.domain.Permission;
import com.itcast.ssm.domain.Role;
import com.itcast.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

/**
 * Create by Kenson on 2018/10/15
 */

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;


    @RequestMapping("/save.do")
    public String findRoleByIdAndPer(Role role) throws Exception {
        roleService.saveRole(role);
        return "redirect:/role/findAll.do";

    }


    @RequestMapping("/findAll.do")
    //@PreAuthorize("hasRole('ROLE_USER')")
   // @PreAuthorize("authentication.principal.username='DaChui'")
   //@RolesAllowed("USER")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Role> list = roleService.findAll();
       mv.addObject("roleList",list);
       mv.setViewName("role-list");
        return mv;

    }


    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        Role role =  roleService.findById(id);
        mv.addObject("roleList",role);
        mv.setViewName("role-show");
        return mv;

    }


    @RequestMapping("/findRoleByIdAndAllPer.do")
    public ModelAndView findRoleByIdAndAllPer(String roleId) throws Exception {
        ModelAndView mv = new ModelAndView();
       Role role =  roleService.findRoleByIdAndAllPer(roleId);
        mv.addObject("role",role);
        mv.setViewName("role-per-add");
        return mv;

    }

    @RequestMapping("/addPerToRole.do")
    public String addPerToRole(@RequestParam(name = "roleId") String roleId,@RequestParam(name = "ids") String[] PerIds ) throws Exception {
        roleService.addPerToRole(roleId,PerIds);
        return "redirect:/role/findAll.do";
    }

}
