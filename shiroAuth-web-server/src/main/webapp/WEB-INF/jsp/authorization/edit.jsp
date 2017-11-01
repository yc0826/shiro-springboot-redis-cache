<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../jsp/common/resource.jsp" %>
    <%@ include file="../../jsp/common/tags.jsp" %>
    <title>编辑授权</title>
</head>
<body>
<div class="col_main lightshadow">
    <h2 class="page_headline"><span class="c_blue store_title">编辑授权</span></h2>
    <div class="pb50">
        <!-- 表格开始 -->
        <form:form method="post" commandName="authorization">
            <form:hidden path="id"/>

            <div class="add_store">
                <ol class="add_store_ol">
                    <li class="add_store_li">
                        <span class="add_store_span">应用：</span>
                        <div>
                            <select id="appId" name="appId" style="width: 150px">
                                <c:forEach items="${appList}" var="app">
                                    <option value="${app.id}"
                                            <c:if test="${app.id==authorization.appId}">selected="selected"</c:if>>${app.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </li>
                    <li class="add_store_li">
                        <span class="add_store_span">用户：</span>
                        <div>
                            <select id="userId" name="userId" style="width: 150px">
                                <c:forEach items="${userList}" var="user">
                                    <option value="${user.id}"
                                            <c:if test="${user.id==authorization.userId}">selected="selected"</c:if>>${user.username}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </li>
                    <li class="add_store_li">
                        <span class="add_store_span">角色：</span>
                        <div>
                            <select id="roleIds" name="roleIds" multiple="multiple" size="10" style="height: auto;width: 150px;">
                                <c:forEach items="${roleList}" var="role">
                                    <option value="${role.id}"
                                            <c:if test="${fn:contains(authorization.roleIds, role.id)}">selected="selected"</c:if>>${role.description}</option>
                                </c:forEach>
                            </select>
                            (按住shift键多选)
                        </div>
                    </li>
                </ol>
                <a href="javascript:void(0)" name="submit" onclick="document.getElementById('authorization').submit();"
                   class="btn btn_primary">${op}</a>
            </div>
        </form:form>
        <!-- 表格结束-->
    </div>
</div>
</body>
</html>