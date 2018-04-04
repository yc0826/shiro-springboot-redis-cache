<%@ page contentType="text/html;charset=UTF-8" %>
<div class="layui-tab-item">
    <div class="col_main lightshadow form-panel layui-col-md12">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>新建月嫂</legend>
        </fieldset>

        <form class="layui-form" action="" id="mmatronForm">
            <input type="hidden" name="mmatron_prodTypeCode" value="00110002"/>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md6">
                    <label class="layui-form-label label-style">月嫂等级名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mmatron_prodName" placeholder="请输入月嫂等级名称" lay-verify="notnull"
                               class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">价格</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mmatron_prodAmt" autocomplete="off"
                               class="layui-input" placeholder="请输入价格" lay-verify="notnull"
                               maxlength="32">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md12">
                    <label class="layui-form-label label-style">banner图(1张)</label>
                    <div class="layui-input-inline">
                        <span style="float: left;">
                             <input type="hidden" name="mmatron_bannerCode">
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
                             <input type="hidden" name="mmatron_thumbnailCode">
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
                             <input type="hidden" name="mmatron_detailCodes">
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
                    <label class="layui-form-label label-style">服务描述</label>
                    <div class="layui-input-inline">
                        <textarea placeholder="请输入内容" name="mmatron_prodDesc" class="layui-textarea"></textarea>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class=" layui-col-md10" style="margin-top:10px;text-align: right">
                    <button class="layui-btn" lay-submit lay-filter="addMmatron">
                        <i class="layui-icon">&#xe608;</i>添加
                    </button>
                </div>
            </div>
        </form>
        <form class="layui-form">
            <input type="hidden" name="subsyCode" class="subsyCode" value="${auditInfo.subsyCode}">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>已添加月嫂服务</legend>
            </fieldset>

            <div class="layui-form-item layui-row">
                <div class="layui-col-md12">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>名称</th>
                            <th>价格</th>
                            <th>描述</th>
                            <th style="width: 150px">操作</th>
                        </tr>
                        </thead>
                        <tbody id="mmatron_content">
                        <c:set var="mmcount" value="0"></c:set>
                        <c:forEach items="${auditInfo.mstOrderProdEntityList}" var="orderProd" varStatus="vs">
                            <c:if test="${orderProd.prodTypeCode == '00110002'}">
                                <tr>

                                    <td>${mmcount = mmcount + 1}</td>
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
                                        <span class="roomTypeDesc_span_${vs.index}">${orderProd.prodDesc}</span>
                                        <input type="hidden"
                                               name="mstOrderProdEntityList[${vs.index}].prodDesc"
                                               class="roomTypeDesc_${vs.index}"
                                               value="${orderProd.prodDesc}"/>

                                    </td>
                                    <td><a class="layui-btn layui-btn-danger layui-btn-xs delRow">删除</a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="layui-form-item btn-position">
                <div class="layui-inline">
                    <button type="button" class="layui-btn layui-btn-primary prev-step">上一步</button>
                </div>
                <div class=" layui-inline">
                    <button class="layui-btn layui-btn-primary next-step" lay-submit lay-filter="mmatronList">下一步
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="layui-form-item layui-row" style="display: none">
    <div class="layui-col-md12">
        <table class="layui-table">
            <tbody id="mmatron_mock">
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
                    <span class="prodDesc_span_$$ROWNUM$$"></span>
                    <input type="hidden"
                           name="mstOrderProdEntityList[$$ROWNUM$$].prodDesc"
                           class="prodDesc_$$ROWNUM$$"/>
                </td>
                <td><a class="layui-btn layui-btn-danger layui-btn-xs delRow">删除</a></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>