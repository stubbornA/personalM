package com.lyf.service.imp;

import com.lyf.dao.GenericHibernateDAO;
import com.lyf.pojos.Role;
import com.lyf.service.RoleService;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fangjiejie on 2018/4/17.
 */
@Service("roleService")
public class RoleServiceImp extends GenericHibernateDAO implements RoleService{
    @Override
    public List<Role> getRoleList() {
        Query query=this.createQuery("from Role");
        List<Role> list=query.list();
        return list;
    }
    @Override
    public void addRole(Role role) {
        this.save(role);
    }

    @Override
    public void deleteRole(int rid) {
       this.deleteByIds(Role.class,rid);
    }

    @Override
    public Role getRoleById(int id) {
        return (Role)this.getObjById(Role.class,id);
    }
}
