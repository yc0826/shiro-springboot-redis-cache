package com.platform.api.auth.service;


import com.platform.api.auth.entity.App;

import java.util.List;
import java.util.Map;

/**
 * 
* @ClassName: AppService 
* @Description: 应用
*
 */
public interface AppService {


    App createApp(App app);
    App updateApp(App app);
    void deleteApp(Long appId);

    App findOne(Long appId);
    List<App> findAll();

    List<App> findPage(Map<String, Object> p);
    
    /**
     * 根据appKey查找AppId
     * @param appKey
     */
    Long findAppIdByAppKey(String appKey);
}
