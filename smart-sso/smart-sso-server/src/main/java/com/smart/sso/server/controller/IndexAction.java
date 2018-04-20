package com.smart.sso.server.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexAction {

    @RequestMapping("/")
    public String page(){
         return "redirect:"+"/admin/admin";
    }

    @RequestMapping("/smart-sso-server")
    public String pageIndex(){
        return "redirect:"+"/admin/admin";
    }

}
