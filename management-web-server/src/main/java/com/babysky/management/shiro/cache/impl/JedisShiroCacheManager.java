package com.babysky.management.shiro.cache.impl;

import com.babysky.management.shiro.cache.JedisManager;
import com.babysky.management.shiro.cache.JedisShiroCache;
import com.babysky.management.shiro.cache.ShiroCacheManager;
import org.apache.shiro.cache.Cache;

/**
 *
 * @author YangChao
 */
public class JedisShiroCacheManager implements ShiroCacheManager {

    private JedisManager jedisManager;

    @Override
    public <K, V> Cache<K, V> getCache(String name) {
        return new JedisShiroCache<>(name, getJedisManager());
    }

    @Override
    public void destroy() {
    	//如果和其他系统，或者应用在一起就不能关闭
    	//getJedisManager().getJedis().shutdown();
    }

    public JedisManager getJedisManager() {
        return jedisManager;
    }

    public void setJedisManager(JedisManager jedisManager) {
        this.jedisManager = jedisManager;
    }
}
