package com.platform.api.auth.service;

import com.platform.api.auth.entity.Role;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @ClassName: RoleService
 */
public interface RoleService {


    Role createRole(Role role);

    Role updateRole(Role role);

    void deleteRole(Long roleId);

    Role findOne(Long roleId);

    List<Role> findAll();

    /**
     * 根据角色编号得到角色标识符列�?
     *
     * @param roleIds
     */
    Set<String> findRoles(Long... roleIds);

    /**
     * 根据角色编号得到权限字符串列�?
     *
     * @param roleIds
     */
    Set<String> findPermissions(Long[] roleIds);

    List<Role> findPage(Map<String, Object> map);
}
