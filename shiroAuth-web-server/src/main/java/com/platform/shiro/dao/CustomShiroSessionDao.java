package com.platform.shiro.dao;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName: RedisServiceImpl
 */
@Repository("customShiroSessionDao")
public class CustomShiroSessionDao extends EnterpriseCacheSessionDAO {

    @Resource(name="redisTemplate")
    private RedisTemplate<String, Object> redisTemplate;

    private final String keyPrefix = "shiro_session_";

    /**
     * 创建session，保存到redis集群中
     */
    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = super.doCreate(session);
        BoundValueOperations<String, Object> sessionValueOperations = redisTemplate.boundValueOps(keyPrefix + sessionId.toString());
        sessionValueOperations.set(session);
        sessionValueOperations.expire(30, TimeUnit.MINUTES);

        return sessionId;
    }

    /**
     * 获取session
     * @param sessionId
     * @return
     */
    @Override
    protected Session doReadSession(Serializable sessionId) {
        Session session = super.doReadSession(sessionId);

        if(session == null){
            BoundValueOperations<String, Object> sessionValueOperations = redisTemplate.boundValueOps(keyPrefix + sessionId.toString());
            session = (Session) sessionValueOperations.get();
        }

        return session;
    }

    /**
     * 更新session
     * @param session
     */
    @Override
    protected void doUpdate(Session session) {
        super.doUpdate(session);

        BoundValueOperations<String, Object> sessionValueOperations = redisTemplate.boundValueOps(keyPrefix + session.getId().toString());
        sessionValueOperations.set(session);
        sessionValueOperations.expire(30, TimeUnit.MINUTES);
    }

    /**
     * 删除失效session
     */
    @Override
    protected void doDelete(Session session) {
        redisTemplate.delete(keyPrefix + session.getId().toString());
        super.doDelete(session);
    }

}
