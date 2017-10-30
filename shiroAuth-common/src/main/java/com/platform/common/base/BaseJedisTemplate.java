package com.platform.common.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.*;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

public class BaseJedisTemplate<V, HK> {

    @Autowired
    private RedisTemplate<Serializable, Serializable> redisTemplate;

    @Resource(name = "redisTemplate")
    private ValueOperations<Object, V> valueOperations;

    @Resource(name = "redisTemplate")
    private ListOperations<Object, V> listOps;

    @Resource(name = "redisTemplate")
    private HashOperations<Object, HK, V> hashOps;

    public int delByKeys(final String[] keys) {
        return (Integer) this.redisTemplate.execute((RedisCallback) connection -> {
            int count = 0;
            for (String key : keys)
                count += connection
                        .del(new byte[][]{key.getBytes()})
                        .intValue();
            return Integer.valueOf(count);
        });
    }

    public Long incrByKey(final String keys, final long num) {
        return (Long) this.redisTemplate.execute((RedisCallback) connection -> connection.incrBy(keys.getBytes(), num));
    }

    public Long decrByKey(final String keys, final long num) {
        return (Long) this.redisTemplate.execute((RedisCallback) connection -> connection.decrBy(keys.getBytes(), num));
    }

    public Set<byte[]> getKeysLike(final String pattern) {
        return (Set) this.redisTemplate.execute((RedisCallback) connection -> connection.keys(pattern.getBytes()));
    }

    public void saveValue(String key, V value) {
        this.valueOperations.set(key, value);
    }

    public void saveValue(String key, V value, long offset) {
        this.valueOperations.set(key, value, offset);
    }

    public void saveValue(String key, V value, long timeout, TimeUnit unit) {
        this.valueOperations.set(key, value, timeout, unit);
    }

    public V getValueByKey(String key) {
        return this.valueOperations.get(key);
    }

    public int addListItem(String key, V value) {
        return this.listOps.leftPush(key, value).intValue();
    }

    public int removeListItem(String key, long count, V value) {
        return this.listOps.remove(key, count, value).intValue();
    }

    public int getListSize(String key) {
        return this.listOps.size(key).intValue();
    }

    public List<V> getListByKey(String key) {
        return this.listOps.range(key, 0L, -1L);
    }

    public List getListByKeyAndIndex(String key, long start, long end) {
        return this.listOps.range(key, start, end);
    }

    public void putHashItem(String key, HK hashKey, V value) {
        this.hashOps.put(key, hashKey, value);
    }

    public void removeHashItem(String key, HK[] hashKeys) {
        this.hashOps.delete(key, hashKeys);
    }

    public int getHashSize(String key) {
        return this.hashOps.size(key).intValue();
    }

    public HashMap<HK, V> getHashByKey(String key) {
        return (HashMap) this.hashOps.entries(key);
    }

    public List<V> getHashValuesByKey(String key) {
        return this.hashOps.values(key);
    }

    public Set<HK> getHashKeysByKey(String key) {
        return this.hashOps.keys(key);
    }

    public V getHashValueByKeyAndHashKey(String key, HK hashKey) {
        return this.hashOps.get(key, hashKey);
    }
}