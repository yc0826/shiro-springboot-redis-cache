package com.platform.service.impl.auth;

import com.platform.api.auth.entity.Authorization;
import com.platform.api.auth.entity.User;
import com.platform.api.auth.service.AppService;
import com.platform.api.auth.service.AuthorizationService;
import com.platform.api.auth.service.RoleService;
import com.platform.api.auth.service.UserService;
import com.platform.web.dao.auth.IAuthorizationDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @ClassName: AuthorizationServiceImpl
 * @Description: 权限
 */
@Service("authorizationService")
public class AuthorizationServiceImpl implements AuthorizationService {

    @Autowired
    private IAuthorizationDao authorizationDao;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private AppService appService;

    @Override
    public Authorization createAuthorization(Authorization authorization) {
        return merge(authorization);
    }

    public Authorization updateAuthorization(Authorization authorization) {
        return merge(authorization);
    }

    private Authorization merge(Authorization authorization) {
        Map<String, Object> map = new HashMap<>();
        map.put("appId", authorization.getAppId());
        map.put("userId", authorization.getUserId());

        Authorization dbAuthorization = authorizationDao.selectByAppUser(map);
        if (dbAuthorization == null) {//如果数据库中不存在相应记录 直接新增
            authorizationDao.insertSelective(authorization);
            return authorization;
        }

        if (dbAuthorization.equals(authorization)) {//如果是同一条记录直接更新记录
            authorizationDao.updateByPrimaryKeySelective(authorization);
            return authorization;
        }
        //kaishi
        String zhongjianzhi = dbAuthorization.getRoleIds();
        String[] dbroleIds = dbAuthorization.getRoleIds().split(",");
        List<Long> dblist = new ArrayList<>();
        for (String dbroleId : dbroleIds) {
            dblist.add(Long.valueOf(dbroleId));
        }
        String[] roleIds = authorization.getRoleIds().split(",");
        for (String roleId : roleIds) {
            if (roleId != null && !dblist.contains(Long.parseLong(roleId))) {
                dblist.add(Long.valueOf(roleId));
                zhongjianzhi = dbAuthorization.getRoleIds() + "," + roleId;
            }
        }
        dbAuthorization.setRoleIds(zhongjianzhi);


        //jieshu
       /* for(Long roleId : authorization.getRoleIds()) {//否则合并

            if(!dbAuthorization.getRoleIds().contains(roleId)) {
                dbAuthorization.getRoleIds().add(roleId);
            }
        }*/

        if (dbAuthorization.getRoleIds().isEmpty()) {//如果没有角色 直接删除记录即可
            authorizationDao.deleteByPrimaryKey(dbAuthorization.getId());
            return dbAuthorization;
        }
        //否则更新
        authorizationDao.updateByPrimaryKeySelective(dbAuthorization);
        return dbAuthorization;
    }

    public void deleteAuthorization(Long authorizationId) {
        authorizationDao.deleteByPrimaryKey(authorizationId);
    }

    @Override
    public Authorization findOne(Long authorizationId) {
        return authorizationDao.selectByPrimaryKey(authorizationId);
    }

    @Override
    public List<Authorization> findAll() {
        return authorizationDao.selectAll();
    }

    /**
     * 根据用户名查找其角色
     */
    public Set<String> findRoles(String appKey, String username) {
        User user = userService.findByUsername(username);
        if (user == null) {
            return Collections.emptySet();
        }
        Long appId = appService.findAppIdByAppKey(appKey);
        if (appId == null) {
            return Collections.emptySet();
        }
        Map<String, Object> map = new HashMap<>();
        map.put("appId", appId);
        map.put("userId", user.getId());

        Authorization authorization = authorizationDao.selectByAppUser(map);
        if (authorization == null) {
            return Collections.emptySet();
        }

        //
        String[] dbroleIds = authorization.getRoleIds().split(",");
        List<Long> dblist = new ArrayList<>();
        for (String dbroleId : dbroleIds) {
            dblist.add(Long.valueOf(dbroleId));
        }
        //
        return roleService.findRoles(dblist.toArray(new Long[0]));
    }

    /**
     * 根据用户名查找其权限
     *
     * @param username
     */
    public Set<String> findPermissions(String appKey, String username) {
        User user = userService.findByUsername(username);
        if (user == null) {
            return Collections.emptySet();
        }
        Long appId = appService.findAppIdByAppKey(appKey);
        if (appId == null) {
            return Collections.emptySet();
        }
        Map<String, Object> map = new HashMap<>();
        map.put("appId", appId);
        map.put("userId", user.getId());
        Authorization authorization = authorizationDao.selectByAppUser(map);
        if (authorization == null) {
            return Collections.emptySet();
        }
        //
        String[] dbroleIds = authorization.getRoleIds().split(",");
        List<Long> dblist = new ArrayList<>();
        for (String dbroleId : dbroleIds) {
            dblist.add(Long.valueOf(dbroleId));
        }
        //
        return roleService.findPermissions(dblist.toArray(new Long[0]));
    }

    @Override
    public List<Authorization> findPage(Map<String, Object> p) {
        return authorizationDao.selectPage(p);
    }


}
