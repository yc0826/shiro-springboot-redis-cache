package com.platform.web.dao.auth;


import com.platform.api.auth.entity.App;
import com.platform.common.annotation.MyBatisRepository;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: AppMapper
 * @Description: 应用
 */
@MyBatisRepository
public interface IAppDao {
    int deleteByPrimaryKey(Long id);

    int insert(App record);

    int insertSelective(App record);

    App selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(App record);

    int updateByPrimaryKey(App record);

    List<App> selectAll();

    List<App> selectPage(Map<String, Object> p);

    Long selectAppIdByAppKey(String appKey);
}