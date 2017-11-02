package com.platform.test;

import com.platform.api.auth.entity.Role;
import com.platform.api.auth.service.RoleService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试
@ContextConfiguration({"classpath:spring/*.xml"})
public class YangChaoTest {

    @Autowired
    private RoleService roleService;



    @Test
    public void 测试() {
        Role role = roleService.findOne(1L);
        roleService.updateRole(role);
    }
}
