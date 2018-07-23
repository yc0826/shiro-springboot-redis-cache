package com.shiro.auth.service.impl.auth;

import com.alibaba.dubbo.config.annotation.Service;
import com.shiro.auth.api.auth.dto.InterUserDto;
import com.shiro.auth.api.auth.entity.MstInterUserBaseEntity;
import com.shiro.auth.api.auth.entity.MstInterUserDtlEntity;
import com.shiro.auth.api.auth.service.api.MstInterUserBaseService;
import com.shiro.auth.api.auth.service.api.SubsyBaseService;
import com.shiro.auth.api.utils.PasswordHelper;
import com.shiro.auth.common.Constants;
import com.shiro.auth.common.exception.SystemException;
import com.shiro.auth.common.utils.BizCodeGeneratorUtil;
import com.shiro.auth.common.utils.DateUtil;
import com.shiro.auth.common.utils.StringUtil;
import com.shiro.auth.repo.auth.IMstInterUserBaseDao;
import com.shiro.auth.repo.auth.IMstInterUserDtlDao;
import com.shiro.auth.repo.auth.IMstInterUserRollDao;
import org.apache.shiro.util.StringUtils;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.shiro.auth.common.utils.BizCodeGeneratorUtil.TblNameIntiEnum.MST_INTER_USER_BASE;

/**
 * @author YangChao
 */
@Service
public class MstInterUserBaseServiceImpl implements MstInterUserBaseService {

    @Resource
    private IMstInterUserBaseDao mstInterUserBaseDao;

    @Resource
    private SubsyBaseService subsyBaseService;

    @Resource
    private IMstInterUserDtlDao mstInterUserDtlDao;


    @Resource
    private IMstInterUserRollDao mstInterUserRollDao;

    //-- user-defined start --


    @Override
    public List<MstInterUserBaseEntity> findAll() {
        return mstInterUserBaseDao.findAll();
    }

    @Override
    public MstInterUserBaseEntity findByCode(String userCode) {
        MstInterUserBaseEntity mstInterUserBaseEntity = mstInterUserBaseDao.findByCode(userCode);
        String subsyCodes = mstInterUserBaseDao.findUserSubyCodesByUserCode(userCode);
        mstInterUserBaseEntity.setSubsyNames(subsyBaseService.getSubsyNamesByCodes(subsyCodes));
        mstInterUserBaseEntity.setSubsyCodes(mstInterUserBaseDao.findUserSubyCodesByUserCode(mstInterUserBaseEntity.getInterUserCode()));
        return mstInterUserBaseEntity;
    }

    @Override
    public MstInterUserDtlEntity findDtlByUserCode(String userCode) {
        MstInterUserDtlEntity dtlEntity = mstInterUserDtlDao.findByUserCode(userCode);
        if (dtlEntity != null && dtlEntity.getUserDob() != null) {
            dtlEntity.setBirthday(DateUtil.parseInt8ToString(dtlEntity.getUserDob(), DateUtil.DATE_PATTERN));
        }
        return dtlEntity;
    }

    @Override
    public MstInterUserBaseEntity findByUsername(String username) {
        MstInterUserBaseEntity mstInterUserBaseEntity = mstInterUserBaseDao.findByUsername(username);
        if (mstInterUserBaseEntity == null) {
            return null;
        }
        Map<String, Object> map = new HashMap<>();
        map.put("userCode", mstInterUserBaseEntity.getInterUserCode());
        List<String> roleCodes = mstInterUserRollDao.findByUserCode(map);
        if (CollectionUtils.isEmpty(roleCodes)) {
            mstInterUserBaseEntity.setAuthorizedFlg(false);
        } else {
            mstInterUserBaseEntity.setAuthorizedFlg(true);
        }

        mstInterUserBaseEntity.setSubsyCodes(mstInterUserBaseDao.findUserSubyCodesByUserCode(mstInterUserBaseEntity.getInterUserCode()));
        return mstInterUserBaseEntity;
    }

    @Override
    public List<InterUserDto> findPage(Map<String, Object> paramMap) {
        List<InterUserDto> list = mstInterUserBaseDao.findPage(paramMap);
        list.forEach(
                user -> {
                    String subsyCodes = mstInterUserBaseDao.findUserSubyCodesByUserCode(user.getInterUserCode());
                    user.setSubsyNames(subsyBaseService.getSubsyNamesByCodes(subsyCodes));
                    if(user.getUpdTime() == null) {
                        user.setTimeStr(DateUtil.formatDate(user.getCrtTime(), DateUtil.DATE_TIME_PATTERN));
                    } else {
                        user.setTimeStr(DateUtil.formatDate(user.getUpdTime(), DateUtil.DATE_TIME_PATTERN));
                    }
                }
        );
        return list;
    }

    @Override
    public Integer count(Map<String, Object> paramMap) {
        return mstInterUserBaseDao.count(paramMap);
    }

    @Override
    public void createUser(MstInterUserBaseEntity user) throws SystemException {
        if (user.getMobNum() == null) {
            throw new SystemException("手机号不能为空");
        }
        MstInterUserBaseEntity m1 = findByMobile(user.getMobNum());
        if (m1 != null) {
            throw new SystemException("当前手机号已存在");
        }
        MstInterUserBaseEntity m2 = mstInterUserBaseDao.findByUsername(user.getUserName());
        if (m2 != null) {
            throw new SystemException("当前用户名已存在");
        }
        PasswordHelper.encryptPassword(user);
        user.setInterUserCode(BizCodeGeneratorUtil.getUserCode(MST_INTER_USER_BASE));
        user.setPostnCode("PC001");
        user.setWebAcesFlg(true);
        user.setAppAcesFlg(true);
        user.setCrtTime(new Date());
        mstInterUserBaseDao.insert(user);
        inserUserSubsy(user);
        inserUserDtl(user);

    }

    private void inserUserDtl(MstInterUserBaseEntity user) {
        mstInterUserDtlDao.deleteByUserCode(user.getInterUserCode());
        MstInterUserDtlEntity mstInterUserDtlEntity = user.getMstInterUserDtlEntity();
        mstInterUserDtlEntity.setInterUserCode(user.getInterUserCode());
        if (StringUtils.hasText(mstInterUserDtlEntity.getBirthday())) {
            mstInterUserDtlEntity.setUserDob(DateUtil.getInt8Value(mstInterUserDtlEntity.getBirthday(), DateUtil.DATE_PATTERN));
        }
        mstInterUserDtlEntity.setCrtUserCode(user.getCrtUserCode() != null ? user.getCrtUserCode() : user.getUpdUserCode());
        mstInterUserDtlEntity.setCrtTime(new Date());
        mstInterUserDtlDao.insert(mstInterUserDtlEntity);
    }

    @Override
    public void updateUser(MstInterUserBaseEntity user) throws SystemException {
        if (user.getMobNum() == null) {
            throw new SystemException("手机号不能为空");
        }
        MstInterUserBaseEntity m = findByMobile(user.getMobNum());
        if (m != null && !m.getInterUserCode().equals(user.getInterUserCode())) {
            throw new SystemException("当前手机号已存在");
        }
        MstInterUserBaseEntity m2 = mstInterUserBaseDao.findByUsername(user.getUserName());
        if (m2 != null && !m2.getInterUserCode().equals(user.getInterUserCode())) {
            throw new SystemException("当前用户名已存在");
        }

        user.setUpdTime(new Date());
        mstInterUserBaseDao.updateUser(user);
        inserUserSubsy(user);
        inserUserDtl(user);
    }


    private void inserUserSubsy(MstInterUserBaseEntity user) throws SystemException {
        List<String> subsyCodeList = mstInterUserRollDao.getInterUserRollSubsyCodesByUserCode(user.getInterUserCode());
        String[] subsyCodes = user.getSubsyCodes().split(",");
        if(!CollectionUtils.isEmpty(subsyCodeList)) {
            if(subsyCodeList.size() > subsyCodes.length) {
                throw new SystemException("当前用户有其他会所角色未删除");
            }
        }

        mstInterUserBaseDao.deleteUserSubsyByUserCode(user.getInterUserCode());

        for (int i = 0; i < subsyCodes.length; i++) {
            String subsyCode = subsyCodes[i];
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("userCode", user.getInterUserCode());
            paramMap.put("subsyCode", subsyCode);
            if (i == 0) {
                paramMap.put("dfltSubsyFlg", 1);
            } else {
                paramMap.put("dfltSubsyFlg", 0);
            }
            paramMap.put("crtUser", "sysuser");
            mstInterUserBaseDao.inserUserSubsy(paramMap);
        }
    }

    @Override
    public void deleteUser(String interUserCode) {

    }

    @Override
    public void changePassword(String interUserCode, String newPassword) {
        MstInterUserBaseEntity user = findByCode(interUserCode);
        user.setUserPwd(newPassword);
        user.setVerNum(user.getVerNum());
        user.setUpdTime(new Date());
        PasswordHelper.encryptPassword(user);
        mstInterUserBaseDao.updateUser(user);
    }

    @Override
    public List<MstInterUserBaseEntity> findBySubsyCodes(String subsyCodes) {
        Map<String, Object> paraMap = new HashMap<>();
        if (!subsyCodes.contains(Constants.PLATFORM_SUBSY_CODE)) {
            paraMap.put("subsyCodeArray", subsyCodes.split(","));
        }
        return mstInterUserBaseDao.findBySubsyCodes(paraMap);
    }

    @Override
    public void validate(String interUserCode, String currentUserCode) {
        MstInterUserBaseEntity user = findByCode(interUserCode);
        if (user.getAppAcesFlg()) {
            user.setAppAcesFlg(false);
        } else {
            user.setAppAcesFlg(true);
        }
        user.setUpdTime(new Date());
        user.setUpdUserCode(currentUserCode);
        mstInterUserBaseDao.updateUser(user);
    }

    @Override
    public String generateInterUserForMmatron(MstInterUserBaseEntity mstInterUserBaseEntity, String[] mmatronServSpeciDescArray) throws SystemException {
        if (mstInterUserBaseEntity.getInterUserCode() == null) {
            createUser(mstInterUserBaseEntity);
        } else {
            updateUser(mstInterUserBaseEntity);
        }
        mstInterUserRollDao.deleteUserRollByUserCode(mstInterUserBaseEntity.getInterUserCode(), mstInterUserBaseEntity.getSubsyCodes());
        Map<String, Object> paramMap = new HashMap<>(5);
        paramMap.put("interUserCode", mstInterUserBaseEntity.getInterUserCode());
        paramMap.put("subsyCode", mstInterUserBaseEntity.getSubsyCodes());

        paramMap.put("crtTime", new Date());
        paramMap.put("crtUserCode", mstInterUserBaseEntity.getCrtUserCode());
        for (String s : mmatronServSpeciDescArray) {
            if (Constants.MMATRON_SERVER_TYPE_SUBSY.equals(s)) {
                paramMap.put("rollCode", "ROLL013");
                mstInterUserRollDao.insertUserRoll(paramMap);
            }
            if (Constants.MMATRON_SERVER_TYPE_HOME.equals(s)) {
                paramMap.put("rollCode", "ROLL017");
                mstInterUserRollDao.insertUserRoll(paramMap);
            }
        }

        return mstInterUserBaseEntity.getInterUserCode();
    }


    @Override
    public MstInterUserBaseEntity findByMobile(String mobNum) throws SystemException {
        if (StringUtil.isEmpty(mobNum)) {
            throw new SystemException("查找用户-手机号不能为空");
        }
        Map<String, Object> map = new HashMap<>(1);
        map.put("mobNum", mobNum);
        return mstInterUserBaseDao.findByMobile(map);
    }

    @Override
    public String hello() {
        return "Hello";
    }

//-- user-defined end --
}
