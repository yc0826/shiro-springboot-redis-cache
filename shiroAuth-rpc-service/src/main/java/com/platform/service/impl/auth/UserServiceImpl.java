package com.platform.service.impl.auth;

import com.platform.api.auth.entity.User;
import com.platform.api.auth.service.UserService;
import com.platform.api.utils.PasswordHelper;
import com.platform.web.dao.auth.IUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: UserServiceImpl
 * @Description: 用户
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    /* @Autowired
     private UserDao userDao;*/
    @Autowired
    private IUserDao userDao;

    /**
     * 创建用户
     *
     * @param user
     */
    public User createUser(User user) {
        //加密密码
        PasswordHelper.encryptPassword(user);
        userDao.insert(user);
        return user;
    }

    @Override
    public User updateUser(User user) {
        userDao.updateByPrimaryKeySelective(user);
        return user;
    }

    @Override
    public void deleteUser(Long userId) {
        userDao.deleteByPrimaryKey(userId);
    }

    /**
     * 修改密码
     *
     * @param userId
     * @param newPassword
     */
    public void changePassword(Long userId, String newPassword) {

        User user = userDao.selectByPrimaryKey(userId);
        user.setPassword(newPassword);
        PasswordHelper.encryptPassword(user);
        userDao.updateByPrimaryKeySelective(user);
    }

    @Override
    public User findOne(Long userId) {

        return userDao.selectByPrimaryKey(userId);
    }

    @Override
    public List<User> findAll() {
        return userDao.selectAll();
    }

    /**
     * 根据用户名查找用用户
     */
    public User findByUsername(String username) {
        Map<String, Object> map = new HashMap<>();
        map.put("userName", username);
        return userDao.selectByUsername(map);
    }

    @Override
    public List<User> findPage(Map<String, Object> p) {
        return userDao.selectPage(p);
    }


}
