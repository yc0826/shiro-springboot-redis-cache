package com.babysky.management.web.controller.auth;

import com.alibaba.dubbo.config.annotation.Reference;
import com.babysky.management.api.auth.dto.InterUserRollDto;
import com.babysky.management.api.auth.entity.MstInterUserRollEntity;
import com.babysky.management.api.auth.service.api.MstInterUserBaseService;
import com.babysky.management.api.auth.service.api.MstInterUserRollService;
import com.babysky.management.api.auth.service.api.MstRollBaseService;
import com.babysky.management.common.Constants;
import com.babysky.management.common.utils.DataTableRequest;
import com.babysky.management.common.utils.DataTableResponse;
import com.babysky.management.common.utils.PageInfo;
import com.babysky.management.common.utils.PaginationResult;
import com.babysky.management.web.controller.base.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.util.StringUtils;
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
@RequestMapping("/authorization")
public class AuthorizationController extends BaseController {

    @Reference
    private MstInterUserRollService authorizationService;
    @Reference
    private MstInterUserBaseService userService;
    @Reference
    private MstRollBaseService roleService;

    @RequiresPermissions("authorization:view")
    @RequestMapping()
    public String list(Model model) {
        setCommonData(model);
        return "auth/authorization/list";
    }

    @RequiresPermissions("authorization:view")
    @RequestMapping("/getAuthorizationListData")
    @ResponseBody
    public DataTableResponse<InterUserRollDto> getAuthorizationListData(DataTableRequest dataTable, InterUserRollDto interUserRollDto) {
        PageInfo pageInfo = new PageInfo(dataTable.getCurrentPage(), dataTable.getiDisplayLength());
        Map<String, Object> paramMap = new HashMap<>(8);
        paramMap.put("start", (pageInfo.getPage() - 1) * pageInfo.getRows());
        paramMap.put("size", PAGE_SIZE);
        if (StringUtils.hasText(interUserRollDto.getMobile())) {
            paramMap.put("mobile", interUserRollDto.getMobile());
        }
        if (StringUtils.hasText(interUserRollDto.getName())) {
            paramMap.put("name", interUserRollDto.getName());
        }
        if (StringUtils.hasText(interUserRollDto.getSubsyCode())) {
            paramMap.put("subsyCode", interUserRollDto.getSubsyCode());
        }
        if (StringUtils.hasText(interUserRollDto.getMobile())) {
            paramMap.put("mobile", interUserRollDto.getMobile());
        }
        if (!getCurrentUserSubsyCodes().contains(Constants.PLATFORM_SUBSY_CODE)) {
            String[] subsyCodes = getCurrentUserSubsyCodes().split(",");
            paramMap.put("subsyCodes", subsyCodes);
        }
        List<InterUserRollDto> authorizationList = authorizationService.findPage(paramMap);
        Integer count = authorizationService.count(paramMap);
        pageInfo.setTotal(count);
        PaginationResult<InterUserRollDto> result = new PaginationResult<>(authorizationList, pageInfo);
        return new DataTableResponse<>(dataTable.getsEcho(), result);
    }

    @RequiresPermissions("authorization:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {
        setCommonData(model);
        MstInterUserRollEntity authorization = new MstInterUserRollEntity();
        model.addAttribute("authorization", authorization);
        model.addAttribute("op", "新 增");
        return "auth/authorization/edit";
    }

    @RequiresPermissions("authorization:create")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> create(MstInterUserRollEntity authorization) {
        Map<String, Object> resultMap = new HashMap<>(2);
        resultMap.put("status", 200);
        try {
            authorization.setCrtUserCode(getCurrentUserCode());
            authorizationService.createAuthorization(authorization);
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("errorMsg", "新建授权异常，请联系管理员");
        }
        return resultMap;
    }

    @RequiresPermissions("authorization:update")
    @RequestMapping(value = "/{userCodeAndSubsyCode}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("userCodeAndSubsyCode") String userCodeAndSubsyCode, Model model) {
        setCommonData(model);
        model.addAttribute("authorization", authorizationService.findByUserCodeAndSubsyCode(userCodeAndSubsyCode));
        model.addAttribute("op", "修改");
        return "auth/authorization/edit";
    }

    @RequiresPermissions("authorization:update")
    @RequestMapping(value = "/{userCodeAndSubsyCode}/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> update(@PathVariable("userCodeAndSubsyCode") String userCodeAndSubsyCode, MstInterUserRollEntity authorization) {
        Map<String, Object> resultMap = new HashMap<>(2);
        resultMap.put("status", 200);
        try {
            authorization.setCrtUserCode(getCurrentUserCode());
            authorizationService.updateAuthorization(userCodeAndSubsyCode, authorization);
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("errorMsg", "编辑授权异常，请联系管理员");
        }
        return resultMap;
    }


    @RequiresPermissions("authorization:delete")
    @RequestMapping(value = "/{userCodeAndSubsyCode}/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("userCodeAndSubsyCode") String userCodeAndSubsyCode) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("status", 200);
        try {
            authorizationService.deleteAuthorization(userCodeAndSubsyCode);
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("errorMsg", "删除授权异常");
        }
        return resultMap;
    }

    private void setCommonData(Model model) {
        model.addAttribute("userList", userService.findBySubsyCodes(getCurrentUserSubsyCodes()));
        model.addAttribute("roleList", roleService.findBySubsyCodes(getCurrentUserSubsyCodes()));
        Map<String, Object> paramMap = new HashMap<>();
        if (!getCurrentUserSubsyCodes().contains(Constants.PLATFORM_SUBSY_CODE)) {
            String[] subsyCodes = getCurrentUserSubsyCodes().split(",");
            paramMap.put("subsyCodes", subsyCodes);
        }
//        model.addAttribute("subsyList", subsyBaseService.findSubsyListBySubsyCodes(paramMap));
    }


}
