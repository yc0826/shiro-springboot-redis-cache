package com.platform.dao.auth;

import com.platform.common.annotation.MyBatisRepository;
import com.platform.api.auth.entity.Organization;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: OrganizationMapper
 * @Description: 组织
 */
@MyBatisRepository
public interface IOrganizationDao {
    int deleteByPrimaryKey(Long id);

    int insert(Organization record);

    int insertSelective(Organization record);

    Organization selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKey(Organization record);

    List<Organization> selectAll();

    List<Organization> selectAllWithExclude(Map<String, Object> map);

    int moveStepOne(Map<String, Object> map);

    int moveStepTwo(Map<String, Object> map);
}