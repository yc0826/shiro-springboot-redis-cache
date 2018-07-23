package com.shiro.auth.api.utils;

import com.shiro.auth.api.auth.entity.MstInterUserBaseEntity;
import com.shiro.auth.common.utils.PasswordEncryption;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

/**
 * @author YangChao
 */
public class PasswordHelper {


    public static void encryptPassword(MstInterUserBaseEntity user) {
        user.setSalt(new SecureRandomNumberGenerator().nextBytes().toHex());
        String newPassword = null;
        try {
            newPassword = PasswordEncryption.getEncryptedPassword(user.getUserPwd(), user.getSalt());
        } catch (NoSuchAlgorithmException | InvalidKeySpecException ignored) {
        }
        user.setUserPwd(newPassword);
    }


    public static void main(String[] args) throws InvalidKeySpecException, NoSuchAlgorithmException {
        System.out.println(PasswordEncryption.getEncryptedPassword("abc123", "f554198a7a2ac54ca43b1f11ad537c38"));
    }
}
