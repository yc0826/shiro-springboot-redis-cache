package com.platform.service.impl.auth;

import com.platform.api.auth.entity.Role;
import com.platform.api.auth.service.ResourceService;
import com.platform.api.auth.service.RoleService;
import com.platform.dao.auth.IRoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

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
        roleDao.deleteRoleResource(role.getId());
        if (!CollectionUtils.isEmpty(role.getResourceIdsList())) {
            for (Long resourceId : role.getResourceIdsList()) {
                Map<String, Object> paramMap = new HashMap<>();
                paramMap.put("roleId", role.getId());
                paramMap.put("resourceId", resourceId);
                roleDao.insertRoleResource(paramMap);
            }
        }

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
        Set<Long> resourceIds = roleDao.findResourceIdsByRoleIds(roleIds);
        if (!CollectionUtils.isEmpty(resourceIds)) {
            return resourceService.findPermissions(resourceIds);
        }
        return null;
    }


    @Override
    public List<Role> findPage(Map<String, Object> map) {
        return roleDao.selectPage(map);
    }
}
