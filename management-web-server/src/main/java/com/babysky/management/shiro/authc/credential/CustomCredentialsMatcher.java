package com.babysky.management.shiro.authc.credential;

import com.alibaba.dubbo.config.annotation.Reference;
import com.babysky.management.api.auth.entity.MstInterUserBaseEntity;
import com.babysky.management.api.auth.service.api.MstInterUserBaseService;
import com.babysky.management.common.utils.PasswordEncryption;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

/**
 * @author YangChao
 */
public class CustomCredentialsMatcher extends SimpleCredentialsMatcher {

    @Reference(version = "1.0.0",
            application = "${dubbo.application.id}",
            registry = "zookeeper://127.0.0.1:2181")
    private MstInterUserBaseService mstInterUserBaseService;

    @Override
    public boolean doCredentialsMatch(AuthenticationToken authcToken, AuthenticationInfo info) {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        MstInterUserBaseEntity user = mstInterUserBaseService.findByUsername(token.getUsername());

        String hash = null;
        try {
            hash = PasswordEncryption.getEncryptedPassword(new String(token.getPassword()), user.getSalt());
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            e.printStackTrace();
        }
        return user.getUserPwd().equals(hash);
    }

}
