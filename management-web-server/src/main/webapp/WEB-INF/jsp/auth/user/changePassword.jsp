<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../common/resource.jsp" %>
    <%@ include file="../../common/tags.jsp" %>


    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <title>修改密码</title>
</head>
<body>

<div class="row mt wrapper layui-container ">
    <div class=" layui-row row-style">
        <div class="form-panel">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>修改密码</legend>
            </fieldset>
            <!-- 表格开始 -->
            <form class="layui-form">
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md12">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-inline">
                            <input type="password" name="newPassword"
                                   placeholder="输入新密码" autocomplete="off" maxlength="20" lay-verify="required" required class="layui-input"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button class="layui-btn" lay-submit lay-filter="*">${op}</button>
                    </div>
                    <div class=" layui-inline">
                        <button id="back" type="button" class="layui-btn layui-btn-primary" >返回</button>
                    </div>
                </div>
            </form>
            <!-- 表格结束-->
        </div>
    </div>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>

<script type="text/javascript">
    layui.use(['layer', 'globalAjax','form', 'verify'], function () {
        var $ = layui.jquery, layer = layui.layer, form = layui.form;

        form.on("submit(*)", function(data){
            $.post(window.location.pathname, {
                 "newPassword" : data.field.newPassword
                }, function (data) {
                    if (data.status === 200) {
                        layer.alert("密码修改成功",{closeBtn: 0},  function () {
                            window.location.href = "${originUrl}";
                        })
                    } else {
                        //layer.alert(data.errorMsg)
                        if(data.status === 500){
                            layer.alert("服务器繁忙，请联系管理员，谢谢。");
                        }else {
                            layer.alert(data.msg)
                        }
                    }
                }, 'json'
            );
            return false;
        });

        $("#back").on("click", function (event) {
            history.back();
            //setReturnValueFalse(event);
        })
    });
</script>
</body>
</html>