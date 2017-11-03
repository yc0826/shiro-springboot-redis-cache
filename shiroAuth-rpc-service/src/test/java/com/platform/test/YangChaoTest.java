package com.platform.test;

import com.platform.api.auth.entity.User;
import com.platform.api.auth.service.ShiroSessionService;
import com.platform.api.auth.service.UserService;
import com.platform.dao.auth.IRoleDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试
@ContextConfiguration({"classpath:META-INF/spring/*.xml"})
public class YangChaoTest {

    @Autowired
    private UserService userService;

    @Autowired
    private ShiroSessionService redisCached;

    @Autowired
    private IRoleDao roleDao;

//    @Test
    public void test() {
        User user = new User();
        user.setOrganizationId(1L);
        user.setUsername("hello");
        user.setPassword("hello");
        userService.createUser(user);
    }

    @Test
    public void redisTest() throws Exception {
        roleDao.findResourceIdsByRoleIds(new Long[]{1L});
    }
}
