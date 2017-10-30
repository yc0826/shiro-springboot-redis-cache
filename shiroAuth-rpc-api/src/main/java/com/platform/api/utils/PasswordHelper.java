package com.platform.api.utils;

import com.platform.api.auth.entity.User;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * @ClassName: PasswordHelper
 * @Description: 密码助手
 */
public class PasswordHelper {


    public static void encryptPassword(User user) {

        user.setSalt(new SecureRandomNumberGenerator().nextBytes().toHex());

        String newPassword = new SimpleHash(
                "md5",
                user.getPassword(),
                ByteSource.Util.bytes(user.getCredentialsSalt()),
                2).toHex();
        user.setPassword(newPassword);
    }

    public static void main(String[] args) {
        PasswordHelper ph = new PasswordHelper();
        User u = new User();
        u.setUsername("admin");
        u.setPassword("admin");
        ph.encryptPassword(u);
    }
}
