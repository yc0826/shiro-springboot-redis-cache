package com.shiro.auth.api.auth.service.api;


import com.shiro.auth.api.auth.entity.CfgSysResoEntity;

import java.util.List;
import java.util.Set;

public interface CfgSysResoService {


    List<CfgSysResoEntity> findMenus(Set<String> permissions);

    List<CfgSysResoEntity> findAll();


    CfgSysResoEntity findByCode(String resoCode);

    void createResource(CfgSysResoEntity resource);

    void updateResource(CfgSysResoEntity resource);

    void deleteResource(String resoCode);

    Set<String> findPermissions(Set<String> resoCodes);

    Set<CfgSysResoEntity> findResoSetByRollCode(String rollCode);

    List<CfgSysResoEntity> findModule(Set<String> permissions);

    List<CfgSysResoEntity> findMenus(Set<String> permissions, String resCode);

    String findParentCodeByChildUrl(String url);
}
