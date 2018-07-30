package com.shiro.auth.config;

import com.shiro.auth.shiro.authc.credential.CustomCredentialsMatcher;
import com.shiro.auth.shiro.cache.JedisManager;
import com.shiro.auth.shiro.cache.JedisShiroSessionRepository;
import com.shiro.auth.shiro.cache.impl.CustomShiroCacheManager;
import com.shiro.auth.shiro.cache.impl.JedisShiroCacheManager;
import com.shiro.auth.shiro.dao.CustomShiroSessionDAO;
import com.shiro.auth.shiro.filter.AccessControlFilter;
import com.shiro.auth.shiro.filter.KickoutSessionControlFilter;
import com.shiro.auth.shiro.filter.ServerFormAuthenticationFilter;
import com.shiro.auth.shiro.filter.SimpleFilter;
import com.shiro.auth.shiro.realm.UserRealm;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.web.filter.DelegatingFilterProxy;
import redis.clients.jedis.JedisPool;

import javax.servlet.Filter;
import java.util.Map;

/**
 * @author YangChao
 */
@Configuration
public class ShiroConfig {

    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
        filterRegistration.setFilter(new DelegatingFilterProxy("shiroFilter"));
        //  该值缺省为false,表示生命周期由SpringApplicationContext管理,设置为true则表示由ServletContainer管理
        filterRegistration.addInitParameter("targetFilterLifecycle", "true");
        filterRegistration.setEnabled(true);
        filterRegistration.addUrlPatterns("/*");
        return filterRegistration;
    }


    @Bean
    public FilterRegistrationBean shiroformAuthenticationFilterRegistration(ServerFormAuthenticationFilter formAuthenticationFilter) {
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean(formAuthenticationFilter);
        filterRegistration.setEnabled(false);
        return filterRegistration;
    }


    @Bean
    public FilterRegistrationBean shiroSimpleFilterRegistration(SimpleFilter simpleFilter) {
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean(simpleFilter);
        filterRegistration.setEnabled(false);
        return filterRegistration;
    }


    @Bean
    public FilterRegistrationBean shiroAccessControlFilterRegistration(AccessControlFilter accessControlFilter) {
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean(accessControlFilter);
        filterRegistration.setEnabled(false);
        return filterRegistration;
    }

    @Bean
    public FilterRegistrationBean shiroKickoutSessionControlFilterFilterRegistration(KickoutSessionControlFilter kickoutSessionControlFilter) {
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean(kickoutSessionControlFilter);
        filterRegistration.setEnabled(false);
        return filterRegistration;
    }

    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(JedisPool jedisPool) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor
                = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager(jedisPool));
        return authorizationAttributeSourceAdvisor;
    }



    @Bean
    public SimpleCookie sessionIdCookie() {
        SimpleCookie simpleCookie = new SimpleCookie();
        simpleCookie.setName("shiroAuth");
        simpleCookie.setHttpOnly(true);
        simpleCookie.setMaxAge(-1);
        return simpleCookie;
    }

    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    public JedisManager jedisManager(JedisPool jedisPool) {
        JedisManager jedisManager = new JedisManager();
        jedisManager.setJedisPool(jedisPool);
        return jedisManager;
    }

    @Bean
    public JedisShiroSessionRepository jedisShiroSessionRepository(JedisPool jedisPool) {
        JedisShiroSessionRepository jedisShiroSessionRepository = new JedisShiroSessionRepository();
        jedisShiroSessionRepository.setJedisManager(jedisManager(jedisPool));
        return jedisShiroSessionRepository;
    }

    @Bean
    public JedisShiroCacheManager jedisShiroCacheManager(JedisPool jedisPool) {
        JedisShiroCacheManager jedisShiroCacheManager = new JedisShiroCacheManager();
        jedisShiroCacheManager.setJedisManager(jedisManager(jedisPool));
        return jedisShiroCacheManager;
    }

    @Bean
    public CustomShiroCacheManager cacheManager(JedisPool jedisPool) {
        CustomShiroCacheManager cacheManager = new CustomShiroCacheManager();
        cacheManager.setShiroCacheManager(jedisShiroCacheManager(jedisPool));
        return cacheManager;
    }

    @Bean
    public CustomShiroSessionDAO customShiroSessionDAO(JedisPool jedisPool) {
        CustomShiroSessionDAO customShiroSessionDAO = new CustomShiroSessionDAO();
        customShiroSessionDAO.setShiroSessionRepository(jedisShiroSessionRepository(jedisPool));
        return customShiroSessionDAO;
    }

    @Bean
    public DefaultWebSessionManager sessionManager(JedisPool jedisPool) {
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        sessionManager.setSessionValidationInterval(1800000);
        sessionManager.setGlobalSessionTimeout(1800000);
        sessionManager.setSessionIdCookie(sessionIdCookie());
        sessionManager.setSessionDAO(customShiroSessionDAO(jedisPool));
        sessionManager.setDeleteInvalidSessions(true);
        return sessionManager;
    }

    @Bean
    public CustomCredentialsMatcher credentialsMatcher() {
        return new CustomCredentialsMatcher();
    }

    @Bean
    public UserRealm userRealm() {
        UserRealm userRealm = new UserRealm();
        userRealm.setCredentialsMatcher(credentialsMatcher());
        userRealm.setCachingEnabled(false);
        return userRealm;
    }

    @Bean
    public DefaultWebSecurityManager securityManager(JedisPool jedisPool) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(userRealm());
        securityManager.setSessionManager(sessionManager(jedisPool));
        securityManager.setCacheManager(cacheManager(jedisPool));
        return securityManager;
    }

    @Bean
    public ServerFormAuthenticationFilter formAuthenticationFilter() {
        ServerFormAuthenticationFilter formAuthenticationFilter = new ServerFormAuthenticationFilter();
        formAuthenticationFilter.setUsernameParam("username");
        formAuthenticationFilter.setPasswordParam("password");
        return formAuthenticationFilter;
    }

    @Bean
    public SimpleFilter simpleFilter() {
        return new SimpleFilter();
    }

    @Bean
    public AccessControlFilter accessControlFilter() {
        return new AccessControlFilter();
    }

    @Bean
    public KickoutSessionControlFilter kickoutSessionControlFilter(JedisPool jedisPool) {
        KickoutSessionControlFilter kickoutSessionControlFilter = new KickoutSessionControlFilter();
        kickoutSessionControlFilter.setCacheManager(cacheManager(jedisPool));
        return kickoutSessionControlFilter;
    }

    @Bean("shiroFilter")
    public ShiroFilterFactoryBean shiroFilterFactoryBean(JedisPool jedisPool) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager(jedisPool));
        shiroFilterFactoryBean.setLoginUrl("/login");
        Map<String, Filter> filterMap = shiroFilterFactoryBean.getFilters();
        filterMap.put("authc", formAuthenticationFilter());
        filterMap.put("accessControl", accessControlFilter());
        filterMap.put("simple", simpleFilter());
        filterMap.put("kickout", kickoutSessionControlFilter(jedisPool));

        Map<String, String> filterChainDefinitionMap = shiroFilterFactoryBean.getFilterChainDefinitionMap();

        filterChainDefinitionMap.put("/login", "authc");
        filterChainDefinitionMap.put("/logout", "logout");
        filterChainDefinitionMap.put("/static/**", "anon");
        filterChainDefinitionMap.put("/common/**", "anon");
        filterChainDefinitionMap.put("/**", "kickout, accessControl,simple");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }


    /**
     * 下面的代码是添加注解支持
     */
    @Bean
    @DependsOn("lifecycleBeanPostProcessor")
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();

        // 强制使用cglib，防止重复代理和可能引起代理出错的问题
        // https://zhuanlan.zhihu.com/p/29161098
        defaultAdvisorAutoProxyCreator.setProxyTargetClass(true);
        return defaultAdvisorAutoProxyCreator;
    }



}
