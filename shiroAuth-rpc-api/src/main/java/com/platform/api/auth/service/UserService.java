package com.platform.api.auth.service;


import com.platform.api.auth.entity.User;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: UserService
 * @Description: 用户
 */
public interface UserService {

    /**
     * 创建用户
     *
     * @param user
     */
    User createUser(User user);

    User updateUser(User user);

    void deleteUser(Long userId);

    /**
     * 修改密码
     *
     * @param userId
     * @param newPassword
     */
    void changePassword(Long userId, String newPassword);


    User findOne(Long userId);

    List<User> findAll();

    List<User> findPage(Map<String, Object> p);

    /**
     * 根据用户名查找用�?
     *
     * @param username
     * @return
     */
    User findByUsername(String username);


}
