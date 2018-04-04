package com.babysky.management.config;//package com.babysky.management.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * @author YangChao
 */
@Configuration
@ImportResource({ "classpath:dubbo/*.xml" })
public class DubboConfig {
}
