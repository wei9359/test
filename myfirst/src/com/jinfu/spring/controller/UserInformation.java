package com.jinfu.spring.controller;

import com.jinfu.spring.pojo.User;
import com.jinfu.spring.service.UserService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName UserInformation
 * @auther 魏星
 * @DATE 2018/6/14
 */
@Controller
public class UserInformation {
    @Autowired
    UserService userService;
    @RequestMapping(value="getUserIfo")
    public String getUserIfo(Model model, HttpServletRequest request) throws Exception{
           List<User> userlist = new ArrayList<User>();
           Map<String,String> map = new HashMap<String,String>();
           userlist = (List<User>)userService.queryList(map);

           model.addAttribute("userlist",userlist);
           return "userifo";
    }
}
