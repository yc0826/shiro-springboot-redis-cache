package com.platform.dao.auth;


import com.platform.api.auth.entity.User;
import com.platform.common.annotation.MyBatisRepository;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: UserMapper
 * @Description: 用户
 */
@MyBatisRepository
public interface IUserDao {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> selectAll();

    List<User> selectPage(Map<String, Object> p);

    User selectByUsername(Map<String, Object> map);

    Integer count(Map<String, Object> p);
}