package com.babysky.management.web.controller.auth;

import com.alibaba.dubbo.config.annotation.Reference;
import com.babysky.management.api.auth.entity.CfgSysResoEntity;
import com.babysky.management.api.auth.service.api.CfgSysResoService;
import com.babysky.management.web.controller.base.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @author YangChao
 */
@Controller
@RequestMapping("/resource")
public class ResourceController extends BaseController {

    @Reference(version = "1.0.0",
            application = "${dubbo.application.id}",
            registry = "zookeeper://127.0.0.1:2181")
    private CfgSysResoService resourceService;


    @RequiresPermissions("resource:view")
    @RequestMapping()
    public String list(Model model) {
        model.addAttribute("resourceList", resourceService.findAll());
        return "auth/resource/list";
    }

    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/{parentResoCode}/appendChild", method = RequestMethod.GET)
    public String showAppendChildForm(@PathVariable("parentResoCode") String parentResoCode, Model model) {
        CfgSysResoEntity parent = resourceService.findByCode(parentResoCode);
        model.addAttribute("parent", parent);
        CfgSysResoEntity child = new CfgSysResoEntity();
        child.setParentResoCode(parentResoCode);
        child.setParentResoCodes(parent.makeSelfAsParentCodes());
        model.addAttribute("resource", child);
        model.addAttribute("op", "新 增子节点");
        return "auth/resource/edit";
    }

    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/{parentResoCode}/appendChild", method = RequestMethod.POST)
    public String create(CfgSysResoEntity resource, RedirectAttributes redirectAttributes) {
        resource.setCrtUserCode(getCurrentUserCode());
        resourceService.createResource(resource);
        redirectAttributes.addFlashAttribute("msg", "新 增子节点成功");
        return "redirect:/resource";
    }

    @RequiresPermissions("resource:update")
    @RequestMapping(value = "/{resoCode}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("resoCode") String resoCode, Model model) {
        model.addAttribute("resource", resourceService.findByCode(resoCode));
        model.addAttribute("op", "修改");
        return "auth/resource/edit";
    }

    @RequiresPermissions("resource:update")
    @RequestMapping(value = "/{resoCode}/update", method = RequestMethod.POST)
    public String update(CfgSysResoEntity resource, RedirectAttributes redirectAttributes) {
        resource.setUpdUserCode(getCurrentUserCode());
        resourceService.updateResource(resource);
        redirectAttributes.addFlashAttribute("msg", "修改成功");
        return "redirect:/resource";
    }

    @RequiresPermissions("resource:delete")
    @RequestMapping(value = "/{resoCode}/delete", method = RequestMethod.GET)
    public String delete(@PathVariable("resoCode") String resoCode, RedirectAttributes redirectAttributes) {
        resourceService.deleteResource(resoCode);
        redirectAttributes.addFlashAttribute("msg", "删除成功");
        return "redirect:/resource";
    }


}
