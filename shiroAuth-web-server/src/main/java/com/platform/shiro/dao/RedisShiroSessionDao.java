package com.platform.shiro.dao;

import com.platform.api.auth.service.RedisService;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.CachingSessionDAO;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

/**
 *
 */
public class RedisShiroSessionDao extends CachingSessionDAO {

    private String sessionprefix = "ss-";

    private RedisService redisDao;

    @Override
    public void update(Session session) throws UnknownSessionException {
        if (session instanceof ValidatingSession && !((ValidatingSession) session).isValid()) {
            return; //如果会话过期/停止 没必要再更新�?
        }
        try {
            redisDao.updateCached(session.getId().toString(), session);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Session session) {
        try {
            redisDao.deleteCached(session.getId().toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public Collection<Session> getActiveSessions() {
        String keys = sessionprefix + "*";
        Set<Session> list = null;
        try {
            list = (Set<Session>) redisDao.getShiroSessionByKeys(keys);
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = session.getId();
        try {
            super.assignSessionId(session, sessionprefix + super.generateSessionId(session));
            update(session);
            sessionId = session.getId();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sessionId;
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
        Session session = null;
        try {
            session = (Session) redisDao.getCached(sessionId.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return session;
    }

    public String getSessionprefix() {
        return sessionprefix;
    }

    public void setSessionprefix(String sessionprefix) {
        this.sessionprefix = sessionprefix;
    }

    @Override
    protected void doUpdate(Session session) {
        if (session instanceof ValidatingSession && !((ValidatingSession) session).isValid()) {
            return; //如果会话过期/停止 没必要再更新�?
        }
        update(session);
    }

    @Override
    protected void doDelete(Session session) {
        delete(session);
    }

    public RedisService getCached() {
        return redisDao;
    }

    public void setCached(RedisService cached) {
        this.redisDao = cached;
    }

}
