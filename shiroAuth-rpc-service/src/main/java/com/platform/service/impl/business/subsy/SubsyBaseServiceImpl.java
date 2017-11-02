package com.platform.service.impl.business.subsy;

import com.platform.api.business.subsy.entity.MstSubsyBaseEntity;
import com.platform.api.business.subsy.service.SubsyBaseService;
import com.platform.dao.business.subsy.IMstSubsyBaseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("subsyBaseService")
public class SubsyBaseServiceImpl implements SubsyBaseService{

    @Autowired
    private IMstSubsyBaseDao mstSubsyBaseDao;

    @Override
    public List<MstSubsyBaseEntity> querySubsyListByMap(Map map) {
        return mstSubsyBaseDao.querySubsyListByMap(map);
    }


    @Override
    public Integer count(Map<String, Object> paramMap) {
        return mstSubsyBaseDao.count(paramMap);
    }
}
