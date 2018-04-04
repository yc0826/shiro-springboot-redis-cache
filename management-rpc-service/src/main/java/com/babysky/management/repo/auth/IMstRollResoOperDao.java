package com.babysky.management.repo.auth;

import com.babysky.management.api.auth.entity.MstRollResoOperEntity;
import com.babysky.management.common.annotation.MyBatisRepository;

import java.util.List;

@MyBatisRepository
public interface IMstRollResoOperDao {


    /**
     * @param mstRollResoOperEntity
     * @return
     */
    int updateById(MstRollResoOperEntity mstRollResoOperEntity);

    /**
     * @param mstRollResoOperEntity
     */
    void insert(MstRollResoOperEntity mstRollResoOperEntity);

    /**
     * @param mstRollResoOperEntity
     * @return
     */
    List<MstRollResoOperEntity> queryList(MstRollResoOperEntity mstRollResoOperEntity);

    /**
     * @return
     */
    List<MstRollResoOperEntity> queryAll();

    /**
     * @param id
     * @return
     */
    int deleteById(String id);


    //-- user-defined start --








    //-- user-defined end --
}