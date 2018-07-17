package com.babysky.management.web.test;


import com.alibaba.dubbo.config.annotation.Reference;
import com.babysky.management.api.auth.service.api.MstInterUserBaseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class DubboTest {

    @Reference(version = "1.0.0",
            application = "${dubbo.application.id}",
            registry = "zookeeper://127.0.0.1:2181")
    private MstInterUserBaseService mstInterUserBaseService;



    @Test
    public void test(){
        mstInterUserBaseService.hello();
    }


}
