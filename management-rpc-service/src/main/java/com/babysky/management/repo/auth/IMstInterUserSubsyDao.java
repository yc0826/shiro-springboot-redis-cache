package com.babysky.management.repo.auth;


import com.babysky.management.api.auth.entity.MstInterUserSubsyEntity;
import com.babysky.management.common.annotation.MyBatisRepository;

import java.util.List;
import java.util.Map;

@MyBatisRepository
public interface IMstInterUserSubsyDao {


    void updateById(MstInterUserSubsyEntity mstInterUserSubsyEntity);

    void insert(MstInterUserSubsyEntity mstInterUserSubsyEntity);

    MstInterUserSubsyEntity queryById(String id);

    List<MstInterUserSubsyEntity> queryList(MstInterUserSubsyEntity mstInterUserSubsyEntity);

    List<MstInterUserSubsyEntity> queryAll();

    int queryCount(MstInterUserSubsyEntity mstInterUserSubsyEntity);

    int deleteById(String id);

    int deleteLogicById(String id);

    //-- user-defined start --


    public List<MstInterUserSubsyEntity> getUserSubsyList(MstInterUserSubsyEntity param);

    List<MstInterUserSubsyEntity> getUserSubsyListBySubSyCode(MstInterUserSubsyEntity param);

//    List<MstInterUserSubsyEntity> getUserSubsyListByInterUserCode(String interUserCode);

    List<MstInterUserSubsyEntity> getUserSubsyListByDeptCode(Map params);


    List<Map> getInterUserSubsyListByUserCode(String interUserCode);
    //-- user-defined end --
 
}
