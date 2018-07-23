package com.shiro.auth.config;

import com.alibaba.dubbo.config.ConsumerConfig;
import com.alibaba.dubbo.config.annotation.Reference;
import com.shiro.auth.api.auth.service.api.CfgSysResoService;
import com.shiro.auth.api.auth.service.api.MstInterUserBaseService;
import com.shiro.auth.api.auth.service.api.MstRollBaseService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author YangChao
 */
@Configuration
public class DubboConfig {

    @Reference
    private MstRollBaseService roleService;
    @Reference
    private CfgSysResoService resourceService;
    @Reference
    private MstInterUserBaseService userService;

    @Bean
    public MstRollBaseService getRoleService() {
        return roleService;
    }

    @Bean
    public CfgSysResoService getResourceService() {
        return resourceService;
    }

    @Bean
    public MstInterUserBaseService getUserService() {
        return userService;
    }

    @Bean
    public ConsumerConfig consumerConfig() {
        ConsumerConfig consumerConfig = new ConsumerConfig();
        consumerConfig.setTimeout(30000);
        return consumerConfig;
    }
}
