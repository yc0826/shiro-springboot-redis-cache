package com.shiro.auth.web.controller.auth;

import com.alibaba.dubbo.config.annotation.Reference;
import com.shiro.auth.api.auth.entity.MstRollBaseEntity;
import com.shiro.auth.api.auth.service.api.CfgSysResoService;
import com.shiro.auth.api.auth.service.api.MstRollBaseService;
import com.shiro.auth.common.utils.DataTableRequest;
import com.shiro.auth.common.utils.DataTableResponse;
import com.shiro.auth.common.utils.PageInfo;
import com.shiro.auth.common.utils.PaginationResult;
import com.shiro.auth.web.controller.base.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author YangChao
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

    @Reference
    private MstRollBaseService roleService;

    @Reference
    private CfgSysResoService resourceService;

    @RequiresPermissions("role:view")
    @RequestMapping()
    public String list() {
        return "auth/role/list";
    }

    @RequiresPermissions("role:view")
    @RequestMapping("/getRoleListData")
    @ResponseBody
    public DataTableResponse<MstRollBaseEntity> getRoleListData(DataTableRequest dataTable) {
        PageInfo pageInfo = new PageInfo(dataTable.getCurrentPage(), dataTable.getiDisplayLength());
        Map<String, Object> paramMap = new HashMap<>(2);
        paramMap.put("start" ,(pageInfo.getPage() - 1) * pageInfo.getRows());
        paramMap.put("size" ,PAGE_SIZE);
        List<MstRollBaseEntity> roleList = roleService.findPage(paramMap);
        Integer count = roleService.count(paramMap);
        pageInfo.setTotal(count);
        PaginationResult<MstRollBaseEntity> result = new PaginationResult<>(roleList, pageInfo);
        return new DataTableResponse<>(dataTable.getsEcho(), result);
    }

    @RequiresPermissions("role:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {
        setCommonData(model);
        model.addAttribute("role", new MstRollBaseEntity());
        model.addAttribute("op", "新 增");
        return "auth/role/edit";
    }

    @RequiresPermissions("role:create")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> create(MstRollBaseEntity role) {
        Map<String, Object> resultMap = new HashMap<>();
        role.setCrtUserCode(getCurrentUserCode());
        resultMap.put("status", 200);
        try {
            roleService.createRole(role);
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("errorMsg", e.getMessage());
        }
        return resultMap;
    }

    @RequiresPermissions("role:update")
    @RequestMapping(value = "/{rollCode}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("rollCode") String rollCode, Model model) {
        setCommonData(model);
        model.addAttribute("role", roleService.findByCode(rollCode));
        model.addAttribute("op", "修改");
        return "auth/role/edit";
    }

    @RequiresPermissions("role:update")
    @RequestMapping(value = "/{rollCode}/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> update(MstRollBaseEntity role, @PathVariable("rollCode") String rollCode) {
        Map<String, Object> resultMap = new HashMap<>(3);
        resultMap.put("status", 200);
        role.setRollCode(rollCode);
        role.setUpdUserCode(getCurrentUserCode());
        role.setCrtUserCode(getCurrentUserCode());
        try {
            roleService.updateRole(role);
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("errorMsg", e.getMessage());
        }
        return resultMap;
    }


    @RequiresPermissions("role:delete")
    @RequestMapping(value = "/{rollCode}/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("rollCode") String rollCode) {
        Map<String, Object> paramMap = new HashMap<>(3);
        paramMap.put("status",  200);
        try {
            roleService.deleteRoleByCode(rollCode);
        } catch (Exception e) {
            paramMap.put("status",  500);
            paramMap.put("errorMsg", "删除失败");
        }
        return paramMap;
    }

    private void setCommonData(Model model) {
        model.addAttribute("resourceList", resourceService.findAll());
    }

}
