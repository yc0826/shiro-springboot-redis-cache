<%@ page contentType="text/html;charset=UTF-8" %>
<div class="layui-tab-item layui-show">
    <div class="col_main lightshadow form-panel layui-col-md12">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>会所基本信息</legend>
        </fieldset>
        <form class="layui-form" action="">
            <input type="hidden" name="subsyCode" class="subsyCode" value="${auditInfo.subsyCode}">
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md12">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>banner图</label>
                    <div class="layui-input-block">
                        <span style="float: left;">
                            <input type="hidden" id="bannerCode" name="bannerCode" value="${auditInfo.mstSubsyBaseEntity.bannerCode}">
                            <c:if test="${auditInfo.mstSubsyBaseEntity.bannerCode != null}">
                                <div class="img-box" vb="${auditInfo.mstSubsyBaseEntity.bannerCode}"><img src="/babyskymng/reso/downLoadPicFile?tranResoFileMngId=${auditInfo.mstSubsyBaseEntity.bannerCode}" width="375" height="200"><div class="del-icon"> <i class="layui-icon">ဆ</i></div></div>
                            </c:if>
                        </span>
                        <input type="hidden" value="00480001">
                        <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadImg">
                            <i class="layui-icon">&#xe67c;</i>上传
                        </button>
                        <span style="margin-left: 10px;color:blue;">查看示例</span>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md12">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>缩略图(1张)</label>
                    <div class="layui-input-inline">
                            <span style="float: left">
                                 <input type="hidden" id="thumbnailPicCode" name="thumbnailPicCode" value="${auditInfo.mstSubsyBaseEntity.thumbnailPicCode}">
                                <c:if test="${auditInfo.mstSubsyBaseEntity.thumbnailPicCode != null}">
                                    <div class="img-box" vb="${auditInfo.mstSubsyBaseEntity.thumbnailPicCode}"><img src="/babyskymng/reso/downLoadPicFile?tranResoFileMngId=${auditInfo.mstSubsyBaseEntity.thumbnailPicCode}" width="85" height="85"><div class="del-icon"> <i class="layui-icon">ဆ</i></div></div>
                                </c:if>
                            </span>
                        <input type="hidden" value="00480026">
                        <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadImg">
                            <i class="layui-icon">&#xe67c;</i>上传
                        </button>
                        <span style="margin-left: 10px;color:blue;">查看示例</span>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md12">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>详情图(多张)</label>
                    <div class="layui-input-inline">
                            <span style="float: left">
                                 <input type="hidden" id="detailPicCode" name="detailPicCode" value="${auditInfo.mstSubsyBaseEntity.detailPicCode}">
                                  <c:if test="${auditInfo.mstSubsyBaseEntity.detailPicCode != null}">
                                      <c:forEach items="${subsyDetailPicCodes}" var="itemList">
                                          <div class="img-box" vb="${itemList}"><img src="/babyskymng/reso/downLoadPicFile?tranResoFileMngId=${itemList}" width="375" height="200"><div class="del-icon"> <i class="layui-icon">ဆ</i></div></div>
                                      </c:forEach>
                                  </c:if>
                            </span>
                        <input type="hidden" value="00480002">
                        <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadMultiImg">
                            <i class="layui-icon">&#xe67c;</i>上传
                        </button>
                        <span style="margin-left: 10px;color:blue;">查看示例</span>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>品牌</label>
                    <div class="layui-input-inline">
                        <select id="brandCode" name="brandCode" lay-verify="selectcheck" vb="品牌" lay-filter="brandCode">
                            <option value="">请选择</option>
                            <c:forEach items="${brandCodeList}" var="item">
                                <option value="${item.genCode}"
                                        <c:if test="${item.genCode == auditInfo.mstSubsyBaseEntity.brandCode}">selected</c:if> >${item.genSubName}</option>
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
                <div class="layui-input-inline inline-adress">
                    <input type="text" name="subsyAddr" value="${auditInfo.mstSubsyBaseEntity.subsyAddr}" placeholder="请输入地址"
                           autocomplete="off" class="layui-input" lay-verify="notnull" maxlength="128">
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>固定电话</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phoneNum" value="${auditInfo.mstSubsyBaseEntity.phoneNum}" placeholder="请输入固定电话"
                               autocomplete="off" class="layui-input" maxlength="16"
                               minlength="8" lay-verify="notnull">
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>手机号码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mobNum" value="${auditInfo.mstSubsyBaseEntity.mobNum}" placeholder="请输入手机号码"
                               autocomplete="off" class="layui-input" maxlength="11" lay-verify="notnull|phone">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">邮政编码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="postNo" value="${auditInfo.mstSubsyBaseEntity.postNo}" autocomplete="off"
                               placeholder="请输入邮政编码" class="layui-input" lay-verify="zipcode" maxlength="6">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">营业时间描述</label>
                    <div class="layui-input-inline">
                            <textarea placeholder="请输入内容" name="busiTimeDesc"
                                      class="layui-textarea" maxlength="256">${auditInfo.mstSubsyBaseEntity.busiTimeDesc}</textarea>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">促销相关描述</label>
                    <div class="layui-input-inline">
                            <textarea placeholder="请输入内容" name="promotionDesc"
                                      class="layui-textarea" maxlength="256">${auditInfo.mstSubsyBaseEntity.promotionDesc}</textarea>
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">预约相关描述</label>
                    <div class="layui-input-inline">
                            <textarea placeholder="请输入内容" name="bookDesc"
                                      class="layui-textarea" maxlength="256">${auditInfo.mstSubsyBaseEntity.bookDesc}</textarea>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>人均价格(RMB)</label>
                    <div class="layui-input-inline">
                        <input type="text" name="price" value="${auditInfo.mstSubsyBaseEntity.price}" autocomplete="off"
                               class="layui-input" placeholder="请输人均价格(数字)" lay-verify="notnull" maxlength="10">
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">会所描述</label>
                    <div class="layui-input-inline">
                            <textarea placeholder="请输入内容" name="subsyDesc"
                                      class="layui-textarea" maxlength="256">${auditInfo.mstSubsyBaseEntity.subsyDesc}</textarea>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>会所类型</label>
                    <div class="layui-input-inline">
                        <select id="subsyBrandType" name="subsyBrandType" lay-verify="selectcheck" vb=会所类型 lay-filter="subsyBrandType">
                            <option value="">请选择</option>
                            <c:forEach items="${subsyBrandTypeList}" var="item">
                                <option value="${item.genCode}"
                                        <c:if test="${item.genCode == auditInfo.mstSubsyBaseEntity.subsyBrandType}">selected</c:if> >${item.genSubName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <label class="layui-form-label label-style">会所名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="subsyName" name="subsyName" value="${auditInfo.mstSubsyBaseEntity.subsyName}" autocomplete="off"
                           class="layui-input" placeholder="自动生成" lay-verify="notnull" maxlength="32" readonly>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>会所入驻日期</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                               id="subsyActivStartTimeDisplay" name="subsyActivStartTimeDisplay" value="${auditInfo.mstSubsyBaseEntity.subsyActivStartTimeDisplay}" placeholder="会所入驻日期"  />
                    </div>
                </div>
                <div class=" layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>会所有效期</label>
                    <div class="layui-input-inline">
                        <select id="subsyActivYears" name="subsyActivYears" lay-verify="selectcheck" vb=会所有效期 lay-filter="subsyActivYears">
                            <option value="">请选择</option>
                            <c:forEach items="${subsyActivYearsList}" var="item">
                                <option value="${item.genCode}"
                                        <c:if test="${item.genCode == auditInfo.mstSubsyBaseEntity.subsyActivYears}">selected</c:if> >${item.genSubName}</option>
                            </c:forEach>
                        </select>
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
                               value="${auditInfo.mstSubsyAddEntity.busiLcnsNo}" placeholder="请输入营业执照号码" autocomplete="off"
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
                               value="${auditInfo.mstSubsyAddEntity.regAddr}" placeholder="请输入注册地址" autocomplete="off"
                               class="layui-input" lay-verify="notnull" maxlength="128">
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style">注册地邮编</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.regPostNo"
                               value="${auditInfo.mstSubsyAddEntity.regPostNo}" placeholder="请输入注册地邮编"
                               autocomplete="off" class="layui-input" lay-verify="zipcode" maxlength="6">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>法人名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.corpPersnName"
                               value="${auditInfo.mstSubsyAddEntity.corpPersnName}" placeholder="请输入法人名称"
                               autocomplete="off" class="layui-input" lay-verify="notnull" maxlength="16">
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>法人手机号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.corpPersnPhoneNum"
                               value="${auditInfo.mstSubsyAddEntity.corpPersnPhoneNum}" placeholder="请输入法人手机号"
                               autocomplete="off" class="layui-input" lay-verify="notnull|phone" maxlength="11">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>负责人名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.resbPersnName"
                               value="${auditInfo.mstSubsyAddEntity.resbPersnName}" placeholder="请输入负责人名称"
                               autocomplete="off" class="layui-input" lay-verify="notnull"  maxlength="16">
                    </div>
                </div>
                <div class="  layui-col-md6">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>负责人手机号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mstSubsyAddEntity.resbPersnPhoneNum"
                                value="${auditInfo.mstSubsyAddEntity.resbPersnPhoneNum}"
                                placeholder="请输入负责人手机号"
                                autocomplete="off"
                                class="layui-input"
                                lay-verify="notnull|phone"
                                maxlength="11">
                    </div>
                </div>
            </div>
            <c:if test="${(auditInfo.isAllowEditSubsy == null || auditInfo.isAllowEditSubsy == 1) }">
                <div class="layui-form-item btn-position">
                    <%--<div class=" layui-inline">--%>
                        <%--<button class="layui-btn" lay-submit lay-filter="createSubsyBase">保存</button>--%>
                    <%--</div>--%>
                    <%--<c:if test="${auditInfo.subsyCode != null}">--%>
                        <%--<div class=" layui-inline">--%>
                            <%--<button class="layui-btn layui-btn-primary next-step" lay-submit lay-filter="saveSubsyBase">下一步baseinfo.jsp</button>--%>
                        <%--</div>--%>
                    <%--</c:if>--%>

                    <div class=" layui-inline">
                        <button class="layui-btn" lay-submit="" lay-filter="submitSubsyBase">提交审核</button>
                    </div>
                    <div class=" layui-inline">
                        <button type="button" class="layui-btn layui-btn-primary backBtn">返回</button>
                    </div>
                </div>
            </c:if>
        </form>
    </div>
</div>