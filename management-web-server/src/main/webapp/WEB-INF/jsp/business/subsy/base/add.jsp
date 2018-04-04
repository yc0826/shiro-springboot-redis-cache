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
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>会所名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="subsyName" value="${subsy.subsyName}" autocomplete="off"
                                   class="layui-input" placeholder="请输入会所名称" lay-verify="notnull" maxlength="32">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>会所显示名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="subsyDispName" value="${subsy.subsyDispName}" autocomplete="off"
                                   class="layui-input" placeholder="请输入会所显示名称" lay-verify="notnull" maxlength="32">
                        </div>
                    </div>

                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>banner图</label>
                    <div class="layui-input-block">
                        <input type="hidden" id="bannerCode" name="bannerCode" value="${subsy.bannerCode}">
                        <span style="float: left;display: inline-block">
                            <div class="upload_box">
                                <img id="bannerImg" class="upload_img"
                                     src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${subsy.bannerCode}"/>
                            </div>
                        </span>
                        <span class="upload_btn">
                            <button type="button" class="layui-btn layui-btn-sm layui-btn-primary" id="uploadBanner">
                                <i class="layui-icon">&#xe67c;</i>上传
                            </button>
                        </span>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>品牌</label>
                        <div class="layui-input-inline">
                            <select name="brandCode" lay-verify="selectcheck" vb="品牌">
                                <option value="">请选择</option>
                                <c:forEach items="${shb:getNormalSubsyBrandList()}" var="gen">
                                    <option value="${gen.genCode}"
                                            <c:if test="${gen.genCode == subsy.brandCode}">selected</c:if> >${gen.genSubName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>省</label>
                        <div class="layui-input-inline layui-form" lay-filter="loctProvCode">
                            <select id="loctProvCode" name="loctProvCode" lay-filter="loct_prov_code"
                                    lay-verify="selectcheck" vb="省"></select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>市</label>
                        <div class="layui-input-inline layui-form" lay-filter="loctCityCode">
                            <select id="loctCityCode" name="loctCityCode" lay-filter="loct_city_code"
                                    lay-verify="selectcheck" vb="市"></select>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>区</label>
                        <div class="layui-input-inline layui-form" lay-filter="loctAreaCode">
                            <select id="loctAreaCode" name="loctAreaCode" lay-filter="loct_area_code"
                                    lay-verify="selectcheck" vb="区"></select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>地址</label>
                    <div class="layui-input-inline inline-adress" >
                        <input type="text" name="subsyAddr" value="${subsy.subsyAddr}" placeholder="请输入地址"
                               autocomplete="off" class="layui-input" lay-verify="notnull" maxlength="128">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">固定电话</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phoneNum" value="${subsy.phoneNum}" placeholder="请输入固定电话"
                                   autocomplete="off" class="layui-input"  maxlength="16"
                                   minlength="8">
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>手机号码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mobNum" value="${subsy.mobNum}" placeholder="请输入手机号码"
                                   autocomplete="off" class="layui-input" maxlength="11" lay-verify="notnull|phone">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">邮政编码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="postNo" value="${subsy.postNo}" autocomplete="off"
                                   placeholder="请输入邮政编码" class="layui-input" lay-verify="zipcode">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">营业时间描述</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请输入内容" name="busiTimeDesc"
                                      class="layui-textarea" maxlength="256">${subsy.promotionDesc}</textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">促销相关描述</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请输入内容" name="promotionDesc"
                                      class="layui-textarea" maxlength="256">${subsy.promotionDesc}</textarea>
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">预约相关描述</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请输入内容" name="bookDesc"
                                      class="layui-textarea" maxlength="256">${subsy.bookDesc}</textarea>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>会所其他信息</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>营业执照号码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mstSubsyAddEntity.busiLcnsNo"
                                   value="${subsyAdd.busiLcnsNo}" placeholder="请输入营业执照号码" autocomplete="off"
                                   class="layui-input"
                                   lay-verify="notnull|busiLcnsNo" maxlength="32">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>注册地所在省</label>
                        <div class="layui-input-inline layui-form" lay-filter="regLoctProvCode">
                            <select name="mstSubsyAddEntity.regLoctProvCode" id="regLoctProvCode"
                                    lay-filter="reg_loct_prov_code" lay-verify="selectcheck" vb="请选择注册地所在省"></select>
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>注册地所在市</label>
                        <div class="layui-input-inline layui-form" lay-filter="regLoctCityCode">
                            <select name="mstSubsyAddEntity.regLoctCityCode" id="regLoctCityCode"
                                    lay-filter="reg_loct_city_code" lay-verify="selectcheck" vb="请选择注册地所在市"></select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>注册地址</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mstSubsyAddEntity.regAddr"
                                   value="${subsyAdd.regAddr}" placeholder="请输入注册地址" autocomplete="off"
                                   class="layui-input" lay-verify="notnull" maxlength="128">
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style">注册地邮编</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mstSubsyAddEntity.regPostNo"
                                   value="${subsyAdd.regPostNo}" placeholder="请输入注册地邮编"
                                   autocomplete="off" class="layui-input" lay-verify="zipcode">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>法人名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mstSubsyAddEntity.corpPersnName"
                                   value="${subsyAdd.corpPersnName}" placeholder="请输入法人名称"
                                   autocomplete="off" class="layui-input" lay-verify="notnull" maxlength="16">
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>法人手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mstSubsyAddEntity.corpPersnPhoneNum"
                                   value="${subsyAdd.corpPersnPhoneNum}" placeholder="请输入法人手机号"
                                   autocomplete="off" class="layui-input" lay-verify="notnull|phone">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>负责人名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mstSubsyAddEntity.resbPersnName"
                                   value="${subsyAdd.resbPersnName}" placeholder="请输入负责人名称"
                                   autocomplete="off" class="layui-input" lay-verify="notnull">
                        </div>
                    </div>
                    <div class="  layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>负责人手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mstSubsyAddEntity.resbPersnPhoneNum"
                                   value="${subsyAdd.resbPersnPhoneNum}" placeholder="请输入负责人手机号"
                                   autocomplete="off" class="layui-input" lay-verify="notnull|phone">
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
        </div>
    </div>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    layui.use(['form', 'jquery', 'globalAjax', 'upload', 'verify'], function () {
        var $ = layui.jquery, form = layui.form
            , layer = layui.layer, upload = layui.upload, verify = layui.verify;

        <c:if test="${subsy.bannerCode  == null}">
        $("img").css('background','none');
        </c:if>
        <c:if test="${subsy.bannerCode  != null}">
        var image = document.getElementById("bannerImg");
        var downloadingImage = new Image();
        downloadingImage.onload = function(){
            image.src = this.src;
        };
        downloadingImage.src = "${ctx}/reso/downLoadPicFile?tranResoFileMngId=${subsy.bannerCode}";
        </c:if>

        $(function () {
            initProv("loctProvCode");
            initRegLoctProvCode("regLoctProvCode")
        });


        function initProv(domId) {
            var provSelect = $("#" + domId);
            $.post("${ctx}/common/region/getProvList",
                function (data) {
                    provSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {

                        provSelect.append("<option value=\"" + item.regionId + "\" >" + item.regionName + "</option>")
                    });
                    form.render('select', domId);

                }, 'json');
        }

        function initRegLoctProvCode(domId) {
            var provSelect = $("#" + domId);
            $.post("${ctx}/common/region/getProvList",
                function (data) {
                    provSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {

                        provSelect.append("<option value=\"" + item.regionId + "\">" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                }, 'json');
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
                        layer.alert("${op}会所成功", {closeBtn: 0}, function () {
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
            , before: function () {
                layer.load();
            }
            , done: function (res) {
                layer.closeAll('loading');
                $("#bannerCode").val(res.imageCode);
                $(".upload_box").css("display", "block");
                $(".upload_img").attr("src", "${ctx}/reso/downLoadPicFile?tranResoFileMngId=" + res.imageCode)
            }
        });

        form.verify(verify);
        $("#back").on("click", function(event){
            location.href = "${ctx}/subsy/";
            //setReturnValueFalse(event);
        })
    });

</script>

</body>
</html>
