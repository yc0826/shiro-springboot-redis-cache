<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shb" uri="http://www.babysky.com/platform/tags/shb-functions" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>服务管理</title>
    <!-- Bootstrap core CSS -->
    <!--external css-->
    <!-- Custom styles for this template -->
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/multiple-select.css" rel="stylesheet">
    <style>
        /*  */
        .babysky_course_div1{
            display:none !important;
        }
    </style>
</head>

<body>
<div class="row mt wrapper  layui-container ">
    <div class=" layui-row row-style layui-form ">
        <div class="col_main lightshadow form-panel layui-col-md12">

            <!-- 表格开始 -->
            <form:form method="post" commandName="servItemInfo" cssClass="layui-form">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>服务项目</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style">会所名称：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="text" class="layui-input" value="${servItemInfo.subsyName}" readonly >
                        <input type="hidden" id="subsyCode" name="subsyCode" value="${subsyCode}">
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style">服务类型：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="text" class="layui-input" value="${servItemInfo.servCateName}" readonly >
                        <input type="hidden" id="servCateCode" name="servCateCode" value="${servItemInfo.servCateCode}">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style">上级项目：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="text" class="layui-input" value="${servItemInfo.parServItemName}" readonly >
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <c:choose>
                        <c:when test="${servItemInfo.hasDefult != '1'}">
                            <label class="layui-form-label label-style"><span style="color:red">※</span>服务项目：</label>
                            <div class="layui-input-inline inline-adress">
                                <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                                       id="servItemName" name="servItemName" value="${servItemInfo.servItemName}" placeholder="请输入服务项目"  maxlength="16"/>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <label class="layui-form-label label-style">服务项目：</label>
                            <div class="layui-input-inline inline-adress">
                                <input type="text" class="layui-input" value="${servItemInfo.servItemName}" readonly >
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <input type="hidden" id="parServItemCode" name="parServItemCode" value="${itemCode}">
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>响应时间/分钟：</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                               id="solveTimeLimit" name="solveTimeLimit" value="${servItemInfo.solveTimeLimit}" placeholder="请输入响应时间"  maxlength="4"/>
                    </div>
                    <c:if test="${null != servItemInfo.parSolveTimeLimit && '' != servItemInfo.parSolveTimeLimit}">
                        <label class="layui-form-label label-style">输入区间：1-${servItemInfo.parSolveTimeLimit}</label>
                    </c:if>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span> 接收岗位：</label>
                    <div class="layui-input-inline inline-adress">
                        <div class="layui-input-inline">
                            <select id="rollList" multiple="multiple" lay-ignore lay-verify="selectcheck" vb="角色" >
                                <c:forEach items="${rollList}" var="rollList">
                                    <option value="${rollList.rollCode}">${rollList.rollName}</option>
                                </c:forEach>
                            </select>
                            <input type="hidden" id="servRollCode" name="servRollCode" value="">
                        </div>
                        <span style="display: inline-block; height: 38px;line-height: 36px;">(多选)</span>
                    </div>
                </div>
                <div class="layui-form-item layui-row" <c:if test="${servShowPrice != '1'}">style="display: none" </c:if>>
                    <label class="layui-form-label label-style">单价：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="text" class="layui-input" autocomplete="false"
                               id="servItemPrice" name="servItemPrice" value="${servItemInfo.servItemPrice}" placeholder="请输入单价"  maxlength="8"/>
                    </div>
                </div>

                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button class="layui-btn command-btn-submit" lay-submit lay-filter="servItemInfo">保存</button>
                    </div>
                    <div class=" layui-inline">
                        <button id="back" class="layui-btn layui-btn-primary">返回</button>
                    </div>
                </div>
            </form:form>
            <!-- 表格结束-->
            </div>
        </div>
    </div>

<!--main content end-->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>

    //JavaScript代码区域
    layui.use(['form', 'element', 'layer','globalAjax', 'multipleSelect', 'verify', 'upload', 'laydate'], function () {
        var $ = layui.jquery, layer = layui.layer,
            form = layui.form, verify = layui.verify,
            upload = layui.upload,
            laydate = layui.laydate;

        var rollCode = '${servItemInfo.servRollCode}';
        var rollArray = [];
        if (rollCode) {
            rollArray = rollCode.split(",");
        }

        $(function () {
            $('#rollList').change(function () {
                $("#servRollCode").val($(this).val())
            }).multipleSelect({
                placeholder: "多选",
                filter: true,
                selectAll: false,
                allSelected: false,
                countSelected: false,
                width: '100%',
                noMatchesFound: '没有符合条件'
            }, "setSelects", rollArray);
            $(".ms-drop input[type='checkbox']").css("display", 'inline-block');
        });

        //监听提交
        form.on('submit(servItemInfo)', function (data) {
            var checkSolveTimeLimit = /^\+?[1-9][0-9]*$/;　　//判断是否为正整数
            if(!checkSolveTimeLimit.test($("#solveTimeLimit").val())){
                layer.alert("响应时间/分钟格式不正确。");
                return false;
            }

            var checkServItemPrice =  /^(-)?\d+(\.\d+)?$/;　　//验证是否为数字
            if("" != $("#servItemPrice").val() && !checkServItemPrice.test($("#servItemPrice").val())){
                layer.alert("单价格式不正确。");
                return false;
            }

            var parSolveTimeLimit = '${servItemInfo.parSolveTimeLimit}';
            if('' != parSolveTimeLimit){
                if(parseInt($("#solveTimeLimit").val()) > parseInt(parSolveTimeLimit))
                {
                    layer.alert("响应时间不在区间之内。");
                    return false;
                }
            }

            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if(data.status === 200) {
                        layer.open({
                            content: '保存成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                window.location.href = "${ctx}/servi/${subsyCode}/list";
                            }
                            ,cancel: function(){
                                return false;
                            }
                        });
                    } else {
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

        form.verify(verify);

        $("#back").on("click", function(event){
            location.href = "${ctx}/servi/${subsyCode}/list";
            setReturnValueFalse(event);
        })
    });

</script>
</body>
</html>
