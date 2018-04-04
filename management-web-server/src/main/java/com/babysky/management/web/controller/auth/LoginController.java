package com.babysky.management.web.controller.auth;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 */
@Controller
public class LoginController {


    @RequestMapping(value = "/login")
    public String showLoginForm(HttpServletRequest req, Model model) {
        return doLogin(req, model);
    }

    private String doLogin(HttpServletRequest req, Model model) {
        String exceptionClassName = (String) req.getAttribute("shiroLoginFailure");
        String error = null;
        if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
            error = "账号不存在";
        } else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
            error = "用户名/密码错误";
        } else if (LockedAccountException.class.getName().equals(exceptionClassName)) {
            error = "账号被锁定";
        } else if (AuthenticationException.class.getName().equals(exceptionClassName)) {
            error = "该账号未经授权，请联系管理员";
        } else if (exceptionClassName != null) {
            error = "其他错误：" + exceptionClassName;
        }
        Subject subject = SecurityUtils.getSubject();
        if(subject != null && subject.getPrincipal() != null) {
            return "redirect:/";
        } else {
            model.addAttribute("error", error);
            String msg = (String) req.getAttribute("msg");
            model.addAttribute("msg", msg);
            return "login";
        }

    }

    private void doLogout() {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null) {
            subject.logout();
        }
    }


}
