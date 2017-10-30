package com.platform.shiro.security.remote;

import org.apache.shiro.session.Session;

import java.io.Serializable;

public interface RemoteServiceInterface {
    Session getSession(String paramString, Serializable paramSerializable);

    Serializable createSession(Session paramSession);

    void updateSession(String paramString, Session paramSession);

    void deleteSession(String paramString, Session paramSession);

    PermissionContext getPermissions(String paramString1, String paramString2);
}
