<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="layui-header layui-bg-cyan">

    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <c:forEach items="${sessionScope.module}" var="m" varStatus="vs">
        <li class="layui-nav-item
            <c:choose>
            <c:when test="${sessionScope.parentResoCode == m.resoCode}">
                layui-this
            </c:when>
        </c:choose>
        ">
            <a href="${ctx}/menus?parentResoCode=${m.resoCode}">${m.resoName}</a></li>
        </c:forEach>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:">
                <img src="${ctx}${sessionScope.user.avtrUrl}" class="layui-nav-img">
                <shiro:principal/>
            </a>
            <dl class="layui-nav-child">
                <dd><a href="${ctx}/user/changeMyPassword/">修改密码</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="${ctx}/logout">退出</a></li>
    </ul>
</div>