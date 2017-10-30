package com.platform.web.dao.auth;


import com.platform.common.annotation.MyBatisRepository;
import com.platform.api.auth.entity.Resource;

import java.util.List;

/**
 * @ClassName: ResourceMapper
 * @Description: 资源
 */
@MyBatisRepository
public interface IResourceDao {
    int deleteByPrimaryKey(Long id);

    int insert(Resource record);

    int insertSelective(Resource record);

    Resource selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Resource record);

    int updateByPrimaryKey(Resource record);

    List<Resource> selectAll();
}