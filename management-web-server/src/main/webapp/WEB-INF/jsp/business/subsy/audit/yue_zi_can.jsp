<%@ page contentType="text/html;charset=UTF-8" %>
<div class="layui-tab-item">
    <div class="col_main lightshadow form-panel layui-col-md12">
        <c:if test="${(auditInfo.isAllowEditProduct != null && auditInfo.isAllowEditProduct == 1) }">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>月子餐产品</legend>
            </fieldset>

            <form class="layui-form" action="" id="yuezicanForm">
                <input type="hidden" name="subsyCode" class="subsyCode" value="${auditInfo.subsyCode}">
                <input type="hidden" name="prodTypeCode" value="00110003"/>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">餐品名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="prodName" autocomplete="off"
                                   class="layui-input" placeholder="请输入餐品名称" lay-verify="notnull"
                                   maxlength="32">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="prodAmt" autocomplete="off"
                                   class="layui-input" placeholder="请输入价格" lay-verify="notnull"
                                   maxlength="32">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">折扣后价格最小折扣率</label>
                        <div class="layui-input-inline">
                            <input type="text" name="minDiscountRate" autocomplete="off"
                                   class="layui-input" placeholder="请输入折扣后价格最小折扣率" lay-verify="notnull"
                                   maxlength="32"><span style="margin-left: 10px;color:blue;">例如：7.5 表示最多打7.5折，0表示允许任意折扣，10表示不允许打折</span>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md12">
                        <label class="layui-form-label label-style">banner图(1张)</label>
                        <div class="layui-input-inline">
                            <span style="float: left;">
                                 <input type="hidden" name="bannerCode">
                            </span>
                            <input type="hidden" value="00480006">
                            <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadImg">
                                <i class="layui-icon">&#xe67c;</i>上传
                            </button>
                            <span style="margin-left: 10px;color:blue;">查看示例</span>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md12">
                        <label class="layui-form-label label-style">缩略图(1张)</label>
                        <div class="layui-input-inline">
                            <span style="float: left">
                                 <input type="hidden" name="thumbnailCode">
                            </span>
                            <input type="hidden" value="00480004">
                            <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadImg">
                                <i class="layui-icon">&#xe67c;</i>上传
                            </button>
                            <span style="margin-left: 10px;color:blue;">查看示例</span>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md12">
                        <label class="layui-form-label label-style">详情图(多张)</label>
                        <div class="layui-input-inline">
                            <span style="float: left">
                                 <input type="hidden" name="detailCodes">
                            </span>
                            <input type="hidden" value="00480007">
                            <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadMultiImg">
                                <i class="layui-icon">&#xe67c;</i>上传
                            </button>
                            <span style="margin-left: 10px;color:blue;">查看示例</span>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md12">
                        <label class="layui-form-label label-style">餐品描述</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请输入内容" name="prodDesc" class="layui-textarea"></textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md10" style="margin-top:10px;text-align: right">
                        <button class="layui-btn" lay-submit lay-filter="addProduct">
                            <i class="layui-icon">&#xe608;</i>添 加
                        </button>
                    </div>
                </div>
            </form>
        </c:if>
        <form class="layui-form">
            <input type="hidden" name="subsyCode" class="subsyCode" value="${auditInfo.subsyCode}">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>已添加月子餐</legend>
            </fieldset>

            <div class="layui-form-item layui-row">
                <div class="layui-col-md12">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>餐品名称</th>
                            <th>价格</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="yuezican_content">
                        <c:set var="muyingchanpincount" value="0"></c:set>
                        <c:forEach items="${auditInfo.mstOrderProdEntityList}" var="orderProd" varStatus="vs">
                            <c:if test="${orderProd.prodTypeCode == '00110003'}">
                                <tr>
                                    <td>${muyingchanpincount = muyingchanpincount + 1}</td>
                                    <td>
                                        <span class="prodName_span_${vs.index}">${orderProd.prodName}</span>
                                        <input type="hidden"
                                               name="mstOrderProdEntityList[${vs.index}].prodName"
                                               class="prodName_${vs.index}"
                                               value="${orderProd.prodName}"/>
                                        <input type="hidden"
                                               name="mstOrderProdEntityList[${vs.index}].bannerCode"
                                               class="bannerCode_${vs.index}"
                                               value="${orderProd.bannerCode}"/>
                                        <input type="hidden"
                                               name="mstOrderProdEntityList[${vs.index}].thumbnailCode"
                                               class="thumbnailCode_${vs.index}"
                                               value="${orderProd.thumbnailCode}"/>
                                        <input type="hidden"
                                               name="mstOrderProdEntityList[${vs.index}].detailCodes"
                                               class="detailCodes_${vs.index}"
                                               value="${orderProd.detailCodes}"/>
                                        <input type="hidden"
                                               name="mstOrderProdEntityList[${vs.index}].prodDesc"
                                               class="prodDesc_${vs.index}"
                                               value="${orderProd.prodDesc}"/>
                                        <input type="hidden"
                                               name="mstOrderProdEntityList[${vs.index}].prodTypeCode"
                                               class="prodTypeCode_${vs.index}"
                                               value="${orderProd.prodTypeCode}"/>
                                    </td>
                                    <td>
                                        <span class="prodAmt_span_${vs.index}">${orderProd.prodAmt}</span>
                                        <input type="hidden"
                                               name="mstOrderProdEntityList[${vs.index}].prodAmt"
                                               class="prodAmt_${vs.index}"
                                               value="${orderProd.prodAmt}"/>
                                    </td>
                                    <td>
                                        <input type="hidden" class="orderProdCode" name="orderProdCode" value="${orderProd.orderProdCode}" />
                                        <input type="hidden" class="subsyCode" name="subsyCode" value="${orderProd.subsyCode}"/>
                                        <c:if test="${(auditInfo.isAllowEditProduct != null && auditInfo.isAllowEditProduct == 1) }">
                                            <a class="layui-btn layui-btn-xs btnModifyProd" lay-event="edit" prodTypeCode="${orderProd.prodTypeCode}" orderProdCode="${orderProd.orderProdCode}">编辑</a>
                                            <a class="layui-btn layui-btn-danger layui-btn-xs delRow">删 除</a>
                                        </c:if>
                                        <c:if test="${(auditInfo.isAllowEditProduct == null || auditInfo.isAllowEditProduct == 0) }">
                                            <a class="layui-btn layui-btn-xs btnViewProd" lay-event="edit" prodTypeCode="${orderProd.prodTypeCode}" orderProdCode="${orderProd.orderProdCode}">查看</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <c:if test="${(auditInfo.isAllowEditProduct != null && auditInfo.isAllowEditProduct == 1) }">
                <div class="layui-form-item btn-position">
                    <%--<div class=" layui-inline">--%>
                        <%--<button type="button" class="layui-btn layui-btn-primary" lay-filter="yuezicanSaveBtn">保存</button>--%>
                    <%--</div>--%>
                    <%--<div class=" layui-inline">--%>
                        <%--<button class="layui-btn layui-btn-primary next-step" lay-submit lay-filter="yuezicanNextBtn">下一步yuezican--%>
                        <%--</button>--%>
                    <%--</div>--%>
                        <div class="layui-inline">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="submitProdApply">提交审核</button>
                        </div>
                        <div class="layui-inline">
                            <button type="button" class="layui-btn layui-btn-primary backBtn">返回</button>
                        </div>
                </div>
            </c:if>
        </form>
    </div>
</div>

<div class="layui-form-item layui-row" style="display: none">
    <div class="layui-col-md12">
        <table class="layui-table">
            <tbody id="yuezican_mock">
            <tr>
                <td>

                </td>
                <td>
                    <span class="prodName_span_$$ROWNUM$$"></span>
                    <input type="hidden"
                           name="mstOrderProdEntityList[$$ROWNUM$$].prodName"
                           class="prodName_$$ROWNUM$$"/>
                    <input type="hidden"
                           name="mstOrderProdEntityList[$$ROWNUM$$].bannerCode"
                           class="bannerCode_$$ROWNUM$$"/>
                    <input type="hidden"
                           name="mstOrderProdEntityList[$$ROWNUM$$].thumbnailCode"
                           class="thumbnailCode_$$ROWNUM$$"/>
                    <input type="hidden"
                           name="mstOrderProdEntityList[$$ROWNUM$$].detailCodes"
                           class="detailCodes_$$ROWNUM$$"/>
                    <input type="hidden"
                           name="mstOrderProdEntityList[$$ROWNUM$$].prodDesc"
                           class="prodDesc_$$ROWNUM$$"/>
                    <input type="hidden"
                           name="mstOrderProdEntityList[$$ROWNUM$$].prodTypeCode"
                           class="prodTypeCode_$$ROWNUM$$"/>
                </td>
                <td>
                    <span class="prodAmt_span_$$ROWNUM$$"></span>
                    <input type="hidden"
                           name="mstOrderProdEntityList[$$ROWNUM$$].prodAmt"
                           class="prodAmt_$$ROWNUM$$"/>
                </td>
                <td>
                    <input type="hidden" class="orderProdCode" name="orderProdCode"/>
                    <input type="hidden" class="subsyCode" name="subsyCode"/>
                    <c:if test="${(auditInfo.isAllowEditProduct != null && auditInfo.isAllowEditProduct == 1) }">
                        <a class="layui-btn layui-btn-xs btnModifyProd" lay-event="edit" prodTypeCode="orderProd_prodTypeCode" orderProdCode="orderProd_orderProdCode">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs delRow">删 除</a>
                    </c:if>
                    <c:if test="${(auditInfo.isAllowEditProduct == null || auditInfo.isAllowEditProduct == 0) }">
                        <a class="layui-btn layui-btn-xs btnViewProd" lay-event="edit" prodTypeCode="orderProd_prodTypeCode" orderProdCode="orderProd_orderProdCode">查看</a>
                    </c:if>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
