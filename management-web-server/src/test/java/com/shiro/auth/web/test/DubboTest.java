package com.shiro.auth.web.test;


import com.alibaba.dubbo.config.annotation.Reference;
import com.shiro.auth.api.auth.service.api.MstInterUserBaseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class DubboTest {

    @Reference
    private MstInterUserBaseService mstInterUserBaseService;



    @Test
    public void test(){
        mstInterUserBaseService.hello();
    }


}
