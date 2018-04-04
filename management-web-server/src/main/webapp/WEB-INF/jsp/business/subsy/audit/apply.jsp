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
    <div class="layui-row row-style row-step">
        <div id="step"></div>
        <div class="btns" style="display: none">
            <button id="prevBtn">上一步</button>
            <button id="nextBtn">下一步apply</button>
        </div>
    </div>
    <div class=" layui-row row-style" style="background-color: #fff;">
        <form class="layui-form" action="">
            <input type="hidden" name="subsyCode" class="subsyCode" value="${auditInfo.subsyCode}">
            <input type="hidden" name="isAllowAuditSubsy" class="isAllowAuditSubsy" value="${auditInfo.isAllowAuditSubsy}">
            <input type="hidden" name="isAllowAuditProduct" class="isAllowAuditProduct" value="${auditInfo.isAllowAuditProduct}">



            <c:if test="${(auditInfo.isAllowOpenCloseSubsy != null && auditInfo.isAllowOpenCloseSubsy == 1) }">
                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        会所开关：
                        <c:if test="${(auditInfo.mstSubsyBaseEntity.subsyActivFlg != null && auditInfo.mstSubsyBaseEntity.subsyActivFlg == 1)}">
                            <input type="checkbox" name="subsyActivFlg" lay-skin="switch" lay-filter="subsyActivFlg" lay-text="开|关" checked="checked" >
                        </c:if>
                        <c:if test="${(auditInfo.mstSubsyBaseEntity.subsyActivFlg == null || auditInfo.mstSubsyBaseEntity.subsyActivFlg == 0)}">
                            <input type="checkbox" name="subsyActivFlg" lay-skin="switch" lay-filter="subsyActivFlg" lay-text="开|关">
                        </c:if>
                        <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="submitOpenCloseSubsy" vb="1">提交</button>
                    </div>
                </div>
            </c:if>


            <c:if test="${(auditInfo.isAllowAuditSubsy != null && auditInfo.isAllowAuditSubsy == 1) || (auditInfo.isAllowAuditProduct != null && auditInfo.isAllowAuditProduct == 1)}">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>审核信息</legend>
                </fieldset>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span style="color:red">※</span>审核备注</label>
                    <div class="layui-input-inline">
                        <textarea placeholder="请输入审核备注" name="approveDesc" class="layui-textarea" lay-verify="required" maxlength="256"></textarea>
                    </div>
                </div>
                <div class="layui-form-item btn-position">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="submitAuditResult" vb="1">同意</button>
                    </div>
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-danger" lay-submit="" lay-filter="submitAuditResult" vb="0">拒绝</button>
                    </div>
            </c:if>
            <c:if test="${(auditInfo.isAllowAuditSubsy == null || auditInfo.isAllowAuditSubsy != 1) && (auditInfo.isAllowAuditProduct == null || auditInfo.isAllowAuditProduct != 1)}">
                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button type="button" class="layui-btn layui-btn-primary backBtn">返回</button>
                    </div>
                </div>
            </c:if>
            <c:if test="${(auditInfo.isAllowAuditSubsy != null && auditInfo.isAllowAuditSubsy == 1) || (auditInfo.isAllowAuditProduct != null && auditInfo.isAllowAuditProduct == 1)}">
                    <div class=" layui-inline">
                        <button type="button" class="layui-btn layui-btn-primary backBtn">返回</button>
                    </div>
                </div>
            </c:if>
        </form>

        <div class="layui-tab" lay-filter="subsyAuditTab">
            <ul class="layui-tab-title indexTab">
                <li class="layui-this" lay-id="0">会所信息</li>
                <c:if test="${(pageMode!=null && pageMode=='readonly') || (auditInfo.isAllowEditProduct != null && auditInfo.isAllowEditProduct == 1) || (auditInfo.isAllowAuditProduct != null && auditInfo.isAllowAuditProduct == 1)}">
                    <li lay-id="1">房型产品</li>
                    <%--<li lay-id="2">月嫂</li>--%>
                    <li lay-id="3">月子餐产品</li>
                    <li lay-id="4">增值服务(可选)</li>
                    <li lay-id="5">母婴商品(可选)</li>
                    <li lay-id="6">产后修复产品(可选)</li>
                </c:if>
            </ul>
            <div class="layui-tab-content">
                <c:if test="${pageMode!=null && pageMode=='readonly'}">
                    <%@include file="base_info_readOnly.jsp" %>
                </c:if>
                <c:if test="${pageMode==null || pageMode!='readonly'}">
                    <%@include file="base_info.jsp" %>
                </c:if>

                <c:if test="${(pageMode!=null && pageMode=='readonly') || (auditInfo.isAllowEditProduct != null && auditInfo.isAllowEditProduct == 1) || (auditInfo.isAllowAuditProduct != null && auditInfo.isAllowAuditProduct == 1)}">
                    <%@include file="room_type.jsp" %>
                    <%@include file="yue_zi_can.jsp" %>
                    <%@include file="zeng_zhi_fu_wu.jsp" %>
                    <%@include file="mu_ying_chan_pin.jsp" %>
                    <%@include file="chan_hou_xiu_fu.jsp" %>
                </c:if>
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
    layui.use(['form', 'jquery', 'globalAjax', 'upload', 'verify', 'jqueryStep', 'element', 'laydate'], function () {
        var $ = layui.jquery, form = layui.form, element = layui.element,
            layer = layui.layer, upload = layui.upload, verify = layui.verify,
            laydate = layui.laydate,
            jqueryStep = layui.jqueryStep;
        form.verify(verify);
        var $step = $("#step");
        var $index = $("#index");

        $step.step({
            index: ${auditStep},
            time: 500,
            title: ["会所信息", "添加产品", "会所开通"]
        });

        //日期
        laydate.render({
            elem: '#subsyActivStartTimeDisplay'

        });

        // var layid = location.hash.replace(/^#subsyAuditTab=/, '');//根据hash来改变tab
        // alert(layid);
        // element.tabChange('subsyAuditTab', layid);
        $(".prev-step").on("click", function () {
            //$step.prevStep();
            //$step.nextStep();

            //<button type="button" class="layui-btn layui-btn-primary prev-step">上一步</button>
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

        function getSubsyName() {
            var subsyName = $("#subsyName");
            subsyName.val("");

            var brandCode = $("#brandCode");
            var brandCodeValue = brandCode.val();
            var brandCodeName = brandCode.find("option:selected").text();

            var subsyBrandType = $("#subsyBrandType");
            var subsyBrandTypeValue = subsyBrandType.val();
            var subsyBrandTypeName = subsyBrandType.find("option:selected").text();

            var prov = $("#loctProvCode");
            var provCode = prov.val();
            var provName = prov.find("option:selected").text();

            var cityCode = $("#loctCityCode");
            var cityCodeCode = cityCode.val();
            var cityCodeValue = cityCode.find("option:selected").text();

            var areaCode = $("#loctAreaCode");
            var areaCodeValue = areaCode.val();
            var areaCodeName = areaCode.find("option:selected").text();

            if (brandCodeName == null || brandCodeName == "") {
                return "";
            }
            if (subsyBrandTypeName == null || subsyBrandTypeName == "" || subsyBrandTypeName == "请选择") {
                return "";
            }
            if (provName == null || provName == "") {
                return "";
            }
            if (cityCodeValue == null || cityCodeValue == "") {
                return "";
            }
            if (areaCodeName == null || areaCodeName == "") {
                return "";
            }


            provName = provName.replace("省","");
            provName = provName.replace("市","");
            cityCodeValue = cityCodeValue.replace("省","");
            cityCodeValue = cityCodeValue.replace("市","");
            areaCodeName = areaCodeName.replace("区","");

            var subsyNameLocation = "";
            if (provName == cityCodeValue) {
                subsyNameLocation = provName + areaCodeName;
            }else{
                subsyNameLocation = provName + cityCodeValue;
            }



            subsyName.val("（" + brandCodeName + "）月子会所" + subsyNameLocation + subsyBrandTypeName);
        }

        //品牌类型
        form.on('select(subsyBrandType)', function (data) {
            // var subsyBrandType = $("#subsyBrandType");
            // var subsyBrandTypeValue = subsyBrandType.val();
            // var subsyBrandTypeName = subsyBrandType.find("option:selected").text();

            getSubsyName();
        });
        //品牌
        form.on('select(brandCode)', function (data) {
            // var brandCode = $("#brandCode");
            // var brandCodeValue = brandCode.val();
            // var brandCodeName = brandCode.find("option:selected").text();
            getSubsyName();
        });

        //省
        form.on('select(loct_prov_code)', function (data) {

            // var prov = $("#loctProvCode");
            // var provCode = prov.val();
            // var provName = prov.find("option:selected").text();


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


            getSubsyName();
        });

        //市
        form.on('select(loct_city_code)', function (data) {
            getSubsyName();
            // var cityCode = $("#loctCityCode");
            // var cityCodeCode = cityCode.val();
            // var cityCodeValue = cityCode.find("option:selected").text();


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
        //区
        form.on('select(loct_area_code)', function (data) {
            getSubsyName();
            // var areaCode = $("#loctAreaCode");
            // var areaCodeValue = areaCode.val();
            // var areaCodeName = areaCode.find("option:selected").text();



        });

        //xxxxxxxxxxxxxxxxx监听提交 （会所基本页面保存，下一步按钮）
        form.on('submit(saveSubsyBase)', function (data) {
            $.ajax({
                url: "${ctx}/subsyAudit/submitSubsyBase",
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        $(".subsyCode").val(data.subsyCode);
                        $step.nextStep();
                        element.tabChange('subsyAuditTab', $step.getIndex());//传入相应的lay-id属性，下面tab切换
                    } else {
                        //layer.alert(data.errorMsg)ssssssssssssss
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




        //会所基本页面， 提交审核按钮
        form.on('submit(submitSubsyBase)', function (data) {
            $.ajax({
                url: "${ctx}/subsyAudit/submitSubsyBase",
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
                                window.location.href = "${ctx}/subsyAudit/";
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



        //提交审核结果按钮，提交产品审核结果按钮
        form.on('submit(submitAuditResult)', function (data) {
            var submitSubsyAuditUrl = "${ctx}/subsyAudit/submitSubsyAuditResult";
            var submitProdAuditUrl = "${ctx}/subsyAudit/submitProdAuditResult";
            var url = "";
            var isAllowAuditSubsy = $(".isAllowAuditSubsy").val();
            var isAllowAuditProduct = $(".isAllowAuditProduct").val();
            if(isAllowAuditSubsy == 1 && isAllowAuditProduct == 1){
                layer.alert("出现错误，无法提交，请联系管理员ERR001。");
                return false;
            }

            if(isAllowAuditSubsy == 0 && isAllowAuditProduct == 0){
                layer.alert("出现错误，无法提交，请联系管理员ERR002。");
                return false;
            }

            if(typeof(isAllowAuditSubsy) == "undefined" || typeof(isAllowAuditSubsy) == "undefined"){
                layer.alert("出现错误，无法提交，请联系管理员ERR003。");
                return false;
            }
            if(isAllowAuditSubsy == 1){
                url = submitSubsyAuditUrl;
            }else if(isAllowAuditProduct == 1){
                url = submitProdAuditUrl;
            }else {
                layer.alert("出现错误，无法提交，请联系管理员ERR003。");
                return false;
            }

            $("#approveResult").val($(this).attr("vb"));
            data.field.approveResult = $(this).attr("vb");
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
                                window.location.href = "${ctx}/subsyAudit/";
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


        //提交产品审核
        form.on('submit(submitProdApply)', function (data) {
            $.ajax({
                url: "${ctx}/subsyAudit/submitProdApply",
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
                                window.location.href = "${ctx}/subsyAudit/";
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
                var orderProdCode = $(this).prev().prev().prev().val();
                var subsyCode= $(this).prev().prev().val();
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

        //删除图片
        $(document).on("click", ".del-icon", function () {
            delPic(this);
        });

        //删除图片公共方法
        function delPic(obj) {
            var vb = $(obj).parent().attr("vb");
            var value = $(obj).parent().parent().find("input").val();
            value = ("," + value + ",").replace("," + vb + ",", "");
            $(obj).parent().parent().find("input").val(value.replace(/(^,*)|(,*$)/g, ""));
            $(obj).parent().remove();
        }

        /* 房型开始 */
        var roomTypeIndex = 0;
        <%--<c:if test="${!empty auditInfo.mstOrderProdEntityList}">--%>
            <%--roomTypeIndex = "${fn:length(auditInfo.mstOrderProdEntityList)}";--%>
        <%--</c:if>--%>
        // form.on("submit(addRoomType)", function (data) {
        //     appendRoomTyeProd(data.field);
        //     return false;
        // });

        function appendRoomTyeProd(obj, data_form) {
            var targetHtml = replaceAll($("#roomType_mock").html(), "$$ROWNUM$$", roomTypeIndex);
            targetHtml = replaceAll(targetHtml, "orderProd_prodTypeCode", obj.prodTypeCode);
            targetHtml = replaceAll(targetHtml, "orderProd_orderProdCode", obj.orderProdCode);

            var $roomType_content = $("#roomType_content");
            $roomType_content.append(targetHtml);
            $roomType_content.find(".prodName_span_" + roomTypeIndex).html(obj.prodName);
            $roomType_content.find(".prodAmt_span_" + roomTypeIndex).html(obj.prodAmt);
            //$roomType_content.find(".roomTypeDesc_span_" + roomTypeIndex).html(obj.roomTypeDesc);

            $roomType_content.find(".prodName_" + roomTypeIndex).val(obj.prodName);
            $roomType_content.find(".roomTypeArea_" + roomTypeIndex).val(obj.roomTypeArea);
            $roomType_content.find(".bannerCode_" + roomTypeIndex).val(obj.bannerCode);
            $roomType_content.find(".thumbnailCode_" + roomTypeIndex).val(obj.thumbnailCode);
            $roomType_content.find(".detailCodes_" + roomTypeIndex).val(obj.detailCodes);
            $roomType_content.find(".prodAmt_" + roomTypeIndex).val(obj.prodAmt);
            //$roomType_content.find(".roomTypeDesc_" + roomTypeIndex).val(obj.roomTypeDesc);
            $roomType_content.find(".prodDesc_" + roomTypeIndex).val(obj.prodDesc);
            $roomType_content.find(".prodTypeCode_" + roomTypeIndex).val(obj.prodTypeCode);
            $roomType_content.find(".orderProdCode").val(obj.orderProdCode);
            $roomType_content.find(".subsyCode").val(obj.subsyCode);


            roomTypeIndex++;
            rankTable("roomType_content");


            //清空表单
            $(':input','#roomTypeForm')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
            //清空图片
            $(".img-box").remove();
            data_form.find("input[name='bannerCode']").val("");
            data_form.find("input[name='thumbnailCode']").val("");
            data_form.find("input[name='detailCodes']").val("");
            // $("input[name='roomType_bannerCode']").val("");
            // $("input[name='roomType_thumbnailCode']").val("");
            // $("input[name='roomType_detailCodes']").val("");
        }
        /* 房型结束 */



        /* 月子餐开始 */
        var yuezicanIndex = 0;
        function appendYuezicanProd(obj, data_form) {
            var targetHtml = replaceAll($("#yuezican_mock").html(), "$$ROWNUM$$", yuezicanIndex);
            targetHtml = replaceAll(targetHtml, "orderProd_prodTypeCode", obj.prodTypeCode);
            targetHtml = replaceAll(targetHtml, "orderProd_orderProdCode", obj.orderProdCode);

            var $yuezican_content = $("#yuezican_content");
            $yuezican_content.append(targetHtml);
            $yuezican_content.find(".prodName_span_" + yuezicanIndex).html(obj.prodName);
            $yuezican_content.find(".prodAmt_span_" + yuezicanIndex).html(obj.prodAmt);
            $yuezican_content.find(".prodDesc_span_" + yuezicanIndex).html(obj.prodDesc);

            $yuezican_content.find(".prodName_" + yuezicanIndex).val(obj.prodName);
            $yuezican_content.find(".bannerCode_" + yuezicanIndex).val(obj.bannerCode);
            $yuezican_content.find(".thumbnailCode_" + yuezicanIndex).val(obj.thumbnailCode);
            $yuezican_content.find(".detailCodes_" + yuezicanIndex).val(obj.detailCodes);
            $yuezican_content.find(".prodAmt_" + yuezicanIndex).val(obj.prodAmt);
            $yuezican_content.find(".prodTypeCode_" + yuezicanIndex).val(obj.prodTypeCode);
            $yuezican_content.find(".prodDesc_" + yuezicanIndex).val(obj.prodDesc);
            $yuezican_content.find(".prodTypeCode_" + yuezicanIndex).val(obj.prodTypeCode);
            $yuezican_content.find(".orderProdCode").val(obj.orderProdCode);
            $yuezican_content.find(".subsyCode").val(obj.subsyCode);
            yuezicanIndex++;
            rankTable("yuezican_content");


            //清空表单
            $(':input','#yuezicanForm')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
            //清空图片
            $(".img-box").remove();

            data_form.find("input[name='bannerCode']").val("");
            data_form.find("input[name='thumbnailCode']").val("");
            data_form.find("input[name='detailCodes']").val("");
            // $("input[name='yuezican_bannerCode']").val("");
            // $("input[name='yuezican_thumbnailCode']").val("");
            // $("input[name='yuezican_detailCodes']").val("");

            form.render();
        }
        /* 月子餐结束 */

        /* 增值服务开始 */
        var zengzhifuwuIndex = 0;
        function appendZengzhifuwuProd(obj, data_form) {
            var targetHtml = replaceAll($("#zengzhifuwu_mock").html(), "$$ROWNUM$$", zengzhifuwuIndex);
            targetHtml = replaceAll(targetHtml, "orderProd_prodTypeCode", obj.prodTypeCode);
            targetHtml = replaceAll(targetHtml, "orderProd_orderProdCode", obj.orderProdCode);

            var $zengzhifuwu_content = $("#zengzhifuwu_content");
            $zengzhifuwu_content.append(targetHtml);
            $zengzhifuwu_content.find(".prodName_span_" + zengzhifuwuIndex).html(obj.prodName);
            $zengzhifuwu_content.find(".prodAmt_span_" + zengzhifuwuIndex).html(obj.prodAmt);
            $zengzhifuwu_content.find(".prodDesc_span_" + zengzhifuwuIndex).html(obj.prodDesc);

            $zengzhifuwu_content.find(".prodName_" + zengzhifuwuIndex).val(obj.prodName);
            $zengzhifuwu_content.find(".bannerCode_" + zengzhifuwuIndex).val(obj.bannerCode);
            $zengzhifuwu_content.find(".thumbnailCode_" + zengzhifuwuIndex).val(obj.thumbnailCode);
            $zengzhifuwu_content.find(".detailCodes_" + zengzhifuwuIndex).val(obj.detailCodes);
            $zengzhifuwu_content.find(".prodAmt_" + zengzhifuwuIndex).val(obj.prodAmt);
            $zengzhifuwu_content.find(".prodTypeCode_" + zengzhifuwuIndex).val(obj.prodTypeCode);
            $zengzhifuwu_content.find(".prodDesc_" + zengzhifuwuIndex).val(obj.prodDesc);
            $zengzhifuwu_content.find(".prodTypeCode_" + zengzhifuwuIndex).val(obj.prodTypeCode);
            $zengzhifuwu_content.find(".orderProdCode").val(obj.orderProdCode);
            $zengzhifuwu_content.find(".subsyCode").val(obj.subsyCode);
            zengzhifuwuIndex++;
            rankTable("zengzhifuwu_content");


            //清空表单
            $(':input','#zengzhifuwuForm')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
            //清空图片
            $(".img-box").remove();

            data_form.find("input[name='bannerCode']").val("");
            data_form.find("input[name='thumbnailCode']").val("");
            data_form.find("input[name='detailCodes']").val("");

            form.render();
        }
        /* 增值服务结束 */

        /* 母婴商品开始 */
        var muyingchanpinIndex = 0;
        function appendMuyingchanpinProd(obj, data_form) {
            var targetHtml = replaceAll($("#muyingchanpin_mock").html(), "$$ROWNUM$$", muyingchanpinIndex);
            targetHtml = replaceAll(targetHtml, "orderProd_prodTypeCode", obj.prodTypeCode);
            targetHtml = replaceAll(targetHtml, "orderProd_orderProdCode", obj.orderProdCode);

            var $muyingchanpin_content = $("#muyingchanpin_content");
            $muyingchanpin_content.append(targetHtml);
            $muyingchanpin_content.find(".prodName_span_" + muyingchanpinIndex).html(obj.prodName);
            $muyingchanpin_content.find(".prodAmt_span_" + muyingchanpinIndex).html(obj.prodAmt);
            $muyingchanpin_content.find(".prodDesc_span_" + muyingchanpinIndex).html(obj.prodDesc);

            $muyingchanpin_content.find(".prodName_" + muyingchanpinIndex).val(obj.prodName);
            $muyingchanpin_content.find(".bannerCode_" + muyingchanpinIndex).val(obj.bannerCode);
            $muyingchanpin_content.find(".thumbnailCode_" + muyingchanpinIndex).val(obj.thumbnailCode);
            $muyingchanpin_content.find(".detailCodes_" + muyingchanpinIndex).val(obj.detailCodes);
            $muyingchanpin_content.find(".prodAmt_" + muyingchanpinIndex).val(obj.prodAmt);
            $muyingchanpin_content.find(".prodTypeCode_" + muyingchanpinIndex).val(obj.prodTypeCode);
            $muyingchanpin_content.find(".prodDesc_" + muyingchanpinIndex).val(obj.prodDesc);
            $muyingchanpin_content.find(".prodTypeCode_" + muyingchanpinIndex).val(obj.prodTypeCode);
            $muyingchanpin_content.find(".orderProdCode").val(obj.orderProdCode);
            $muyingchanpin_content.find(".subsyCode").val(obj.subsyCode);
            muyingchanpinIndex++;
            rankTable("muyingchanpin_content");


            //清空表单
            $(':input','#muyingchanpinForm')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
            //清空图片
            $(".img-box").remove();

            data_form.find("input[name='bannerCode']").val("");
            data_form.find("input[name='thumbnailCode']").val("");
            data_form.find("input[name='detailCodes']").val("");

            form.render();
        }
        /* 母婴商品结束 */

        /* 产后修复开始 */
        var chanhouxiufuIndex = 0;
        function appendChanhouxiufuProd(obj, data_form) {
            var targetHtml = replaceAll($("#chanhouxiufu_mock").html(), "$$ROWNUM$$", chanhouxiufuIndex);
            targetHtml = replaceAll(targetHtml, "orderProd_prodTypeCode", obj.prodTypeCode);
            targetHtml = replaceAll(targetHtml, "orderProd_orderProdCode", obj.orderProdCode);

            var $chanhouxiufu_content = $("#chanhouxiufu_content");
            $chanhouxiufu_content.append(targetHtml);
            $chanhouxiufu_content.find(".prodName_span_" + chanhouxiufuIndex).html(obj.prodName);
            $chanhouxiufu_content.find(".prodAmt_span_" + chanhouxiufuIndex).html(obj.prodAmt);
            $chanhouxiufu_content.find(".prodDesc_span_" + chanhouxiufuIndex).html(obj.prodDesc);

            $chanhouxiufu_content.find(".prodName_" + chanhouxiufuIndex).val(obj.prodName);
            $chanhouxiufu_content.find(".bannerCode_" + chanhouxiufuIndex).val(obj.bannerCode);
            $chanhouxiufu_content.find(".thumbnailCode_" + chanhouxiufuIndex).val(obj.thumbnailCode);
            $chanhouxiufu_content.find(".detailCodes_" + chanhouxiufuIndex).val(obj.detailCodes);
            $chanhouxiufu_content.find(".prodAmt_" + chanhouxiufuIndex).val(obj.prodAmt);
            $chanhouxiufu_content.find(".prodTypeCode_" + chanhouxiufuIndex).val(obj.prodTypeCode);
            $chanhouxiufu_content.find(".prodDesc_" + chanhouxiufuIndex).val(obj.prodDesc);
            $chanhouxiufu_content.find(".prodTypeCode_" + chanhouxiufuIndex).val(obj.prodTypeCode);
            $chanhouxiufu_content.find(".orderProdCode").val(obj.orderProdCode);
            $chanhouxiufu_content.find(".subsyCode").val(obj.subsyCode);
            chanhouxiufuIndex++;
            rankTable("chanhouxiufu_content");


            //清空表单
            $(':input','#chanhouxiufuForm')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
            //清空图片
            $(".img-box").remove();

            data_form.find("input[name='bannerCode']").val("");
            data_form.find("input[name='thumbnailCode']").val("");
            data_form.find("input[name='detailCodes']").val("");

            form.render();
        }
        /* 产后修复结束 */


        //重画产品列表
        function rebuildProdListHtml(prodTypeCode) {
            var subsyCode = $("#subsyCode").val();
            $.ajax({
                url: "${ctx}/subsyAudit/getProdListFromSubsyAuditMongoByProdType",
                type: 'post',
                data: {'subsyCode':subsyCode, 'prodTypeCode':prodTypeCode},
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        if (data != null && data.prodList != null && data.prodList.length > 0) {
                            if (prodTypeCode === "00110001") {
                                //房型
                                var $roomType_content = $("#roomType_content");
                                $roomType_content.html("");
                                for (var i in data.prodList) {//遍历json对象的每个key/value对,p为key
                                    appendRoomTyeProd(data.prodList[i], $("#roomTypeForm"));
                                }
                            } else if (prodTypeCode === "00110003") {
                                //月子餐
                                var $yuezican_content = $("#yuezican_content");
                                $yuezican_content.html("");
                                for (var i in data.prodList) {//遍历json对象的每个key/value对,p为key
                                    appendYuezicanProd(data.prodList[i], $("#yuezicanForm"));
                                }
                            } else if (prodTypeCode === "00110006") {
                                //增值服务
                                var $zengzhifuwu_content = $("#zengzhifuwu_content");
                                $zengzhifuwu_content.html("");
                                for (var i in data.prodList) {//遍历json对象的每个key/value对,p为key
                                    appendZengzhifuwuProd(data.prodList[i], $("#zengzhifuwuForm"));
                                }
                            } else if (prodTypeCode === "00110009") {
                                //母婴商品
                                var $muyingchanpin_content = $("#muyingchanpin_content");
                                $muyingchanpin_content.html("");
                                for (var i in data.prodList) {//遍历json对象的每个key/value对,p为key
                                    appendMuyingchanpinProd(data.prodList[i], $("#muyingchanpinForm"));
                                }
                            } else if (prodTypeCode === "00110007") {
                                //产后修复
                                var $chanhouxiufu_content = $("#chanhouxiufu_content");
                                $chanhouxiufu_content.html("");
                                for (var i in data.prodList) {//遍历json对象的每个key/value对,p为key
                                    appendChanhouxiufuProd(data.prodList[i], $("#chanhouxiufuForm"));
                                }
                            }
                        }
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


        }

        //添加产品
        form.on('submit(addProduct)', function (data_Form) {
            var prodTypeCode = data_Form.field.prodTypeCode;
            $.ajax({
                url: "${ctx}/subsyAudit/saveProd",
                type: 'post',
                data: data_Form.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        rebuildProdListHtml(prodTypeCode);
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
        //删除产品
        function delProd(orderProdCode, subsyCode) {
            var isSuccess= false;
            $.ajax({
                async: false,
                url: "${ctx}/subsyAudit/delProd",
                type: 'post',
                data: {"orderProdCode" : orderProdCode, "subsyCode" : subsyCode},
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        if(data!=null && data.result!=null){
                            if(data.result==1){
                                layer.alert("删除成功");
                                isSuccess = true;
                            }else{
                                layer.alert("删除失败");
                            }
                        }
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

            return isSuccess;
        }



        /* 月嫂开始 */
        var mmatrionIndex = 0;
        <c:if test="${!empty auditInfo.mstOrderProdEntityList}">
            mmatrionIndex = "${fn:length(auditInfo.mstOrderProdEntityList)}";
        </c:if>
        // form.on("submit(addMmatron)", function (data) {
        //     appendMmatronProd(data.field);
        //     return false;
        // });

        function appendMmatronProd(obj) {
            var targetHtml = replaceAll($("#mmatron_mock").html(), "$$ROWNUM$$", mmatrionIndex);
            var $mmatron_content = $("#mmatron_content");
            $mmatron_content.append(targetHtml);
            $mmatron_content.find(".prodName_span_" + mmatrionIndex).html(obj.mmatron_prodName);
            $mmatron_content.find(".prodAmt_span_" + mmatrionIndex).html(obj.mmatron_prodAmt);
            $mmatron_content.find(".prodDesc_span_" + mmatrionIndex).html(obj.mmatron_prodDesc);

            $mmatron_content.find(".prodName_" + mmatrionIndex).val(obj.mmatron_prodName);
            $mmatron_content.find(".bannerCode_" + mmatrionIndex).val(obj.mmatron_bannerCode);
            $mmatron_content.find(".thumbnailCode_" + mmatrionIndex).val(obj.mmatron_thumbnailCode);
            $mmatron_content.find(".detailCodes_" + mmatrionIndex).val(obj.mmatron_detailCodes);
            $mmatron_content.find(".prodAmt_" + mmatrionIndex).val(obj.mmatron_prodAmt);
            $mmatron_content.find(".prodTypeCode_" + mmatrionIndex).val(obj.mmatron_prodTypeCode);
            $mmatron_content.find(".prodDesc_" + mmatrionIndex).val(obj.mmatron_prodDesc);
            mmatrionIndex++;
            rankTable("mmatron_content");



            //清空表单
            $(':input','#mmatronForm')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
            //清空图片
            $(".img-box").remove();
            $("input[name='mmatron_bannerCode']").val("");
            $("input[name='mmatron_thumbnailCode']").val("");
            $("input[name='mmatron_detailCodes']").val("");
        }

        //监听提交
        form.on('submit(mmatronList)', function (data) {
            $.ajax({
                url: "${ctx}/subsyAudit/saveProd",
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        // layer.alert("保存会所基本信息成功")
                        $step.nextStep();
                        element.tabChange('subsyAuditTab', $step.getIndex());//传入相应的lay-id属性，下面tab切换
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
        /* 月嫂结束 */







        //上传
        upload.render({
            elem: '.uploadImg' //绑定元素
            , url: '${ctx}/subsyAudit/uploadImg' //上传接口
            , accept: 'images'
            , exts: 'jpg|png|gif|bmp|jpeg'
            , field: 'upload'
            , before: function () {
                layer.load();
                var item = this.item;
                this.data = {"prodTypeCode": item.prev().val()};
            }
            , done: function (res) {
                layer.closeAll('loading');
                var item = this.item;
                var prodTypeCode = item.prev().val();
                var height, weight;
                if (prodTypeCode === "00480006") {
                    height = 200;
                    weight = 375;
                }
                if (prodTypeCode === "00480004") {
                    height = 85;
                    weight = 85;
                }
                if (prodTypeCode === "00480001") {
                    height = 200;
                    weight = 375;
                }
                if (prodTypeCode === "00480026") {
                    height = 85;
                    weight = 85;
                }

                item.prev().prev().find("input").val(res.imageCode);
                item.prev().prev().find(".img-box").remove();
                var array = [];
                array.push("<div class=\"img-box\" vb=\"" + res.imageCode + "\">");
                var src = "${ctx}/reso/downLoadPicFile?tranResoFileMngId=" + res.imageCode;
                array.push("<img src= \"" + src + "\" width='" + weight + "' height='" + height + "'/>");
                array.push("<div class=\"del-icon\"> <i class=\"layui-icon\">&#x1006;</i></div>");
                array.push("</div>");
                item.prev().prev().append(array.join(""));
            }
        });


        //多图上传
        upload.render({
            elem: '.uploadMultiImg' //绑定元素
            , url: '${ctx}/subsyAudit/uploadImg' //上传接口
            , accept: 'images'
            , multiple: true
            , exts: 'jpg|png|gif|bmp|jpeg'
            , field: 'upload'
            , before: function () {
                layer.load();
                var item = this.item;
                this.data = {"prodTypeCode": item.prev().val()};
            }, done: function (res) {
                layer.closeAll('loading');
                var item = this.item;
                var prodTypeCode = item.prev().val();
                var height, weight;
                if (prodTypeCode === "00480007") {
                    weight = 375;
                    height = 200;
                }
                if (prodTypeCode === "00480002") {
                    weight = 375;
                    height = 200;
                }

                var detailCodes = item.prev().prev().find("input").val();
                if (detailCodes) {
                    detailCodes = detailCodes + "," + res.imageCode;
                } else {
                    detailCodes = res.imageCode;
                }
                item.prev().prev().find("input").val(detailCodes);
                var array = [];
                array.push("<div class=\"img-box\" vb=\"" + res.imageCode + "\">");
                var src = "${ctx}/reso/downLoadPicFile?tranResoFileMngId=" + res.imageCode;
                array.push("<img src= \"" + src + "\" width='" + weight + "' height='" + height + "'/>");
                array.push("<div class=\"del-icon\"> <i class=\"layui-icon\">&#x1006;</i></div>");
                array.push("</div>");
                item.prev().prev().append(array.join(""));
            }
        });



        $(".backBtn").on("click", function(event){
            location.href = "${ctx}/subsyAudit/";
            //setReturnValueFalse(event);
        });


        //提交关闭打开会所
        form.on('submit(submitOpenCloseSubsy)', function (data) {
            var subsyActivFlg = data.field.subsyActivFlg;
            if(subsyActivFlg =='on'){
                data.field.subsyActivFlg = '1';
            }else{
                data.field.subsyActivFlg = '0';
            }


            $.ajax({
                url: "${ctx}/subsyAudit/submitOpenCloseSubsy",
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        layer.open({
                            content: '提交成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                location.reload();
                                return true;
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
        //编辑产品
        $(document).on("click", ".btnModifyProd", function () {
            var subsyCode = $(this).prev().val();
            var orderProdCode = $(this).attr("orderProdCode");
            var prodTypeCode = $(this).attr("prodTypeCode");
            var layerId = layer.open({
                title: "编辑",
                area: ['1000px', '800px'],
                type: 2,
                content: '${ctx}/subsyAudit/openProdEdit/' + subsyCode + '/' + prodTypeCode + '/' +  orderProdCode,
                end: function(){
                    rebuildProdListHtml(prodTypeCode);
                }
            });
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





        <%--$(".modifyRoomProd").click(function () {--%>
            <%--var subsyCode = $(this).prev().prev().val();--%>
            <%--var orderProdCode = $(this).attr("orderProdCode");--%>
            <%--var prodTypeCode = $(this).attr("prodTypeCode");--%>
            <%--var layerId = layer.open({--%>
                <%--title: "编辑",--%>
                <%--area: ['1000px', '800px'],--%>
                <%--type: 2,--%>
                <%--content: '${ctx}/subsyAudit/openProdEdit/' + subsyCode + '/' + prodTypeCode + '/' +  orderProdCode--%>
            <%--});--%>
        <%--});--%>

        //
        // form.on('switch(subsyActivFlg)', function (data) {
        //     if (data.value === "1") {
        //         $("#servCityCodesMs").removeAttr("lay-verify");
        //         $("#servCityCodes_div").hide();
        //     } else {
        //         $("#servCityCodesMs").attr("lay-verify", "required|selectcheck");
        //         $("#servCityCodes_div").show();
        //     }
        // });








        console.log("isAllowOpenCloseSubsy=${auditInfo.isAllowOpenCloseSubsy}" + "isAllowEditProduct=${auditInfo.isAllowEditProduct}  isAllowAuditProduct=${auditInfo.isAllowAuditProduct}  isAllowAuditSubsy=${auditInfo.isAllowAuditSubsy}  isAllowEditSubsy=${auditInfo.isAllowEditSubsy}");
    });
</script>
<!-- js placed at the end of the document so the pages load faster -->

</body>
</html>