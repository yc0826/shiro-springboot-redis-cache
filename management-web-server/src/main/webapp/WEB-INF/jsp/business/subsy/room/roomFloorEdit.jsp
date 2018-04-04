<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>
    <title>楼层管理</title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <!--external css-->

    <!-- Custom styles for this template -->
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css"/>
    <style>
        ul.ztree {
            margin-top: 10px;
            border: 1px solid #617775;
            background: #f0f6e4;
            width: 220px;
            height: 200px;
            overflow-y: scroll;
            overflow-x: auto;
        }
    </style>
</head>
<body>
<div class="row mt wrapper">
    <div class=" layui-row row-style">
        <div class="col_main lightshadow form-panel">
            <h2 class="page_headline"><span class="c_blue store_title">编辑楼层</span></h2>
            <div class="pb50">
                <!-- 表格开始 -->
                <form class="layui-form">

                    <div class="add_store">
                        <ol class="add_store_ol" style="list-style: none;">
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2 control-label label-span">会所</label>
                                <div class="col-sm-8">
                                    <select id="subsyCode" name="subsyCode" class="form-control"

                                        <option>请选择</option>
                                        <c:forEach items="${subsyList}" var="subsy">
                                            <option value="${subsy.subsyCode}"
                                                    <c:if test="${subsy.subsyCode==entity.subsyCode}">selected="selected"</c:if>>${subsy.subsyName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </li>
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2  control-label label-span">楼层</label>
                                <div class="col-sm-8">
                                    <input id="floorName" type="text" required name="floorName"
                                           value="${entity.floorName}"
                                           placeholder="输入楼层名称" class="add_store_inp form-control"
                                           autocomplete="false"/>
                                </div>
                            </li>
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2  control-label label-span">楼层显示名</label>
                                <div class="col-sm-8">
                                    <input id="floorDispName" type="text" required name="floorDispName"
                                           value="${entity.floorDispName}"
                                           placeholder="输入楼层显示名" class="add_store_inp form-control"
                                           autocomplete="false"/>
                                </div>
                            </li>
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2  control-label label-span"></label>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <div class="col-sm-8">
                                            <button class="layui-btn" lay-submit lay-filter="floorCode">${op}</button>
                                            <div style="clear: both;"></div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ol>
                    </div>
                </form>
                <!-- 表格结束-->
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>

    layui.use(['layer', 'globalAjax', 'ztree', 'form'], function () {
        var $ = layui.jquery, layer = layui.layer;
        var form = layui.form;

        //监听提交
        form.on('submit(floorCode)', function (data) {
            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if(data.status === 200) {
                        layer.alert("${op}楼层成功",{closeBtn: 0},  function () {
                            window.location.href = "${ctx}/room/roomFloorList";
                        })
                    } else {
                        //layer.alert(data.errorMsg)
                        if(data.status === 500){
                            layer.alert("服务器繁忙，请联系管理员，谢谢。");
                        }else {
                            layer.alert(data.msg)
                        }
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>