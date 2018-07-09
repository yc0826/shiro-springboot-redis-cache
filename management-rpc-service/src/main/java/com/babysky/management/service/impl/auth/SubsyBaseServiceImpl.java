package com.babysky.management.service.impl.auth;

import com.babysky.management.api.auth.dto.SubsyComboDto;
import com.babysky.management.api.auth.entity.MstSubsyBaseEntity;
import com.babysky.management.api.auth.service.api.SubsyBaseService;
import com.babysky.management.common.Constants;
import com.babysky.management.repo.auth.IMstSubsyBaseDao;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author YangChao
 */
@Service("subsyBaseService")
public class SubsyBaseServiceImpl implements SubsyBaseService {

    @Resource
    private IMstSubsyBaseDao mstSubsyBaseDao;





    @Override
    public Integer count(Map<String, Object> paramMap) {
        return mstSubsyBaseDao.count(paramMap);
    }



    @Override
    public List<MstSubsyBaseEntity> findAll() {
        return mstSubsyBaseDao.findAll();
    }







    @Override
    public MstSubsyBaseEntity findByCode(String subsyCode) {
        return mstSubsyBaseDao.queryByCode(subsyCode);
    }



    @Override
    public void update(MstSubsyBaseEntity mstSubsyBaseEntity) {
        if (Constants.SUBSY_AUDIT_STATUS_03.equals(mstSubsyBaseEntity.getAuditStatusCode())) {
            mstSubsyBaseEntity.setAuditStatusCode(Constants.SUBSY_AUDIT_STATUS_01);
        }
        mstSubsyBaseDao.updateById(mstSubsyBaseEntity);
    }

    @Override
    public String getSubsyNamesByCodes(String subsyCodes) {
        if (StringUtils.hasText(subsyCodes)) {
            String[] subsyCodesArray = subsyCodes.split(",");
            return mstSubsyBaseDao.getSubsyNamesByCodes(subsyCodesArray);
        }
        return null;
    }

    @Override
    public List<SubsyComboDto> getSubsyListByUserCode(String userCode) {
        return mstSubsyBaseDao.getSubsyListByUserCode(userCode);
    }

    @Override
    public List<MstSubsyBaseEntity> findSubsyListBySubsyCodes(Map<String, Object> paramMap) {
        return null;
    }
}
