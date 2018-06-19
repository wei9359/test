package com.jinfu.spring.mapper;

import java.util.Map;

/**
 * @ClassName NavbarMapper
 * @auther 魏星
 * @DATE 2018/6/15
 */
public interface NavbarMapper<T> {
    T getNavbar(Map<Object,Object> condition) throws Exception;
}
