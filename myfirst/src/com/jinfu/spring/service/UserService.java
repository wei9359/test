package com.jinfu.spring.service;

import com.jinfu.spring.pojo.User;

import javax.jws.soap.SOAPBinding;
import java.util.Map;

/**
 * @ClassName UserService
 * @auther 魏星
 * @DATE 2018/6/13
 */
public interface UserService<T> {
    T queryList(Map<String,String> m) throws Exception;
    void insert() throws Exception;
    T loginTest(Map<String,String> m) throws Exception;
    User getUser(String userName,String userID) throws Exception;
    User getUserByName(String userName) throws Exception;
}
