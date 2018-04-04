<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>${op}会所</title>

    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
</head>

<body>
<div class="row mt wrapper  layui-container ">
    <div class=" layui-row row-style">
        <div class="col_main lightshadow form-panel layui-col-md12">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>会所基本信息</legend>
            </fieldset>

            <form class="layui-form" action="">
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">会所code:</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsy.subsyCode}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">状态:</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsy.auditStatusName}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">会所名</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsy.subsyName}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">会所显示名</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsy.subsyDispName}
                        </div>
                    </div>

                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style">banner图</label>
                    <span style="float: left;display: inline-block">
                            <div
                                    <c:if test="${subsy.bannerCode == null}">class="upload_box"</c:if>>
                                <img class="upload_img"
                                     src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${subsy.bannerCode}"/>
                            </div>
                        </span>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">品牌</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsy.brandName}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">省</label>
                        <div class="layui-input-inline layui-form inline-noborder" lay-filter="loctProvCode">
                            ${shb:getRegionNameByRegionCode(subsy.loctProvCode)}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">市</label>
                        <div class="layui-input-inline layui-form inline-noborder" lay-filter="loctCityCode">
                            ${shb:getRegionNameByRegionCode(subsy.loctCityCode)}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">区</label>
                        <div class="layui-input-inline layui-form " lay-filter="loctAreaCode">
                            <label class="layui-form-label label-style">${shb:getRegionNameByRegionCode(subsy.loctAreaCode)}</label>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label label-style label-style">地址</label>
                    <div class="layui-input-block inline-noborder">
                        ${subsy.subsyAddr}
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">固定电话</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsy.phoneNum}
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">手机号码</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsy.mobNum}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">邮政编码</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsy.postNo}
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">营业时间描述</label>
                        <div class="layui-input-inline">
                                <textarea placeholder="请输入内容" name="busiTimeDesc" readonly
                                          class="layui-textarea">${subsy.busiTimeDesc}</textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">促销相关描述</label>
                        <div class="layui-input-inline">
                                <textarea placeholder="请输入内容" name="promotionDesc" readonly
                                          class="layui-textarea">${subsy.promotionDesc}</textarea>
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">预约相关描述</label>
                        <div class="layui-input-inline">
                                <textarea placeholder="请输入内容" name="bookDesc" readonly
                                          class="layui-textarea">${subsy.bookDesc}</textarea>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>会所其他信息</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">营业执照号码</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsyAdd.busiLcnsNo}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">注册地所在省</label>
                        <div class="layui-input-inline inline-noborder" lay-filter="regLoctProvCode">
                            ${shb:getRegionNameByRegionCode(subsyAdd.regLoctProvCode)}
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">注册地所在市</label>
                        <div class="layui-input-inline inline-noborder" lay-filter="regLoctCityCode">
                            ${shb:getRegionNameByRegionCode(subsyAdd.regLoctCityCode)}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">注册地址</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsyAdd.regAddr}
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">注册地邮编</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsyAdd.regPostNo}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">法人名称</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsyAdd.corpPersnName}
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">法人手机号</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsyAdd.corpPersnPhoneNum}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">负责人名称</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsyAdd.resbPersnName}
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">负责人手机号</label>
                        <div class="layui-input-inline inline-noborder">
                            ${subsyAdd.resbPersnPhoneNum}
                        </div>
                    </div>
                </div>

                <c:if test="${not empty subsyAuditList}">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>审核信息</legend>
                    </fieldset>
                    <c:forEach items="${subsyAuditList}" var="audit">
                        <div class="layui-form-item layui-row">
                            <div class="  layui-col-md6">
                                <label class="layui-form-label label-style">审核人</label>
                                <div class="layui-input-inline inline-noborder">
                                        ${audit.userName}
                                </div>
                            </div>
                            <div class="  layui-col-md6">
                                <label class="layui-form-label label-style">审核时间</label>
                                <div class="layui-input-inline inline-noborder">
                                        ${audit.auditTime}
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label"><span style="color:red">※</span>审核备注</label>
                            <div class="layui-input-inline">
                                    <textarea readonly class="layui-textarea" lay-verify="required"
                                              lay-verType="tips">${audit.remark}</textarea>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    layui.use(['form', 'jquery', 'globalAjax', 'upload'], function () {
        var $ = layui.jquery, form = layui.form
            , layer = layui.layer, upload = layui.upload;

        <c:if test="${subsy.bannerCode  == null}">
        $("img").css('background', 'none');
        </c:if>
        <c:if test="${subsy.bannerCode  != null}">
        var image = document.getElementById("bannerImg");
        var downloadingImage = new Image();
        downloadingImage.onload = function () {
            image.src = this.src;
        };
        downloadingImage.src = "${ctx}/reso/downLoadPicFile?tranResoFileMngId=${subsy.bannerCode}";
        </c:if>

        $(function () {
            initProv("${subsy.loctProvCode}", "loctProvCode");
            initRegLoctProvCode("${subsy.mstSubsyAddEntity.regLoctProvCode}", "regLoctProvCode")
        });


        function initRegLoctProvCode(provCode, domId) {
            var provSelect = $("#" + domId);
            $.post("${ctx}/common/region/getProvList",
                function (data) {
                    provSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === provCode) {
                            initRegLoctCity(provCode, '${subsy.mstSubsyAddEntity.regLoctCityCode}', "regLoctCityCode");
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
                    regLoctCitySelect.append("<option>请选择</option>");
                    $.each(data, function (index, item) {
                        regLoctCitySelect.append("<option value=\"" + item.regionId + "\">" + item.regionName + "</option>")
                    });
                    form.render('select', "regLoctCityCode");
                },
                'json')
        });


        function initProv(provCode, domId) {
            var provSelect = $("#" + domId);
            $.post("${ctx}/common/region/getProvList",
                function (data) {
                    provSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === provCode) {
                            initCity(provCode, '${subsy.loctCityCode}', "loctCityCode");
                            flg = true;
                        }
                        provSelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + " >" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                },
                'json');
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
                            initArea(cityCode, '${subsy.loctAreaCode}', "loctAreaCode");
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

        form.on('select(loct_prov_code)', function (data) {
            var loctCitySelect = $("#loctCityCode");
            var loctAreaSelect = $("#loctAreaCode");
            //清空市
            loctCitySelect.empty();
            form.render('select', "loctCityCode");
            //清空区
            loctAreaSelect.empty();
            form.render('select', "loctAreaCode");
            $.post("${ctx}/common/region/getListByParentCode",
                {
                    parentCode: data.value
                }, function (data) {
                    loctCitySelect.append("<option>请选择</option>");
                    $.each(data, function (index, item) {
                        loctCitySelect.append("<option value=\"" + item.regionId + "\">" + item.regionName + "</option>")
                    });
                    form.render('select', "loctCityCode");
                },
                'json')
        });

        form.on('select(loct_city_code)', function (data) {
            var loctAreaSelect = $("#loctAreaCode");
            //清空区
            loctAreaSelect.empty();
            form.render('select', "loctAreaCode");
            $.post("${ctx}/common/region/getListByParentCode",
                {
                    parentCode: data.value
                }, function (data) {
                    loctAreaSelect.append("<option>请选择</option>");
                    $.each(data, function (index, item) {
                        loctAreaSelect.append("<option value=\"" + item.regionId + "\">" + item.regionName + "</option>")
                    });
                    form.render('select', "loctAreaCode");
                },
                'json')
        });

        // //自定义验证规则
        // form.verify({
        //     title: function (value) {
        //         if (value.length < 5) {
        //             return '标题至少得5个字符啊';
        //         }
        //     }
        // });


        //监听提交
        form.on('submit(*)', function (data) {
            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        layer.alert("${op}会所成功", function () {
                            window.location.href = "${ctx}/subsy";
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
        //执行实例
        upload.render({
            elem: '#uploadBanner' //绑定元素
            , url: '${ctx}/subsy/uploadSusbyBanner' //上传接口
            , accept: 'images'
            , exts: 'jpg|png|gif|bmp|jpeg'
            , field: 'upload'
            , before: function (obj) {
                layer.load();
            }
            , done: function (res) {
                layer.closeAll('loading');
                console.log(res.status)
            }
        });
        $("#back").on("click", function(event){
            location.href = "${ctx}/subsy/";
            //setReturnValueFalse(event);
        })
    });

</script>

</body>
</html>
