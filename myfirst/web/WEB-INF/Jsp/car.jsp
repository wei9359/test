<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <title>列表</title>
    <link rel="stylesheet" href="<%= path %>/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%= path %>/css/global.css" media="all">
</head>
<body>
<br/>
<div class="admin-main">
    <blockquote class="layui-elem-quote">
        <form class="layui-form" action="" method="get" id="findForm">
            <input type="hidden" name="beginRow" value="0">
            <input type="hidden" name="isFuzzy" value="1">

            <div class="layui-inline">
                <div class="layui-input-inline" style="width: 200px;">
                    <input type="text" name="orderCode" value="${orderCode }" placeholder="订单号" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <div class="layui-input-inline" style="width: 200px;">
                    <input type="text" name="carNum" value="${carNum }" placeholder="车牌号" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <div class="layui-input-inline" style="width: 200px;">
                    <input type="text" name="phone" value="${phone }" placeholder="收货人手机号" class="layui-input">
                </div>
            </div>

            <div class="layui-inline" style="padding-left:10px">
                <select name="orderStatus">
                    <option value="-1" <c:if test="${orderStatus==-1 }">selected</c:if> >订单状态</option>
                    <option value="0" <c:if test="${orderStatus==0 }">selected</c:if> >待支付</option>
                    <option value="1" <c:if test="${orderStatus==1 }">selected</c:if> >已支付/办理中</option>
                    <option value="2" <c:if test="${orderStatus==2 }">selected</c:if> >办理成功</option>
                    <option value="3" <c:if test="${orderStatus==3 }">selected</c:if> >办理失败</option>
                    <option value="4" <c:if test="${orderStatus==4 }">selected</c:if> >用户取消订单</option>
                    <option value="5" <c:if test="${orderStatus==5 }">selected</c:if> >后台取消订单</option>
                    <option value="6" <c:if test="${orderStatus==6 }">selected</c:if> >用户确认办理</option>
                </select>
            </div>

            <div class="layui-inline" style="padding-left:10px">
                <button class="layui-btn">
                    <i class="layui-icon">&#xe615;</i>&nbsp;&nbsp;搜索
                </button>
            </div>

            <div class="layui-inline" style="float:right">
                <button class="layui-btn layui-btn-normal">
                    <i class="layui-icon">&#xe63d;</i>
                </button>
            </div>
        </form>
    </blockquote>


    <div class="layui-field-box">
        <table class="site-table table-hover">
            <thead>
            <tr>
                <th>订单号</th>
                <th>收货人</th>
                <th>手机号</th>
                <th>车牌号</th>
                <th>总金额</th>
                <th>支付金额</th>
                <th>订单状态</th>
                <th>交易单号</th>
                <th>提交时间</th>
                <th>提醒数</th>
                <th>分配情况</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="dataList" items="${pager.dataList}" varStatus="i">
                <tr>
                    <td>${dataList.orderCode }</td>
                    <td>${dataList.consignee }</td>
                    <td>${dataList.phone }</td>
                    <td>${dataList.carNum }</td>
                    <td>${dataList.totalMoney }元</td>
                    <td>${dataList.actualPayMoney }元</td>
                    <td class="orderStatus">
                        <c:if test="${dataList.orderStatus==0 }">待支付 </c:if>
                        <c:if test="${dataList.orderStatus==1 }">已支付/办理中</c:if>
                        <c:if test="${dataList.orderStatus==2 }">办理成功</c:if>
                        <c:if test="${dataList.orderStatus==3 }">办理失败</c:if>
                        <c:if test="${dataList.orderStatus==4 }">用户取消订单</c:if>
                        <c:if test="${dataList.orderStatus==5 }">后台取消订单</c:if>
                        <c:if test="${dataList.orderStatus==6 }">用户确认办理</c:if>
                    </td>
                    <th>${dataList.tradeNo }</th>
                    <td>${dataList.createDate }</td>
                    <td>${dataList.reminderNum }</td>
                    <td>
                        <c:if test="${dataList.dealerId=='0'}">
                            未分配代理商
                        </c:if>
                        <c:if test="${dataList.dealerId!='0'}">
                            ${dataList.attribute1 }
                        </c:if>
                    </td>
                    <td>
                        <a href="javascript:void(0)" onclick="iframe('<%= path %>/admin/orderSupplyDriving/detailUI.action?orderSupplyDrivingId=${dataList.orderSupplyDrivingId}','查看详细',1.2,1.2,false)">查看详细</a>
                        <span>
								<c:if test="${dataList.dealerId=='0' and dataList.orderStatus==1}">
                                    <a href="javascript:void(0)" onclick="iframe('<%= path %>/admin/orderSupplyDriving/allotSupplyDrivingUI.action?orderSupplyDrivingId=${dataList.orderSupplyDrivingId}','分配订单',1.2,1.2,false)">分配订单</a>
                                </c:if>
							</span>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty pager.dataList}">
                <tr><td colspan="12">无数据</td></tr>
            </c:if>
            </tbody>
        </table>

    </div>
    <div class="admin-table-page">
        <div id="page" class="page" data-pageCount="${pager.pageCount}" data-pageUrl="<%= path %>/admin/orderSupplyDriving/list.action" data-beginRowName="beginRow"></div>
    </div>
</div>
<script type="text/javascript" src="<%= path %>/js/layui.js"></script>
<script type="text/javascript" src="<%= path %>/js/page.js"></script>
<script type="text/javascript" src="<%= path %>/js/common.js"></script>
</body>
</html>