package com.shiro.auth.api.auth.service.api;


import com.shiro.auth.api.auth.dto.InterUserRollDto;
import com.shiro.auth.api.auth.entity.MstInterUserRollEntity;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author YangChao
 */
public interface MstInterUserRollService {


    void deleteAuthorization(String userCodeAndSubsyCode);


    List<InterUserRollDto> findPage(Map<String, Object> paramMap);

    Integer count(Map<String, Object> paramMap);

    void createAuthorization(MstInterUserRollEntity authorization);

    void updateAuthorization(String userCodeAndSubsyCode, MstInterUserRollEntity authorization);

    Set<String> findPermissions(String userName);

    Set<String> findRoles(String username);

    MstInterUserRollEntity findByUserCodeAndSubsyCode(String userCodeAndSubsyCode);




}
