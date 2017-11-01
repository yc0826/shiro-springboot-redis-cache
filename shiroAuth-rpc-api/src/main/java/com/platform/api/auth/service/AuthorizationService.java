package com.platform.api.auth.service;

import com.platform.api.auth.entity.Authorization;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @ClassName: AuthorizationService
 * @Description: 权限
 */
public interface AuthorizationService {


    Authorization createAuthorization(Authorization authorization);

    Authorization updateAuthorization(Authorization authorization);

    void deleteAuthorization(Long authorizationId);

    Authorization findOne(Long authorizationId);

    List<Authorization> findAll();

    List<Authorization> findPage(Map<String, Object> p);

    /**
     * 根据AppKey和用户名查找其角色
     */
    Set<String> findRoles(String appKey, String username);

    /**
     * 根据AppKey和用户名查找权限字符
     * @param username
     */
    Set<String> findPermissions(String appKey, String username);


    Integer count(Map<String, Object> paramMap);
}
