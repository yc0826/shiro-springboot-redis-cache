package com.platform.web.controller;

import com.platform.api.auth.service.AuthorizationService;
import com.platform.api.auth.service.OrganizationService;
import com.platform.api.auth.service.ResourceService;
import com.platform.common.Constants;
import com.platform.api.auth.entity.Organization;
import com.platform.api.auth.entity.Resource;
import com.platform.api.auth.entity.User;
import com.platform.web.bind.annotation.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @ClassName: IndexController
 * @Description: 主页
 */
@Controller
public class IndexController {

    @Autowired
    private ResourceService resourceService;
    @Autowired
    private AuthorizationService authorizationService;
    @Autowired
    private OrganizationService organizationService;

    @RequestMapping("/")
    public String index(@CurrentUser User loginUser, Model model) {
        Set<String> permissions = authorizationService.findPermissions(Constants.SERVER_APP_KEY, loginUser.getUsername());
        List<Resource> menus = resourceService.findMenus(permissions);
        model.addAttribute("menus", menus);

        Organization org = organizationService.findOne(loginUser.getOrganizationId());
        //判断商户号非空，直接返回主界面?
        if (org.getStoreId() != null && !org.getStoreId().equals("")) {
            return "index";
        }
        //商户号为空，ID=1为集团账号初始化
        if (org.getId() == 1) {
            model.addAttribute("url", "http://localhost/storeManager/store/configOne");
            return "common/forward";
        }
        //商户号为空，门店初始界面
        model.addAttribute("url", "http://localhost/storeManager/store/configStoreOne");
        return "common/forward";
    }

    @RequestMapping("/menus")
    public String menus(Model model, @RequestParam(value = "pid") Long pid) {

        List<Resource> resourceList = new ArrayList<>();
        for (Resource resource : resourceService.findAll()) {
            if (resource.getParentId().equals(pid)) {
                resourceList.add(resource);
            }
        }
        model.addAttribute("menus", resourceList);
        return "common/menus";
    }

    @RequestMapping("/iframeAutoHeight")
    public String iframeAutoHeight() {
        return "common/autoFrameHeight";
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }


}
