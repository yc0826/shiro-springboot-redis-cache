package com.platform.api.business.subsy.service;

import com.platform.api.business.subsy.entity.MstSubsyBaseEntity;

import java.util.List;
import java.util.Map;

public interface SubsyBaseService {

    List<MstSubsyBaseEntity> querySubsyListByMap(Map map);

    Integer count(Map<String, Object> paramMap);
}
