package com.jinfu.spring.mapper;

import com.jinfu.spring.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * @ClassName UserMapper
 * @auther 魏星
 * @DATE 2018/6/13
 */
public interface UserMapper<T> {
    List<User> queryList(Map<String,String> m) throws Exception;
    void insert() throws Exception;
    T loginTest(Map<String,String> m) throws Exception;
    User getUser(@Param(value = "userName")String userName,@Param(value = "userID") String userID) throws Exception;
    @Select("select * from user where userName=#{userName}")
    User getUserByName(@Param(value = "userName") String userName) throws Exception;
}
