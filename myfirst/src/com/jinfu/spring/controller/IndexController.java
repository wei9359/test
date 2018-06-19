package com.jinfu.spring.controller;

import com.github.kevinsawicki.http.HttpRequest;
import com.jinfu.spring.pojo.User;
import com.jinfu.spring.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class IndexController {
    @Resource
    private UserService userService;
    /**
    * @auther 魏星
    * @date   2018/6/13
    * @param  [model]
    * @return java.lang.String
    */
    @RequestMapping(value="index")
    public String index(Model model) throws Exception{

        System.out.println("this is index");
        model.addAttribute("name","aaa");
        Map<String,String> map = new HashMap<>();
        map.put("username","wei");
        //int age = (int)userService.queryList(map);
        //model.addAttribute("age",age);

        return("index");
    }


}
