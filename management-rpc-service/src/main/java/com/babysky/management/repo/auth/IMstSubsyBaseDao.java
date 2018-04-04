package com.babysky.management.repo.auth;


import com.babysky.management.api.auth.entity.MstSubsyBaseEntity;
import com.babysky.management.common.annotation.MyBatisRepository;

import java.util.List;
import java.util.Map;

/**
 * @author YangChao
 */
@MyBatisRepository
public interface IMstSubsyBaseDao {

    List<MstSubsyBaseEntity> querySubsyListByMap(Map<String, Object> map);

    MstSubsyBaseEntity queryByCode(String subsyCode);

    Integer count(Map<String, Object> paramMap);

    List<MstSubsyBaseEntity> findAll();

    String getSubsyNamesByCodes(String[] subsyCodesArray);

    List<MstSubsyBaseEntity> getSubsyListByCodes(String[] subsyCodesArray);


    String getSubsyRegionIndex(String regionCode);

    String getSubsyBrandIndex(String brandCode);

    String getLastCodeByPrefix(String prefix);

    void insert(MstSubsyBaseEntity mstSubsyBaseEntity);

    void updateById(MstSubsyBaseEntity mstSubsyBaseEntity);

    List<MstSubsyBaseEntity> findSubsyListBySubsyCodes(Map<String, Object> paramMap);

    List<MstSubsyBaseEntity> queryByMobnum(Map map);

    Integer findSubsyListForCloseCount(Map paramMap);

    List<MstSubsyBaseEntity> getSubsyInfoListByUserCode(String userCode);

}