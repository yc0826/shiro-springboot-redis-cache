package com.platform.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestAjaxContoller {

    @RequestMapping()
    public @ResponseBody String test(String str) {
        return str;
    }
}
