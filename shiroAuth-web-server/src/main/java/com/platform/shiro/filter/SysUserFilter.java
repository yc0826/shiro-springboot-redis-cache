package com.platform.shiro.filter;

import com.alibaba.fastjson.JSONObject;
import com.platform.api.auth.service.UserService;
import com.platform.common.Constants;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName: SysUserFilter
 */
public class SysUserFilter extends AccessControlFilter {

    @Autowired
    private UserService userService;

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        if (isLoginRequest(request, response)) {// &&// isEnabled()
            return Boolean.TRUE;
        }
        if (isAjax(request)) {// ajax请求
            Map<String, String> resultMap = new HashMap<>();
            resultMap.put("login_status", "300");
            resultMap.put("message",
                    "\u5F53\u524D\u7528\u6237\u6CA1\u6709\u767B\u5F55\uFF01");// 当前用户没有登录！
            out(response, resultMap);
        }
        return Boolean.FALSE;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        // 保存Request和Response 到登录后的链接
        saveRequestAndRedirectToLogin(request, response);
        return Boolean.FALSE;
    }


    /**
     * 判断是否是ajax请求
     */
    private boolean isAjax(ServletRequest request) {
        String header = ((HttpServletRequest) request).getHeader("X-Requested-With");
        if ("XMLHttpRequest".equalsIgnoreCase(header)) {
            return Boolean.TRUE;
        }
        return Boolean.FALSE;
    }

    private void out(ServletResponse response, Map<String, String> resultMap) {
        PrintWriter out = null;
        try {
            response.setCharacterEncoding("UTF-8");//设置编码
            response.setContentType("application/json");//设置返回类型
            out = response.getWriter();
            out.println(JSONObject.toJSONString(resultMap));//输出
        } catch (Exception ignored) {
        } finally {
            if (null != out) {
                out.flush();
                out.close();
            }
        }
    }

    @Override
    public boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        request.setAttribute(Constants.CURRENT_USER, userService.findByUsername(username));
        return Boolean.TRUE;
    }
}
