package com.platform.api.auth.service;

import java.util.Set;

/**
 * @ClassName: RedisService
 */
public interface RedisService {
    /**
     * 删除 缓存
     * @throws Exception
     */
    String deleteCached(String key) throws Exception;

    /**
     * 更新 缓存
     */
    Object updateCached(String key, Object value) throws Exception;

    /**
     * 获取缓存
     */
    Object getCached(String key) throws Exception;

    Set getShiroSessionByKeys(String keys) throws Exception;


}
