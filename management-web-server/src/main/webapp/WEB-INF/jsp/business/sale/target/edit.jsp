<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shb" uri="http://www.babysky.com/platform/tags/shb-functions" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>销售指标</title>
    <!-- Bootstrap core CSS -->
    <!--external css-->
    <!-- Custom styles for this template -->
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <style>
        /*  */
        .babysky_course_div1{
            display:none !important;
        }
    </style>
</head>

<body>
<div class="row mt wrapper  layui-container ">
    <form class="layui-form">
    <div class=" layui-row row-style ">
        <div class="col_main lightshadow form-panel layui-col-md12">

            <!-- 表格开始 -->

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>销售指标</legend>
                </fieldset>



                <div class="layui-form-item layui-row layui-form">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>会所名称：</label>
                    <div class="layui-input-inline inline-adress" style="padding: 10px 2px;">
                            ${entity.subsyName}
                                <input type="hidden" id="subsyCode" name="subsyCode" value="${entity.subsyCode}">
                                <input type="hidden" id="tranSalesTargetCode" name="tranSalesTargetCode" value="${entity.tranSalesTargetCode}">
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>销售名称：</label>
                    <div class="layui-input-inline inline-adress" style="padding: 10px 2px;">
                            ${entity.interUserName}
                                <input type="hidden" id="interUserCode" name="interUserCode" value="${entity.interUserCode}">
                    </div>
                </div>

            <div class="layui-form-item layui-row">
                <label class="layui-form-label label-style"><span style="color:red">※</span>分配比例：</label>
                <div class="layui-input-inline inline-adress">
                    <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                           id="ratio" name="ratio" value="${entity.ratio}"  placeholder="输入分配比例" maxlength="2"  />

                </div>
            </div>

                <div class="layui-form-item layui-row">

                <label class="layui-form-label label-style">选择时间：</label>
                <div class="layui-input-inline" style="padding: 10px 2px;">
                    ${entity.year}
                        <input type="hidden" id="year" name="year" value="${entity.year}">
                </div>

            </div>

            <div class="layui-form-item layui-row">

                <label class="layui-form-label label-style"></label>
                <div class="layui-input-inline" style="padding: 10px 2px;">
                    <span style="color:red">分配比例总数为10.列如配置50%则填5.</span>

                </div>

            </div>

                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button class="layui-btn command-btn-submit" lay-submit lay-filter="salesTargetSave">保存</button>
                    </div>
                    <div class=" layui-inline">
                        <button type="button" id="back" class="layui-btn layui-btn-primary">返回</button>
                    </div>
                </div>
            <!-- 表格结束-->
            </div>

        </div>

    </form>
</div>

<!--main content end-->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>


    //JavaScript代码区域
    layui.use(['form', 'element', 'layer', 'globalAjax', 'multipleSelect', 'upload', 'laydate'], function () {

        var $= layui.jquery, element = layui.element, layer = layui.layer, upload = layui.upload, multipleSelect = layui.multipleSelect;
        var form = layui.form,
            laydate = layui.laydate;

        //监听提交
        form.on('submit(salesTargetSave)', function (data) {
            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if(data.status === 200) {
                        layer.alert("保存成功",{closeBtn: 0},  function () {
                            window.location.href = "${ctx}/saleTarget/list";
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


        $("#back").on("click", function(event){
            location.href = "${ctx}/saleTarget/list";
        });

            // console.log( "count",$(".count").find("input").val())

    });


</script>
</body>
</html>
