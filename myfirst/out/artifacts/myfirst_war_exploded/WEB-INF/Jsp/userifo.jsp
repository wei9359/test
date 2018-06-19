<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/14
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <title>客户信息</title>
    <link type="text/css" rel="stylesheet" href="<%=path%>/css/layui.css" media="all" charset="UTF-8"/>
    <link type="text/css" rel="stylesheet" href="<%=path%>/css/global.css" media="all" charset="UTF-8"/>


</head>
<body>
<div class="admin-main">
    <blockquote class="layui-field-box">
        <p>用户信息</p>
    </blockquote>
    <div class="layui-field-box">
        <table id="userIfo" class="site-table table-hover">
            <thead>
            <tr>
                <th>用户ID</th>
                <th>用户名</th>
                <th>用户年龄</th>
                <th>用户地址</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="userlist" items="${userlist}">
                <tr>
                    <td>${userlist.userID}</td>
                    <td>${userlist.userName}</td>
                    <td>${userlist.userAge}</td>
                    <td>${userlist.userAdress}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
