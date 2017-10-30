package com.platform.service.impl.auth;

import com.platform.api.auth.entity.Role;
import com.platform.api.auth.service.ResourceService;
import com.platform.api.auth.service.RoleService;
import com.platform.web.dao.auth.IRoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @ClassName: RoleServiceImpl
 * @Description: 角色
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private IRoleDao roleDao;
    @Autowired
    private ResourceService resourceService;

    public Role createRole(Role role) {
        roleDao.insertSelective(role);
        return role;
    }

    public Role updateRole(Role role) {
        roleDao.updateByPrimaryKeySelective(role);
        return role;
    }

    public void deleteRole(Long roleId) {
        roleDao.deleteByPrimaryKey(roleId);
    }

    @Override
    public Role findOne(Long roleId) {
        return roleDao.selectByPrimaryKey(roleId);
    }

    @Override
    public List<Role> findAll() {
        return roleDao.selectAll();
    }

    @Override
    public Set<String> findRoles(Long... roleIds) {
        Set<String> roles = new HashSet<>();
        for (Long roleId : roleIds) {
            Role role = findOne(roleId);
            if (role != null) {
                roles.add(role.getRole());
            }
        }
        return roles;
    }

    @Override
    public Set<String> findPermissions(Long[] roleIds) {
        Set<Long> resourceIds = new HashSet<>();
        for (Long roleId : roleIds) {
            Role role = findOne(roleId);
            if (role != null) {

                //
                String[] resourceIdStrs = role.getResourceIds().split(",");
                for (String resourceIdStr : resourceIdStrs) {
                    if (resourceIdStr == null) {
                        continue;
                    }
                    resourceIds.add(Long.valueOf(resourceIdStr));
                }
                //

                //resourceIds.addAll(role.getResourceIds());
            }
        }
        return resourceService.findPermissions(resourceIds);
    }


    @Override
    public List<Role> findPage(Map<String, Object> map) {
        return roleDao.selectPage(map);
    }
}
