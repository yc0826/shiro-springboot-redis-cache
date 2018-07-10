package com.babysky.management.web.controller.auth;

import com.babysky.management.api.auth.entity.CfgSysResoEntity;
import com.babysky.management.api.auth.service.api.CfgSysResoService;
import com.babysky.management.web.controller.base.BaseController;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

/**
 * @author YangChao
 */
@Controller
@SuppressWarnings("unchecked")
public class IndexController extends BaseController {

    @Resource
    private CfgSysResoService resourceService;


    @RequestMapping("/")
    public String index() {
        if (getCurrentUser() == null) {
            return "redirect:/login";
        }
        //判断商户号非空，直接返回主界面
        if (StringUtils.hasText(getCurrentUser().getSubsyCodes())) {
            return "redirect:/menus?parentResoCode=82";
        }
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/login";
    }

    @RequestMapping("/menus")
    public String menus(String parentResoCode) {
        Session session = SecurityUtils.getSubject().getSession();
        session.removeAttribute("resoCode");
        session.removeAttribute("childResoCode");

        Set<String> permissions = (Set<String>) session.getAttribute("permissions");
        List<CfgSysResoEntity> menus = resourceService.findMenus(permissions, parentResoCode);
        if (!CollectionUtils.isEmpty(menus)) {
            session.setAttribute("menus", menus);
        }

        return "main";
    }

    @RequestMapping("/uiTest")
    public String welcome() {
        return "abc";
    }

    @RequestMapping("/checkTest")
    public String check() {
        return "check";
    }


}
