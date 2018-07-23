package com.shiro.auth.shiro.filter;

import com.shiro.auth.common.utils.LoggerUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

class ShiroFilterUtils {
    private final static Class<? extends ShiroFilterUtils> CLAZZ = ShiroFilterUtils.class;

    /**
     * 是否是Ajax请求
     */
    static boolean isAjax(ServletRequest request) {
        return "XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request).getHeader("X-Requested-With"));
    }

    static boolean ajaxSessionStatus(ServletResponse response, String errorCode) {
        HttpServletResponse resp = (HttpServletResponse) response;
        LoggerUtils.debug(CLAZZ, "当前用户会话失效，并且是Ajax请求！");
        resp.setHeader("sessionstatus", errorCode);
        return Boolean.FALSE;
    }

}
