package com.babysky.management.web.controller.auth;

import com.alibaba.dubbo.config.annotation.Reference;
import com.babysky.management.api.auth.dto.InterUserDto;
import com.babysky.management.api.auth.dto.SubsyComboDto;
import com.babysky.management.api.auth.entity.MstInterUserBaseEntity;
import com.babysky.management.api.auth.service.api.MstInterUserBaseService;
import com.babysky.management.api.auth.service.api.SubsyBaseService;
import com.babysky.management.common.Constants;
import com.babysky.management.common.exception.SystemException;
import com.babysky.management.common.utils.*;
import com.babysky.management.web.controller.base.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author YangChao
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Reference(version = "1.0.0",
            application = "${dubbo.application.id}",
            url = "dubbo://localhost:12345")
    private MstInterUserBaseService userService;


    @Reference(version = "1.0.0",
            application = "${dubbo.application.id}",
            url = "dubbo://localhost:12345")
    private SubsyBaseService subsyBaseService;



    @RequiresPermissions("user:view")
    @RequestMapping()
    public String list(Model model) {
        setCommonData(model);
        return "auth/user/list";
    }


    @RequiresPermissions("user:view")
    @RequestMapping("/getInterUserData")
    @ResponseBody
    public DataTableResponse<InterUserDto> getInterUserListData(InterUserDto interUserDto, DataTableRequest dataTable) {
        PageInfo pageInfo = new PageInfo(dataTable.getCurrentPage(), dataTable.getiDisplayLength());
        Map<String, Object> paramMap = new HashMap<>(6);
        paramMap.put("start", (pageInfo.getPage() - 1) * pageInfo.getRows());
        paramMap.put("size", PAGE_SIZE);
        if (!getCurrentUserSubsyCodes().contains(Constants.PLATFORM_SUBSY_CODE)
                && !getCurrentUserSubsyCodes().contains(Constants.BABYSKY_GROUP)) {
            String[] subsyCodes = getCurrentUserSubsyCodes().split(",");
            paramMap.put("subsyCodes", subsyCodes);
        }
        if (StringUtils.hasText(interUserDto.getName())) {
            paramMap.put("name", interUserDto.getName());
        }
        if (StringUtils.hasText(interUserDto.getSubsyCode())) {
            paramMap.put("subsyCode", interUserDto.getSubsyCode());
        }
        if (StringUtils.hasText(interUserDto.getMobile())) {
            paramMap.put("mobile", interUserDto.getMobile());
        }
        if (interUserDto.getGderFlg() != null) {
            paramMap.put("gderFlg", interUserDto.getGderFlg());
        }
        if (interUserDto.getAppAcesFlg() != null) {
            paramMap.put("appAcesFlg", interUserDto.getAppAcesFlg());
        }

        List<InterUserDto> userList = userService.findPage(paramMap);
        Integer count = userService.count(paramMap);
        pageInfo.setTotal(count);
        PaginationResult<InterUserDto> result = new PaginationResult<>(userList, pageInfo);
        return new DataTableResponse<>(dataTable.getsEcho(), result);
    }


    @RequiresPermissions("user:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {
        setCommonData(model);
        model.addAttribute("user", new MstInterUserBaseEntity());
        model.addAttribute("op", "新 增");
        return "auth/user/add";
    }

    @RequiresPermissions("user:create")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> create(MstInterUserBaseEntity user) {
        Map<String, Object> resultMap = new HashMap<>(1);
        resultMap.put("status", 200);
        user.setCrtUserCode(getCurrentUserCode());

        try {
            userService.createUser(user);
        } catch (SystemException e) {
            LoggerUtils.error(this.getClass(), e.getMessage());
            resultMap.put("status", 500);
            resultMap.put("errorMsg", e.getMessage());
        }
        return resultMap;
    }

    @RequiresPermissions("user:view")
    @RequestMapping(value = "/{interUserCode}/detail", method = RequestMethod.GET)
    public String showDetailForm(@PathVariable("interUserCode") String interUserCode, Model model) {
        setCommonData(model);
        model.addAttribute("user", userService.findByCode(interUserCode));
        model.addAttribute("userDtl", userService.findDtlByUserCode(interUserCode));
        model.addAttribute("op", "修改");
        return "auth/user/view";
    }

    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{interUserCode}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("interUserCode") String interUserCode, Model model) {
        setCommonData(model);
        model.addAttribute("user", userService.findByCode(interUserCode));
        model.addAttribute("userDtl", userService.findDtlByUserCode(interUserCode));
        model.addAttribute("op", "修改");
        return "auth/user/edit";
    }

    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{interUserCode}/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> update(@PathVariable("interUserCode") String interUserCode, MstInterUserBaseEntity user) {
        Map<String, Object> resultMap = new HashMap<>(2);
        resultMap.put("status", 200);
        try {
            MstInterUserBaseEntity m = userService.findByCode(interUserCode);
            user.setUpdUserCode(getCurrentUserCode());
            user.setVerNum(m.getVerNum());
            userService.updateUser(user);
        } catch (SystemException e) {
            resultMap.put("status", 500);
            resultMap.put("errorMsg", e.getMessage());
        }
        return resultMap;
    }

    @RequiresPermissions("user:validate")
    @RequestMapping(value = "/{interUserCode}/validate", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> validate(@PathVariable("interUserCode") String interUserCode) {
        Map<String, Object> resultMap = new HashMap<>(2);
        userService.validate(interUserCode, getCurrentUserCode());
        resultMap.put("status", 200);
        return resultMap;
    }


    @RequiresPermissions("user:delete")
    @RequestMapping(value = "/{interUserCode}/delete", method = RequestMethod.GET)
    public String showDeleteForm(@PathVariable("interUserCode") String interUserCode, Model model) {
        setCommonData(model);
        model.addAttribute("user", userService.findByCode(interUserCode));
        model.addAttribute("op", "删除");
        return "auth/user/add";
    }

    @RequiresPermissions("user:delete")
    @RequestMapping(value = "/{interUserCode}/delete", method = RequestMethod.POST)
    public String delete(@PathVariable("interUserCode") String interUserCode, RedirectAttributes redirectAttributes) {
        userService.deleteUser(interUserCode);
        redirectAttributes.addFlashAttribute("msg", "删除成功");
        return "redirect:/user";
    }


    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{interUserCode}/changePassword", method = RequestMethod.GET)
    public String showChangePasswordForm(@PathVariable("interUserCode") String interUserCode, Model model) {
        model.addAttribute("user", userService.findByCode(interUserCode));
        model.addAttribute("op", "修改密码");
        return "auth/user/changePassword";
    }

    @RequestMapping(value = "/getSubsyListByUserCode", method = RequestMethod.GET)
    @ResponseBody
    public List<SubsyComboDto> getSubsyListByUserCode(String userCode) {
        return subsyBaseService.getSubsyListByUserCode(userCode);
    }


    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{interUserCode}/changePassword", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> changePassword(@PathVariable("interUserCode") String interUserCode, String newPassword) {
        Map<String, Object> resultMap = new HashMap<>(2);
        resultMap.put("status", 200);
        try {
            userService.changePassword(interUserCode, newPassword);
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("errorMsg", "修改密码异常，请联系管理员");
        }
        return resultMap;
    }

    @RequestMapping(value = "/changeMyPassword", method = RequestMethod.GET)
    public String showChangeMyPasswordForm(HttpServletRequest request, Model model) {
        model.addAttribute("user", userService.findByCode(getCurrentUserCode()));
        model.addAttribute("originUrl", request.getHeader("referer"));
        model.addAttribute("op", "修改密码");
        return "auth/user/changePassword";
    }

    @RequestMapping(value = "/changeMyPassword", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> changeMyPassword(String newPassword) {
        Map<String, Object> resultMap = new HashMap<>(2);
        resultMap.put("status", 200);
        try {
            userService.changePassword(getCurrentUserCode(), newPassword);
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("errorMsg", "修改密码异常，请联系管理员");
        }
        return resultMap;
    }




    /**
     * 接口请求会话是否alive
     */
    @RequestMapping("/checkSessionAlive")
    public @ResponseBody String checkSessionAlive() {
        return getCurrentUserCode();
    }


    private void setCommonData(Model model) {
        Map<String, Object> paramMap = new HashMap<>(2);
        if (!getCurrentUserSubsyCodes().contains(Constants.PLATFORM_SUBSY_CODE)) {
            String[] subsyCodes = getCurrentUserSubsyCodes().split(",");
            paramMap.put("subsyCodes", subsyCodes);
        }
        model.addAttribute("subsyList", subsyBaseService.findSubsyListBySubsyCodes(paramMap));
    }


}
