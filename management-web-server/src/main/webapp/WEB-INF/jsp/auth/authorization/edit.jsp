<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../common/resource.jsp" %>
    <%@ include file="../../common/tags.jsp" %>
    <title>编辑授权</title>
    <!-- Bootstrap core CSS -->
    <!-- Custom styles for this template -->
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/multiple-select.css" rel="stylesheet">
</head>
<body>
<div class="row mt wrapper layui-container ">
    <div class=" layui-row row-style">
        <div class="form-panel">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>编辑用户授权</legend>
            </fieldset>
            <form class="layui-form">
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md12">
                        <label class="layui-form-label label-style">用户</label>
                        <div class="layui-input-inline layui-form">
                            <select id="interUserCode" lay-verify="selectcheck" vb="用户" name="interUserCode"
                                    <c:if test="${authorization.interUserCode != null}">disabled</c:if>
                                    lay-filter="user" lay-search>
                                <option value="">请选择</option>
                                <c:forEach items="${userList}" var="user">
                                    <option value="${user.interUserCode}"
                                            <c:if test="${user.interUserCode==authorization.interUserCode}">selected="selected"</c:if>>${user.userName}(${user.mobNum})</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md12">
                        <label class="layui-form-label label-style">会所</label>
                        <div class="layui-input-inline layui-form" lay-filter="subsyCode">
                            <select id="subsyCode" vb="会所"  <c:if test="${authorization.interUserCode != null}">disabled</c:if> lay-verify="selectcheck" name="subsyCode"></select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md12">
                        <label class="layui-form-label label-style">角色</label>
                        <div class="layui-input-inline">
                            <select id="roleMs" multiple="multiple" vb="角色" lay-ignore lay-verify="selectcheck">
                                <c:forEach items="${roleList}" var="role">
                                    <option value="${role.rollCode}">${role.rollName}</option>
                                </c:forEach>
                            </select>
                            <input type="hidden" id="rollCodes" name="rollCodes" value="">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button class="layui-btn" lay-submit lay-filter="*">${op}</button>
                    </div>
                    <div class=" layui-inline">
                        <button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>
                    </div>
                </div>
            </form>
            <!-- 表格结束-->
        </div>
    </div>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>

    //JavaScript代码区域
    layui.use(['layer', 'globalAjax', 'multipleSelect', 'verify', 'form'], function () {
        var $ = layui.jquery, layer = layui.layer, form = layui.form, verify = layui.verify;

        //角色codes
        var rollCodes = '${authorization.rollCodes}';
        var rollCodeArray = [];
        if (rollCodes) {
            rollCodeArray = rollCodes.split(",");
        }
        $(function () {
            $('#roleMs').change(function () {
                $("#rollCodes").val($(this).val())
            }).multipleSelect({
                placeholder: "多选",
                filter: true,
                multiple: true,
                multipleWidth: '150',
                selectAll: false,
                allSelected: false,
                countSelected: false,
                width: '100%',
                noMatchesFound: '没有符合条件'
            }, "setSelects", rollCodeArray);
            $(".ms-drop input[type='checkbox']").css("display", 'inline-block')
        });

        if ('${authorization.interUserCode}') {
            initSubsySelect('${authorization.interUserCode}');
        }

        form.on("select(user)", function (data) {
            initSubsySelect(data.value);
        });

        var subsyCode = '${authorization.subsyCode}';

        function initSubsySelect(userCode) {
            $("#subsyCode").empty();
            form.render("select", "subsyCode");
            $.get("${ctx}/user/getSubsyListByUserCode",
                {
                    'userCode': userCode
                }, function (data) {
                    $("#subsyCode").append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        $("#subsyCode").append("<option value=\"" + item.subsyCode + "\"" + (item.subsyCode === subsyCode ? "selected" : "") + ">" + item.subsyName + "</option>");
                    });
                    form.render('select', 'subsyCode');
                }, 'json')
        }
        form.verify(verify);

        form.on("submit(*)", function (data) {
            $.post(window.location.pathname,
                data.field,
                function (data) {
                    if (data.status === 200) {
                        layer.alert("${op}授权成功",{closeBtn: 0},  function () {
                            window.location.href = "${ctx}/authorization";
                        })
                    } else {
                        //layer.alert(data.errorMsg)
                        if(data.status === 500){
                            layer.alert("服务器繁忙，请联系管理员，谢谢。");
                        }else {
                            layer.alert(data.msg)
                        }
                    }
                }, 'json');
            return false;
        });

        form.on("submit(back)", function () {
            location.href = "${ctx}/authorization/";
            return false;
        })

        $("#back").on("click", function (event) {
            location.href = "${ctx}/authorization/";
            //setReturnValueFalse(event);
        })
    });

</script>
</body>
</html>