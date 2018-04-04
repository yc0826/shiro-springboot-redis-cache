package com.babysky.management.repo.auth;

import com.babysky.management.api.auth.dto.InterUserDto;
import com.babysky.management.api.auth.entity.MstInterUserBaseEntity;
import com.babysky.management.common.annotation.MyBatisRepository;

import java.util.List;
import java.util.Map;

/**
 * @author YangChao
 */
@MyBatisRepository
public interface IMstInterUserBaseDao {

    MstInterUserBaseEntity findByCode(String userCode);

    MstInterUserBaseEntity findByUsername(String username);

    List<InterUserDto> findPage(Map<String, Object> paramMap);

    Integer count(Map<String, Object> paramMap);

    /**
     * 根据用户code获取当前用户所有的会所code集合
     * @param interUserCode
     * @return
     */
    String findUserSubyCodesByUserCode(String interUserCode);

    List<MstInterUserBaseEntity> findBySubsyCodes(Map<String, Object> subsyCodeArray);

    List<MstInterUserBaseEntity> findAll();

    void insert(MstInterUserBaseEntity user);

    void inserUserSubsy(Map<String, Object> map);

    void updateUser(MstInterUserBaseEntity user);

    void deleteUserSubsyByUserCode(String interUserCode);


    MstInterUserBaseEntity findByMobile(Map map);

    Integer querySameMobileCount(String mobNum);
}