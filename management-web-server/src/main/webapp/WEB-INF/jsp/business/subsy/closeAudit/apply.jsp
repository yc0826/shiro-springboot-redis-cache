<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>会所申请</title>

    <!-- Bootstrap core CSS -->
    <!--external css-->
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">

    <style>
        .img-box {
            position: relative;
            display: inline-block;
            margin-right: 10px;
        }

        .del-icon {
            background-color: grey;
            position: absolute;
            right: -8px;
            top: -8px;
            color: #fff;
            border: 1px solid;
            border-radius: 15px;
            width: 27px;
            height: 27px;
            font-size: 18px;
            text-align: center;
            cursor: pointer;
        }

        /*.indexTab {*/
            /*pointer-events: none;*/
            /*cursor: default;*/
            /*opacity: 0.6;*/
            /*cursor: not-allowed;*/
        /*}*/
    </style>


    <style>
        .upload_box {
            display: none;
        }
    </style>



</head>

<body>
<div class="row mt wrapper  layui-container ">
    <div class=" layui-row row-style" style="background-color: #fff;">
        <form class="layui-form" action="">
            <input type="hidden" name="subsyCode" class="subsyCode" value="${auditInfo.subsyCode}">
            <input type="hidden" name="isAllowAuditSubsy" class="isAllowAuditSubsy" value="${auditInfo.isAllowAuditSubsy}">
            <input type="hidden" name="isAllowAuditProduct" class="isAllowAuditProduct" value="${auditInfo.isAllowAuditProduct}">



            <c:if test="${(auditInfo.isAllowSubmitCloseApply != null && auditInfo.isAllowSubmitCloseApply == 1) }">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>会所关闭申请</legend>
                </fieldset>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span style="color:red">※</span>关闭原因</label>
                    <div class="layui-input-inline">
                        <textarea placeholder="请输入关闭原因" name="submitDesc" class="layui-textarea" lay-verify="required" maxlength="256"></textarea>
                    </div>
                </div>
                <div class="layui-form-item btn-position">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-danger" lay-submit="" lay-filter="submitCloseSubsyApply" vb="1">提交</button>
                    </div>
                    <div class=" layui-inline">
                        <button type="button" class="layui-btn layui-btn-primary backBtn">返回</button>
                    </div>
                </div>
            </c:if>

            <c:if test="${(auditInfo.isAllowAuditSubsyClose != null && auditInfo.isAllowAuditSubsyClose == 1) }">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>会所关闭审核信息</legend>
                </fieldset>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span style="color:red">※</span>审核备注</label>
                    <div class="layui-input-inline">
                        <textarea placeholder="请输入审核备注" name="submitDesc" class="layui-textarea" lay-verify="required" maxlength="256"></textarea>
                    </div>
                </div>
                <div class="layui-form-item btn-position">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="submitCloseAuditResult" vb="1">同意</button>
                    </div>
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-danger" lay-submit="" lay-filter="submitCloseAuditResult" vb="0">拒绝</button>
                    </div>
                    <div class=" layui-inline">
                        <button type="button" class="layui-btn layui-btn-primary backBtn">返回</button>
                    </div>
                </div>
            </c:if>
            <c:if test="${(auditInfo.isAllowSubmitCloseApply == null || auditInfo.isAllowSubmitCloseApply != 1) && (auditInfo.isAllowAuditSubsyClose == null || auditInfo.isAllowAuditSubsyClose != 1) }">
                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button type="button" class="layui-btn layui-btn-primary backBtn">返回</button>
                    </div>
                </div>
            </c:if>

        </form>

        <div class="layui-tab" lay-filter="subsyAuditTab">
            <ul class="layui-tab-title indexTab">
                <li class="layui-this" lay-id="0">会所信息</li>
                <li lay-id="1">房型产品</li>
                <%--<li lay-id="2">月嫂</li>--%>
                <li lay-id="3">月子餐产品</li>
                <li lay-id="4">增值服务</li>
                <li lay-id="5">母婴商品</li>
                <li lay-id="6">产后修复产品</li>
            </ul>
            <div class="layui-tab-content">
                <%@include file="base_info_readOnly.jsp" %>
                <%@include file="room_type.jsp" %>
                <%@include file="yue_zi_can.jsp" %>
                <%@include file="zeng_zhi_fu_wu.jsp" %>
                <%@include file="mu_ying_chan_pin.jsp" %>
                <%@include file="chan_hou_xiu_fu.jsp" %>
            </div>
        </div>

        <div class="layui-form-item btn-position" style="padding: 50px;">
            <%--<div class=" layui-inline">--%>
                <%--<button class="layui-btn" lay-submit="" lay-filter="submitSubsyBase">提交审核</button>--%>
            <%--</div>--%>
            <%--<div class=" layui-inline">--%>
                <%--<button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>--%>
            <%--</div>--%>
        </div>
    </div>
</div>

<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    layui.use(['form', 'jquery', 'globalAjax', 'upload', 'verify', 'jqueryStep', 'element'], function () {
        var $ = layui.jquery, form = layui.form, element = layui.element,
            layer = layui.layer, upload = layui.upload, verify = layui.verify,
            jqueryStep = layui.jqueryStep;
        form.verify(verify);
        var $step = $("#step");
        var $index = $("#index");

        $step.step({
            index: 0,
            time: 500,
            title: ["会所信息", "添加房型", "添加月子餐"]
        });

        // var layid = location.hash.replace(/^#subsyAuditTab=/, '');//根据hash来改变tab
        // alert(layid);
        // element.tabChange('subsyAuditTab', layid);
        $(".prev-step").on("click", function () {
            $step.prevStep();
            element.tabChange('subsyAuditTab', $step.getIndex());//传入相应的lay-id属性，下面tab切换
        });//上一步

        // $(".next-step").on("click", function (event) {
        //     $step.nextStep();
        //     // $step.toStep(2);//改变某一个步骤的样式传入相应tab的lay-id
        //     element.tabChange('subsyAuditTab', $step.getIndex());//传入相应的lay-id属性，下面tab切换
        //     //setReturnValueFalse(event);
        // });//下一步。
        //监听Tab切换，以改变地址hash值
        element.on('tab(subsyAuditTab)', function () {
            location.hash = 'subsyAuditTab=' + $(this).attr('lay-id');
            // $step.toStep( this.getAttribute('lay-id'))
        });


        $(function () {
            initProv("${auditInfo.mstSubsyBaseEntity.loctProvCode}", "loctProvCode");
            initRegLoctProvCode("${auditInfo.mstSubsyAddEntity.regLoctProvCode}", "regLoctProvCode")
        });


        function initProv(provCode, domId) {
            var provSelect = $("#" + domId);
            $.post("${ctx}/common/region/getProvList",
                function (data) {
                    provSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === provCode) {
                            initCity(provCode, '${auditInfo.mstSubsyBaseEntity.loctCityCode}', "loctCityCode");
                            flg = true;
                        }
                        provSelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + " >" + item.regionName + "</option>")
                    });
                    form.render('select', domId);

                }, 'json');
        }

        function initCity(provCode, cityCode, domId) {
            var citySelect = $("#" + domId);
            $.post("${ctx}/common/region/getListByParentCode",
                {
                    parentCode: provCode
                }, function (data) {
                    citySelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === cityCode) {
                            initArea(cityCode, '${auditInfo.mstSubsyBaseEntity.loctAreaCode}', "loctAreaCode");
                            flg = true;
                        }
                        citySelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + ">" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                },
                'json')
        }

        function initArea(cityCode, areaCode, domId) {
            var areaSelect = $("#" + domId);
            $.post("${ctx}/common/region/getListByParentCode",
                {
                    parentCode: cityCode
                }, function (data) {
                    areaSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === areaCode) {
                            flg = true;
                        }
                        areaSelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + ">" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                },
                'json')
        }

        function initRegLoctProvCode(provCode, domId) {
            var provSelect = $("#" + domId);
            $.post("${ctx}/common/region/getProvList",
                function (data) {
                    provSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === provCode) {
                            initRegLoctCity(provCode, '${auditInfo.mstSubsyAddEntity.regLoctCityCode}', "regLoctCityCode");
                            flg = true;
                        }
                        provSelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + " >" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                },
                'json');
        }

        function initRegLoctCity(provCode, cityCode, domId) {
            var regLoctCitySelect = $("#" + domId);
            $.post("${ctx}/common/region/getListByParentCode",
                {
                    parentCode: provCode
                }, function (data) {
                    regLoctCitySelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === cityCode) {
                            flg = true;
                        }
                        regLoctCitySelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + ">" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                },
                'json')
        }


        form.on('select(reg_loct_prov_code)', function (data) {
            var regLoctCitySelect = $("#regLoctCityCode");
            //清空市
            regLoctCitySelect.empty();
            form.render('select', "regLoctCityCode");
            //清空区
            $.post("${ctx}/common/region/getListByParentCode",
                {
                    parentCode: data.value
                }, function (data) {
                    regLoctCitySelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        regLoctCitySelect.append("<option value=\"" + item.regionId + "\">" + item.regionName + "</option>")
                    });
                    form.render('select', "regLoctCityCode");
                }, 'json')
        });


        form.on('select(loct_prov_code)', function (data) {
            var loctCitySelect = $("#loctCityCode");
            var loctAreaSelect = $("#loctAreaCode");
            //清空市
            loctCitySelect.empty();
            form.render('select', "loctCityCode");
            //清空区
            loctAreaSelect.empty();
            form.render('select', "loctAreaCode");
            if (data && data.value) {
                $.post("${ctx}/common/region/getListByParentCode",
                    {
                        parentCode: data.value
                    }, function (data) {
                        loctCitySelect.append("<option value=''>请选择</option>");
                        $.each(data, function (index, item) {
                            loctCitySelect.append("<option value=\"" + item.regionId + "\">" + item.regionName + "</option>")
                        });
                        form.render('select', "loctCityCode");
                    }, 'json')
            }

        });

        form.on('select(loct_city_code)', function (data) {
            var loctAreaSelect = $("#loctAreaCode");
            //清空区
            loctAreaSelect.empty();
            form.render('select', "loctAreaCode");
            if (data && data.value) {
                $.post("${ctx}/common/region/getListByParentCode",
                    {
                        parentCode: data.value
                    }, function (data) {
                        loctAreaSelect.append("<option value=''>请选择</option>");
                        $.each(data, function (index, item) {
                            loctAreaSelect.append("<option value=\"" + item.regionId + "\">" + item.regionName + "</option>")
                        });
                        form.render('select', "loctAreaCode");
                    },
                    'json')
            }
        });



        function replaceAll(str, searchStr, repStr) {
            var aryStr = str.split(searchStr);
            var rsStr = "";
            for (var i = 0; i < aryStr.length; i++) {
                if (i === aryStr.length - 1) {
                    rsStr += aryStr[i];
                } else {
                    rsStr += (aryStr[i] + String(repStr));
                }
            }
            return rsStr;
        }

        //处理序号
        function rankTable(resourceContent) {
            $("#" + resourceContent).find("tr").each(function (index) {
                $(this).children().eq(0).html(index + 1);
            });
        }

        //删除行
        $(document).on("click", ".delRow", function () {
            if (confirm("确认删除吗?")) {
                var orderProdCode = $(this).prev().prev().val();
                var subsyCode= $(this).prev().val();
                if(subsyCode == null){
                    alert('会所代码为空');
                }
                if(delProd(orderProdCode,subsyCode) == true){
                    var resourceContent = $(this).parent().parent().parent().attr("id");
                    $(this).parent().parent().remove();
                    rankTable(resourceContent);
                }
            }


        });



        $(".backBtn").on("click", function(event){
            location.href = "${ctx}/subsyCloseAudit/";
            //setReturnValueFalse(event);
        });


        //提交审核结果按钮，提交产品审核结果按钮
        form.on('submit(submitCloseAuditResult)', function (data) {
            var url = "${ctx}/subsyCloseAudit/submitCloseAuditResult";
            //$("#submitResult").val($(this).attr("vb"));
            data.field.submitResult = $(this).attr("vb");
            $.ajax({
                url: url,
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        $(".subsyCode").val(data.subsyCode);
                        layer.open({
                            content: '提交成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                window.location.href = "${ctx}/subsyCloseAudit/";
                            }
                            ,cancel: function(){
                                return false;
                            }
                        });

                        //$step.nextStep();
                        //element.tabChange('subsyAuditTab', $step.getIndex());//传入相应的lay-id属性，下面tab切换
                    } else {
                        //layer.alert(data.errorMsg)
                        if(data.status === 500) {
                            layer.alert("服务器繁忙，请联系管理员，谢谢。");
                        }else if(data.status === 555){
                            layer.alert(data.errorMsg)
                        }else {
                            layer.alert(data.msg)
                        }
                    }
                }
            });
            return false;
        });


        //提交关闭审核申请
        form.on('submit(submitCloseSubsyApply)', function (data) {
            $.ajax({
                url: "${ctx}/subsyCloseAudit/submitCloseSubsyApply",
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        $(".subsyCode").val(data.subsyCode);
                        layer.open({
                            content: '提交成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                window.location.href = "${ctx}/subsyCloseAudit/";
                            }
                            ,cancel: function(){
                                return false;
                            }
                        });
                    } else {
                        //layer.alert(data.errorMsg)
                        if(data.status === 500) {
                            layer.alert("服务器繁忙，请联系管理员，谢谢。");
                        }else if(data.status === 555){
                            layer.alert(data.errorMsg)
                        }else {
                            layer.alert(data.msg)
                        }
                    }
                }
            });
            return false;
        });





        //查看产品
        $(document).on("click", ".btnViewProd", function () {
            var subsyCode = $(this).prev().val();
            var orderProdCode = $(this).attr("orderProdCode");
            var prodTypeCode = $(this).attr("prodTypeCode");
            var layerId = layer.open({
                title: "编辑",
                area: ['1000px', '800px'],
                type: 2,
                content: '${ctx}/subsyAudit/openProdView/' + subsyCode + '/' + prodTypeCode + '/' +  orderProdCode,
                end: function(){
                    rebuildProdListHtml(prodTypeCode);
                }
            });
        });


        console.log("isAllowOpenCloseSubsy=${auditInfo.isAllowOpenCloseSubsy}" + "isAllowEditProduct=${auditInfo.isAllowEditProduct}  isAllowAuditProduct=${auditInfo.isAllowAuditProduct}  isAllowAuditSubsy=${auditInfo.isAllowAuditSubsy}  isAllowEditSubsy=${auditInfo.isAllowEditSubsy}");
    });
</script>
<!-- js placed at the end of the document so the pages load faster -->

</body>
</html>