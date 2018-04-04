<%@ page contentType="text/html;charset=UTF-8" %>
<div class="layui-tab-item layui-show">
    <div class="col_main lightshadow form-panel layui-col-md12">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>会所基本信息</legend>
        </fieldset>
        <form class="layui-form" action="">
            <input type="hidden" name="subsyCode" class="subsyCode" id="subsyCode" value="${auditInfo.subsyCode}">
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md6">
                    <label class="layui-form-label label-style">会所名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="subsyName" value="${auditInfo.mstSubsyBaseEntity.subsyName}" class="layui-input" readonly>
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">会所显示名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="subsyDispName" value="${auditInfo.mstSubsyBaseEntity.subsyDispName}" class="layui-input" readonly>
                    </div>
                </div>

            </div>
            <div class="layui-form-item layui-row">
                <label class="layui-form-label label-style">banner图</label>
                <span style="float: left;display: inline-block">
                     <div>
                          <c:if test="${auditInfo.mstSubsyBaseEntity.bannerCode != null}"></c:if>
                                <img class="upload_img" src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${auditInfo.mstSubsyBaseEntity.bannerCode}" width="375" height="200"/>
                     </div>
                </span>
            </div>
            <div class="layui-form-item layui-row">
                <label class="layui-form-label label-style">缩略图(1张)</label>
                <span style="float: left;display: inline-block">
                     <div>
                             <c:if test="${auditInfo.mstSubsyBaseEntity.thumbnailPicCode != null}">
                                <img class="upload_img" src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${auditInfo.mstSubsyBaseEntity.thumbnailPicCode}" width="85" height="85"/>
                             </c:if>
                     </div>
                </span>
            </div>
            <div class="layui-form-item layui-row">
                <label class="layui-form-label label-style">详情图(多张)</label>
                <div class="layui-input-inline">
                    <span style="float: left">
                        <c:if test="${auditInfo.mstSubsyBaseEntity.detailPicCode != null}">
                            <c:forEach items="${subsyDetailPicCodes}" var="itemList">
                                <img class="upload_img" src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${itemList}" width="375" height="200"/>
                            </c:forEach>
                        </c:if>
                    </span>
                </div>
            </div>


            <div class="layui-form-item layui-row">
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">品牌</label>
                    <div class="layui-input-inline">
                        <c:forEach items="${shb:getNormalSubsyBrandList()}" var="gen">
                            <c:if test="${gen.genCode == auditInfo.mstSubsyBaseEntity.brandCode}">
                                <input type="text" name="brandCode" value="${gen.genSubName}" class="layui-input" readonly>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">省</label>
                    <div class="layui-input-inline layui-form">
                        <input type="text" name="loctProvCode" value="${initProv}" class="layui-input" readonly>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">市</label>
                    <div class="layui-input-inline layui-form">
                        <input type="text" name="loctCityCode" value="${initCity}" class="layui-input" readonly>
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">区</label>
                    <div class="layui-input-inline layui-form" lay-filter="loctAreaCode">
                        <input type="text" name="loctAreaCode" value="${initArea}" class="layui-input" readonly>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <label class="layui-form-label label-style">地址</label>
                <div class="layui-input-inline inline-adress">
                    <input type="text" name="subsyAddr" value="${auditInfo.mstSubsyBaseEntity.subsyAddr}" class="layui-input" readonly>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md6">
                    <label class="layui-form-label label-style">固定电话</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phoneNum" value="${auditInfo.mstSubsyBaseEntity.phoneNum}" class="layui-input" readonly>
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">手机号码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mobNum" value="${auditInfo.mstSubsyBaseEntity.mobNum}" class="layui-input" readonly>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">邮政编码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="postNo" value="${auditInfo.mstSubsyBaseEntity.postNo}" class="layui-input" readonly>
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">营业时间描述</label>
                    <div class="layui-input-inline">
                            <textarea name="busiTimeDesc" class="layui-textarea" readonly>${auditInfo.mstSubsyBaseEntity.busiTimeDesc}</textarea>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">促销相关描述</label>
                    <div class="layui-input-inline">
                            <textarea name="promotionDesc" class="layui-textarea" readonly>${auditInfo.mstSubsyBaseEntity.promotionDesc}</textarea>
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">预约相关描述</label>
                    <div class="layui-input-inline">
                            <textarea name="bookDesc" class="layui-textarea" readonly>${auditInfo.mstSubsyBaseEntity.bookDesc}</textarea>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md6">
                    <label class="layui-form-label label-style">人均价格(RMB)</label>
                    <div class="layui-input-inline">
                        <input type="text" name="price" value="${auditInfo.mstSubsyBaseEntity.price}" class="layui-input" readonly>
                    </div>
                </div>

            </div>

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>会所其他信息</legend>
            </fieldset>
            <div class="layui-form-item">
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">营业执照号码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.busiLcnsNo" value="${auditInfo.mstSubsyAddEntity.busiLcnsNo}" class="layui-input" readonly>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">注册地所在省</label>
                    <div class="layui-input-inline layui-form" lay-filter="regLoctProvCode">
                        <input type="text" name="mstSubsyAddEntity.regLoctProvCode" value="${initRegLoct}" class="layui-input" readonly>
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">注册地所在市</label>
                    <div class="layui-input-inline layui-form" lay-filter="initRegLoctCity">
                        <input type="text" name="mstSubsyAddEntity.regLoctCityCode" value="${initRegLoctCity}" class="layui-input" readonly>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">注册地址</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.regAddr"
                               value="${auditInfo.mstSubsyAddEntity.regAddr}" class="layui-input" readonly>
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">注册地邮编</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.regPostNo"
                               value="${auditInfo.mstSubsyAddEntity.regPostNo}" class="layui-input" readonly>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">法人名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.corpPersnName"
                               value="${auditInfo.mstSubsyAddEntity.corpPersnName}" class="layui-input" readonly>
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">法人手机号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.corpPersnPhoneNum"
                               value="${auditInfo.mstSubsyAddEntity.corpPersnPhoneNum}"  class="layui-input" readonly>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">负责人名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.resbPersnName"
                               value="${auditInfo.mstSubsyAddEntity.resbPersnName}" class="layui-input" readonly>
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">负责人手机号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.resbPersnPhoneNum"
                                value="${auditInfo.mstSubsyAddEntity.resbPersnPhoneNum}"
                                class="layui-input"
                                readonly>
                    </div>
                </div>
            </div>

        </form>
    </div>
</div>