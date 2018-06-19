package com.jinfu.spring.controller;

import com.jinfu.spring.pojo.User;
import com.jinfu.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


/**
 * @ClassName LoginController
 * @auther 魏星
 * @DATE 2018/6/13
 */
@Controller
public class LoginController {
    @Autowired
    UserService userService;
    /**
    * @auther 魏星
    * @date   2018/6/14
    * @param  model, request
    * @return java.lang.String
    */
    @RequestMapping(value="/login")
    public String login(Model model,String username,String password) throws Exception{
        Map<String,String> condition = new HashMap<String,String>();

//        String username = (String)request.getParameter("username");
//        String password = (String)request.getParameter("password");

        condition.put("username",username);
        condition.put("password",password);
        model.addAttribute("username",username);
        model.addAttribute("password",password);
        User user = userService.getUserByName(username);
        model.addAttribute("user",user);
        if((boolean)userService.loginTest(condition))
        {
            return "login";
        }else{
            System.out.println("this is login" + "username:" + username + "password:" + password);
            model.addAttribute("message","password or username is wrong!");
            return "index";
        }

    }
}
