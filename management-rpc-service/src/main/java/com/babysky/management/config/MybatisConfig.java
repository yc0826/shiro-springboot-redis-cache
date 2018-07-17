package com.babysky.management.config;

import com.babysky.management.common.annotation.MyBatisRepository;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author YangChao
 */
@Configuration
@MapperScan(value = "com.babysky.management.repo", annotationClass = MyBatisRepository.class)
public class MybatisConfig {
}
