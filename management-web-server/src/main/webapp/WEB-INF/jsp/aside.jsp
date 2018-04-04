<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="layui-side layui-bg-cyan index-side-box" >
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <div class="index-logo" onclick="window.location.href = '${ctx}'" style="cursor:pointer">
            <img class="index-logo-img" src="${ctx}/static/img/ui-logo.jpg" alt="">
            <div class="index-logo-title">贝瑞佳母婴管理平台</div>
        </div>
        <ul class="layui-nav layui-bg-cyan layui-nav-tree">

            <c:forEach items="${sessionScope.menus}" var="m">
                <li class="layui-nav-item
                <c:if test="${sessionScope.resoCode == m.resoCode}">
                layui-nav-itemed
                </c:if>">
                    <a class="" href="javascript:;">${m.resoName}</a>
                    <dl class="layui-nav-child">
                        <c:forEach items="${m.children}" var="child">
                            <dd
                                    <c:if test="${sessionScope.childResoCode == child.resoCode}">
                                        class="layui-this"
                                    </c:if>
                            ><a href="${ctx}/${child.url}?childResoCode=${child.resoCode}&resoCode=${m.resoCode}" style="font-size: 12px">${child.resoName}</a></dd>
                        </c:forEach>
                    </dl>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>