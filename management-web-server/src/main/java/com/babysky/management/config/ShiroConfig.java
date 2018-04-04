package com.babysky.management.config;

import com.babysky.management.shiro.filter.AccessControlFilter;
import com.babysky.management.shiro.filter.KickoutSessionControlFilter;
import com.babysky.management.shiro.filter.ServerFormAuthenticationFilter;
import com.babysky.management.shiro.filter.SimpleFilter;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.filter.DelegatingFilterProxy;

/**
 * @author YangChao
 */
@Configuration
@ImportResource({"classpath:shiro/*.xml"})
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
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor
                = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

//
//
//    @Bean
//    public SimpleCookie sessionIdCookie() {
//        SimpleCookie simpleCookie = new SimpleCookie();
//        simpleCookie.setName("babysky");
//        simpleCookie.setHttpOnly(true);
//        simpleCookie.setMaxAge(-1);
//        return simpleCookie;
//    }
//
//    @Bean
//    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
//        return new LifecycleBeanPostProcessor();
//    }
//
//    @Bean
//    public JedisManager jedisManager() {
//        JedisManager jedisManager = new JedisManager();
//        jedisManager.setJedisPool( jedisPool());
//        return jedisManager;
//    }
//
//    @Bean
//    public JedisShiroSessionRepository jedisShiroSessionRepository() {
//        JedisShiroSessionRepository jedisShiroSessionRepository = new JedisShiroSessionRepository();
//        jedisShiroSessionRepository.setJedisManager(jedisManager());
//        return jedisShiroSessionRepository;
//    }
//
//    @Bean
//    public JedisShiroCacheManager jedisShiroCacheManager() {
//        JedisShiroCacheManager jedisShiroCacheManager = new JedisShiroCacheManager();
//        jedisShiroCacheManager.setJedisManager(jedisManager());
//        return jedisShiroCacheManager;
//    }
//
//    @Bean
//    public CustomShiroCacheManager cacheManager() {
//        CustomShiroCacheManager cacheManager = new CustomShiroCacheManager();
//        cacheManager.setShiroCacheManager(jedisShiroCacheManager());
//        return cacheManager;
//    }
//
//    @Bean
//    public CustomShiroSessionDAO customShiroSessionDAO() {
//        CustomShiroSessionDAO customShiroSessionDAO = new CustomShiroSessionDAO();
//        customShiroSessionDAO.setShiroSessionRepository(jedisShiroSessionRepository());
//        return customShiroSessionDAO;
//    }
//
//    @Bean
//    public DefaultWebSessionManager sessionManager() {
//        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
//        sessionManager.setSessionValidationInterval(1800000);
//        sessionManager.setGlobalSessionTimeout(1800000);
//        sessionManager.setSessionIdCookie(sessionIdCookie());
//        sessionManager.setSessionDAO(customShiroSessionDAO());
//        sessionManager.setDeleteInvalidSessions(true);
//        return sessionManager;
//    }
//
//    @Bean
//    public CustomCredentialsMatcher credentialsMatcher() {
//        return new CustomCredentialsMatcher();
//    }
//
//    @Bean
//    public UserRealm userRealm() {
//        UserRealm userRealm = new UserRealm();
//        userRealm.setCredentialsMatcher(credentialsMatcher());
//        userRealm.setCachingEnabled(false);
//        return userRealm;
//    }
//
//    @Bean
//    public DefaultWebSecurityManager securityManager() {
//        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
//        securityManager.setRealm(userRealm());
//        securityManager.setSessionManager(sessionManager());
//        securityManager.setCacheManager(cacheManager());
//        return securityManager;
//    }
//
//    @Bean
//    public ServerFormAuthenticationFilter formAuthenticationFilter() {
//        ServerFormAuthenticationFilter formAuthenticationFilter = new ServerFormAuthenticationFilter();
//        formAuthenticationFilter.setUsernameParam("username");
//        formAuthenticationFilter.setPasswordParam("password");
//        return formAuthenticationFilter;
//    }
//
//    @Bean
//    public SimpleFilter simpleFilter() {
//        return new SimpleFilter();
//    }
//
//    @Bean
//    public AccessControlFilter accessControlFilter() {
//        return new AccessControlFilter();
//    }
//
//    @Bean("shiroFilter")
//    public ShiroFilterFactoryBean shiroFilterFactoryBean() {
//        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
//        shiroFilterFactoryBean.setSecurityManager(securityManager());
//        shiroFilterFactoryBean.setLoginUrl("/login");
//        Map<String, Filter> filterMap = shiroFilterFactoryBean.getFilters();
//        filterMap.put("authc", formAuthenticationFilter());
//        filterMap.put("accessControl", accessControlFilter());
//        filterMap.put("simple", simpleFilter());
//
//        Map<String, String> filterChainDefinitionMap = shiroFilterFactoryBean.getFilterChainDefinitionMap();
//
//        filterChainDefinitionMap.put("/login", "authc");
//        filterChainDefinitionMap.put("/logout", "logout");
//        filterChainDefinitionMap.put("/static/**", "anon");
//        filterChainDefinitionMap.put("/common/**", "anon");
//        filterChainDefinitionMap.put("/**", "accessControl,simple");
//        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
//        return shiroFilterFactoryBean;
//    }
//
//


}
