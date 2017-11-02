package com.platform.dao.business.subsy;


import com.platform.api.business.subsy.entity.MstSubsyBaseEntity;
import com.platform.common.annotation.MyBatisRepository;

import java.util.List;
import java.util.Map;

@MyBatisRepository
public interface IMstSubsyBaseDao {


    void updateById(MstSubsyBaseEntity mstSubsyBaseEntity);

    void insert(MstSubsyBaseEntity mstSubsyBaseEntity);

    MstSubsyBaseEntity queryById(String id);

    List<MstSubsyBaseEntity> queryList(MstSubsyBaseEntity mstSubsyBaseEntity);

    List<MstSubsyBaseEntity> queryList(Map map);

    List<MstSubsyBaseEntity> queryAll();

    int queryCount(MstSubsyBaseEntity mstSubsyBaseEntity);

    int deleteById(String id);

    int deleteLogicById(String id);

    //-- user-defined start --
    List<MstSubsyBaseEntity> querySubsyListByMap(Map map);

    MstSubsyBaseEntity queryByCode(Map<String, Object> map);

    List<MstSubsyBaseEntity> getSubsyBannerList();

    Integer count(Map<String, Object> paramMap);
    //-- user-defined end --
}