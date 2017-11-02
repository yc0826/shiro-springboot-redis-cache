package com.platform.web.controller.business.subsy;

import com.platform.api.business.subsy.entity.MstSubsyBaseEntity;
import com.platform.api.business.subsy.service.SubsyBaseService;
import com.platform.web.utils.PageUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/subsy")
public class SubsyController {

    @Autowired
    private SubsyBaseService subsyBaseService;

    @RequiresPermissions("subsy:view")
    @RequestMapping()
    public String list(Model model, HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<>();
        int pageNo = 1;
        if(StringUtils.hasText(request.getParameter("pageNo"))) {
            pageNo = Integer.parseInt(request.getParameter("pageNo"));
        }
        paramMap.put("start" , PageUtil.initPageParmMap(pageNo));
        paramMap.put("size" ,PageUtil.pageSize);
        List<MstSubsyBaseEntity> subsyList= subsyBaseService.querySubsyListByMap(paramMap);
        Integer count = subsyBaseService.count(paramMap);
        model.addAttribute("subsyList", subsyList);
        model.addAttribute("pageCount", PageUtil.initPageCount(count));
        model.addAttribute("pageIndex", pageNo);
        model.addAttribute("uri", request.getRequestURI());
        return "business/subsy/list";
    }
}
