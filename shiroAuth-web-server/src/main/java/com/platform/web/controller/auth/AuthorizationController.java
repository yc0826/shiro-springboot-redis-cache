package com.platform.web.controller.auth;

import com.platform.api.auth.entity.Authorization;
import com.platform.api.auth.service.AppService;
import com.platform.api.auth.service.AuthorizationService;
import com.platform.api.auth.service.RoleService;
import com.platform.api.auth.service.UserService;
import com.platform.web.utils.PageUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: AuthorizationController
 * @Description: 权限
 */
@Controller
@RequestMapping("/authorization")
public class AuthorizationController {

    @Autowired
    private AuthorizationService authorizationService;
    @Autowired
    private UserService userService;
    @Autowired
    private AppService appService;
    @Autowired
    private RoleService roleService;

    @RequiresPermissions("authorization:view")
    @RequestMapping()
    public String list(Model model, HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<>();
        int pageNo = 1;
        if(StringUtils.hasText(request.getParameter("pageNo"))) {
            pageNo = Integer.parseInt(request.getParameter("pageNo"));
        }
        paramMap.put("start" ,PageUtil.initPageParmMap(pageNo));
        paramMap.put("size" ,PageUtil.pageSize);
        List<Authorization> authorizationList = authorizationService.findPage(paramMap);
        Integer count = authorizationService.count(paramMap);
        model.addAttribute("authorizationList", authorizationList);
        model.addAttribute("pageCount", PageUtil.initPageCount(count));
        model.addAttribute("pageIndex", pageNo);
        model.addAttribute("uri", request.getRequestURI());
        return "auth/authorization/list";
    }

    @RequiresPermissions("authorization:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {
        setCommonData(model);
        Authorization authorization = new Authorization();
        model.addAttribute("authorization", authorization);
        model.addAttribute("op", "新增");
        return "auth/authorization/edit";
    }

    @RequiresPermissions("authorization:create")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(Authorization authorization, RedirectAttributes redirectAttributes) {
        authorizationService.createAuthorization(authorization);
        redirectAttributes.addFlashAttribute("msg", "新增成功");
        return "redirect:/authorization";
    }

    @RequiresPermissions("authorization:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        setCommonData(model);
        model.addAttribute("authorization", authorizationService.findOne(id));
        model.addAttribute("op", "修改");
        return "auth/authorization/edit";
    }

    @RequiresPermissions("authorization:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String update(Authorization authorization, RedirectAttributes redirectAttributes) {
        authorizationService.updateAuthorization(authorization);
        redirectAttributes.addFlashAttribute("msg", "修改成功");
        return "redirect:/authorization";
    }

    @RequiresPermissions("authorization:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public String showDeleteForm(@PathVariable("id") Long id, Model model) {
        setCommonData(model);
        model.addAttribute("authorization", authorizationService.findOne(id));
        model.addAttribute("op", "删除");
        return "auth/authorization/edit";
    }

    @RequiresPermissions("authorization:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        authorizationService.deleteAuthorization(id);
        redirectAttributes.addFlashAttribute("msg", "删除成功");
        return "redirect:/authorization";
    }

    private void setCommonData(Model model) {
        model.addAttribute("userList", userService.findAll());
        model.addAttribute("roleList", roleService.findAll());
        model.addAttribute("appList", appService.findAll());
    }


}
