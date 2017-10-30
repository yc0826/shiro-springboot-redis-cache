package com.platform.web.dao.auth;


import com.platform.api.auth.entity.Role;
import com.platform.common.annotation.MyBatisRepository;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: RoleMapper
 * @Description: 角色
 */
@MyBatisRepository
public interface IRoleDao {
    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> selectAll();

    List<Role> selectPage(Map<String, Object> p);

}