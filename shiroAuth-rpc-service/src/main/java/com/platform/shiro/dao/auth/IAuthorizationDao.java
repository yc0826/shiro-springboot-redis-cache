package com.platform.shiro.dao.auth;

import com.platform.api.auth.entity.Authorization;
import com.platform.common.annotation.MyBatisRepository;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: AuthorizationMapper
 */
@MyBatisRepository
public interface IAuthorizationDao {
    int deleteByPrimaryKey(Long id);

    int insert(Authorization record);

    int insertSelective(Authorization record);

    Authorization selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Authorization record);

    int updateByPrimaryKey(Authorization record);

    List<Authorization> selectAll();

    List<Authorization> selectPage(Map<String, Object> map);

    Authorization selectByAppUser(Map<String, Object> map);

}