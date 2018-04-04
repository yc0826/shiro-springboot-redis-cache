<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../common/resource.jsp" %>
    <%@ include file="../../common/tags.jsp" %>
    <title>编辑菜单</title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <!-- Custom styles for this template -->
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/style-responsive.css" rel="stylesheet">
</head>
<body>
<section id="main-content main-left-node">
    <div class="row mt">
        <div class=" layui-row row-style">
            <div class="form-panel">
                <h2 class="page_headline edit_h2"><span class="c_blue store_title">编辑菜单</span></h2>
                <div class="pb50  pb50-formbox">
                    <!-- 表格开始 -->
                    <form:form method="post" commandName="resource">
                        <form:hidden path="resoCode"/>
                        <form:hidden path="parentResoCode"/>
                        <form:hidden path="parentResoCodes"/>

                        <div class="add_store">
                            <ol class="add_store_ol">
                                <c:if test="${not empty parent}">
                                    <li class="add_store_li form-group-box">
                                        <span class="add_store_span col-sm-2">父节点名称：</span>
                                        <div class="col-sm-8">
                                                ${parent.resoName}
                                        </div>
                                    </li>
                                </c:if>
                                <li class="add_store_li form-group-box">
                                    <span class="add_store_span col-sm-2"><c:if test="${not empty parent}">子</c:if>名称：</span>
                                    <div class="col-sm-8">
                                        <input id="resoName" type="text" name="resoName" value="${resource.resoName}"
                                               placeholder="输入名称"
                                               class="add_store_inp form-control"/>
                                    </div>
                                </li>
                                <li class="add_store_li form-group-box">
                                    <span class="add_store_span col-sm-2">类型：</span>
                                    <div class="col-sm-8">
                                        <select id="resoTypeCode" name="resoTypeCode" class="form-control">
                                            <option
                                                    <c:if test="${resource.resoTypeCode == '00040003'}">selected="selected"</c:if>
                                                    value="00040003">菜单
                                            </option>
                                            <option
                                                    <c:if test="${resource.resoTypeCode == '00040004'}">selected="selected"</c:if>
                                                    value="00040004">按钮
                                            </option>
                                        </select>
                                    </div>
                                </li>
                                <li class="add_store_li form-group-box">
                                    <span class="add_store_span col-sm-2">URL路径：</span>
                                    <div class="col-sm-8">
                                        <input id="url" type="text" name="url" value="${resource.url}"
                                               placeholder="输入URL路径"
                                               class="add_store_inp form-control"/>
                                    </div>
                                </li>
                                <li class="add_store_li form-group-box">
                                    <span class="add_store_span col-sm-2">权限字符串：</span>
                                    <div class="col-sm-8">
                                        <input id="permission" type="text" name="permission"
                                               value="${resource.permission}"
                                               placeholder="输入权限字符串" class="add_store_inp form-control"/>
                                    </div>
                                </li>
                            </ol>
                            <a href="javascript:void(0)" name="submit"
                               onclick="document.getElementById('resource').submit();"
                               class="btn btn_primary">${op}</a>
                        </div>
                    </form:form>
                    <!-- 表格结束-->
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>