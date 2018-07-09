package com.babysky.management.api.auth.service.api;

import com.babysky.management.api.auth.dto.SubsyComboDto;
import com.babysky.management.api.auth.entity.MstSubsyBaseEntity;

import java.util.List;
import java.util.Map;

/**
 * @author YangChao
 */
public interface SubsyBaseService {


    List<MstSubsyBaseEntity> findAll();

    Integer count(Map<String, Object> paramMap);



    MstSubsyBaseEntity findByCode(String subsyCode);



    void update(MstSubsyBaseEntity mstSubsyBaseEntity);

    String getSubsyNamesByCodes(String subsyCodes);

    List<SubsyComboDto> getSubsyListByUserCode(String userCode);

    List<MstSubsyBaseEntity> findSubsyListBySubsyCodes(Map<String,Object> paramMap);
}
