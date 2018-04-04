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
                            <div <c:if test="${subsy.bannerCode == null}">class="upload_box"</c:if>>
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
                        <div class="layui-input-inline layui-form inline-noborder" lay-filter="loctAreaCode">
                          ${shb:getRegionNameByRegionCode(subsy.loctAreaCode)}
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label label-style">地址</label>
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
                                <textarea placeholder="请输入内容" class="layui-textarea">${subsy.busiTimeDesc}</textarea>
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
                    <div class="layui-form-item ">
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
                            <div class="layui-input-inline layui-form inline-noborder" lay-filter="regLoctProvCode">
                               ${shb:getRegionNameByRegionCode(subsyAdd.regLoctProvCode)}
                            </div>
                        </div>
                        <div class="  layui-col-md6">
                            <label class="layui-form-label label-style">注册地所在市</label>
                            <div class="layui-input-inline layui-form inline-noborder" lay-filter="regLoctCityCode">
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
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>审核信息</legend>
                    </fieldset>
                    <c:if test="${not empty subsyAuditList}">
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
                                    <label class="layui-form-label label-style">${audit.remark}</label>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <shiro:hasPermission name="subsy:audit">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><span style="color:red">※</span>备注</label>
                        <div class="layui-input-inline">
                            <textarea name="subsyAuditEntity.remark" id="remark" placeholder="请输入内容"
                                      class="layui-textarea"
                                      lay-verify="required"
                                      lay-verType="tips"></textarea>
                        </div>
                    </div>
                    </shiro:hasPermission>
                    <div class="layui-form-item btn-position">
                        <div class="layui-inline">
                            <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="agree">同意</button>
                        </div>
                        <div class="layui-inline">
                            <button class="layui-btn layui-btn-danger" lay-submit="" lay-filter="disagree">拒绝</button>
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
    layui.use(['form', 'jquery', 'globalAjax', 'upload'], function () {
        var $ = layui.jquery, form = layui.form
            , layer = layui.layer;


        //监听提交
        form.on('submit(disagree)', function () {
            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: {'remark': $("#remark").val(), 'auditTypeCode': '00660003'},
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        layer.alert("审核完毕",{closeBtn: 0},  function () {
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
        //监听提交
        form.on('submit(agree)', function () {
            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: {'remark': $("#remark").val(), 'auditTypeCode': '00660002'},
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        layer.alert("审核完毕", function () {
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
        $("#back").on("click", function (event) {
            location.href = "${ctx}/subsy/";
            //setReturnValueFalse(event);
        })

    });

</script>

</body>
</html>
