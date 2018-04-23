package com.lyf.action;

import com.lyf.pojos.Role;
import com.lyf.service.RoleService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by fangjiejie on 2018/4/17.
 */
public class RoleAction extends ActionSupport implements ModelDriven<Role>,ServletRequestAware,ServletResponseAware {
    HttpServletRequest request;
    HttpServletResponse response;
    Role role=new Role();
    @Autowired
    @Qualifier("roleService")
    RoleService roleService;
    @Override
    public Role getModel() {
        return role;
    }
    public String roleList(){
        List<Role> list=roleService.getRoleList();
        request.setAttribute("rlist",list);
        return "roleList";
    }

//    public String towardRoleList(){
//        return "towardRoleList";
//    }
    public String roleDelete(){
        int rid=Integer.parseInt(request.getParameter("rid"));
        roleService.deleteRole(rid);
        List<Role> list=roleService.getRoleList();
        request.setAttribute("rlist",list);
        return "roleList";
    }
    public String towardRoleAdd(){
        return "towardRoleAdd";
    }
    public String roleAdd(){
        roleService.addRole(role);
        List<Role> list=roleService.getRoleList();
        request.setAttribute("rlist",list);
        return "roleList";
    }
    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request=httpServletRequest;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response=httpServletResponse;
    }
}
