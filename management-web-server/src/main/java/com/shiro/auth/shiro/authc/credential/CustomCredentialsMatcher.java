package com.shiro.auth.shiro.authc.credential;

import com.alibaba.dubbo.config.annotation.Reference;
import com.shiro.auth.api.auth.entity.MstInterUserBaseEntity;
import com.shiro.auth.api.auth.service.api.MstInterUserBaseService;
import com.shiro.auth.common.utils.PasswordEncryption;
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

    @Reference
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
