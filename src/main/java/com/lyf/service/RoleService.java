package com.lyf.service;

import com.lyf.pojos.Role;

import java.util.List;

/**
 * Created by fangjiejie on 2018/4/17.
 */
public interface RoleService {
      List<Role> getRoleList();
      void addRole(Role role);
      void deleteRole(int id);
      Role getRoleById(int id);
}
