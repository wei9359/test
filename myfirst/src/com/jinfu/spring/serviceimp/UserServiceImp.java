package com.jinfu.spring.serviceimp;

import com.jinfu.spring.mapper.UserMapper;
import com.jinfu.spring.pojo.User;
import com.jinfu.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @ClassName UserServiceImp
 * @auther 魏星
 * @DATE 2018/6/13
 */

public class UserServiceImp<T> implements UserService {
    @Autowired
    private UserMapper<T> userMapper;

    @Override
    public Object queryList(Map m) throws Exception {
        return (List<User >)userMapper.queryList(m);
    }

    @Override
    public void insert() throws Exception {
        userMapper.insert();
    }

    @Override
    public Object loginTest(Map m) throws Exception {
        Integer age = (Integer) userMapper.loginTest(m);
        if (!(age==null)){
            return true;
        }
        return false;
    }

    @Override
    public User getUser(String userName, String userID) throws Exception {

        return userMapper.getUser(userName,userID);
    }

    @Override
    public User getUserByName(String userName) throws Exception {
        return userMapper.getUserByName(userName);
    }
}
