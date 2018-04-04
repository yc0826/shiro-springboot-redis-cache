<%@ page contentType="text/html;charset=UTF-8" %>
<form class="layui-form">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>会所基本信息</legend>
    </fieldset>


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
                            <div <c:if test="${subsy.bannerCode == null}">class="upload_box"</c:if>>
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
    </div>
    <div class="layui-form-item layui-row">
        <label class="layui-form-label label-style"><span style="color:red">※</span>地址</label>
        <div class="layui-input-inline inline-adress">
            <input type="text" name="subsyAddr" value="${subsy.subsyAddr}" placeholder="请输入地址"
                   autocomplete="off" class="layui-input" lay-verify="notnull" maxlength="128">
        </div>
    </div>
    <div class="layui-form-item layui-row">
        <div class=" layui-col-md6">
            <label class="layui-form-label label-style">固定电话</label>
            <div class="layui-input-inline">
                <input type="text" name="phoneNum" value="${subsy.phoneNum}" placeholder="请输入固定电话"
                       autocomplete="off" class="layui-input" lay-verify="number" maxlength="16"
                       minlength="8">
            </div>
        </div>
        <div class="  layui-col-md6">
            <label class="layui-form-label label-style"><span style="color:red">※</span>手机号码</label>
            <div class="layui-input-inline">
                <input type="text" name="mobNum" value="${subsy.mobNum}" placeholder="请输入手机号码"
                       autocomplete="off" class="layui-input" lay-verify="notnull|phone">
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
                                      class="layui-textarea" maxlength="256">${subsy.busiTimeDesc}</textarea>
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
            <button class="layui-btn" lay-submit lay-filter="*">修改</button>
        </div>
        <div class=" layui-inline">
            <button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>
        </div>
    </div>

</form>
