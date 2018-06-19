<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/13
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path = request.getContextPath();%>

<html>

<head>
    <title>第一个页面</title>
    <link rel="stylesheet" href="<%= path%>/css/layui.css">
    <link rel="stylesheet" href="<%= path%>/css/global.css">
</head>
<body>
<h1>第一个页面</h1>
<div class="admin-main">
        <form action="<%= path %>/login.action" method="post" class="layui-form">
            <div>
                    姓名：<input type="text" name="username" placeholder=""> <br>
            </div>
            <div>
                    密码：<input type="password" name="password"> <br>
            </div>
            <button type="submit">登录</button>
        </form>
</div>
${message}
<a href="<%=path%>/getUserIfo.action">获取用户信息</a>
</body>
</html>
