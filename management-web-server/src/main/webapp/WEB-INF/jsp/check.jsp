<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../jsp/common/resource.jsp" %>
    <%@ include file="../jsp/common/tags.jsp" %>

    <title>菜单管理</title>

    <!-- Bootstrap core CSS -->
    <%--<link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">--%>
    <!--external css-->
    <%--<link rel="stylesheet" type="text/css" href="${ctx}/static/css/zabuto_calendar.css">--%>
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <script src="${ctx}/static/js/common/jquery-1.11.1.min.js?v=${webVersion}"></script>
    <script src="${ctx}/static/js/common/jquery.step.min.js?v=${webVersion}"></script>
    <%--<!-- Custom styles for this template -->--%>
    <%--<link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">--%>
    <%--<link href="${ctx}/static/css/style-responsive.css" rel="stylesheet">--%>


</head>

<body>
<div class="row mt wrapper  layui-container " style="padding-top: 39px;">

    <div class=" layui-row row-style" style="background-color: #fff;">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>审核信息</legend>
        </fieldset>
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color:red">※</span>审核备注</label>
            <div class="layui-input-inline">
                                <textarea readonly class="layui-textarea" lay-verify="required"
                                          lay-verType="tips"></textarea>
            </div>
        </div>
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
        <div class="layui-tab" lay-filter="test1">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="0" >会所信息</li>
                <li lay-id="1">添加房型</li>
                <li lay-id="2">月嫂</li>
                <li lay-id="3">月子餐</li>
                <li lay-id="4">增值服务</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
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
                                    <button id="back" type="button" class="layui-btn layui-btn-primary">下一页</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="col_main lightshadow form-panel layui-col-md12">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>添加房型</legend>
                        </fieldset>

                        <form class="layui-form" action="">

                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">会所名</label>
                                    <div class="layui-input-inline">
                                        <input type="tel" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="上海静安会所">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">房间名称</label>
                                    <div class="layui-input-inline">
                                        <input type="tel" name="name" lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">banner图(1张)</label>
                                    <div class="layui-input-inline">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">缩略图（1张）</label>
                                    <div class="layui-input-inline">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">详情图(多张)</label>
                                    <div class="layui-input-inline">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">房间描述</label>
                                    <div class="layui-input-inline">
                                        <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                                    </div>
                                </div>
                            </div>

                            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                <legend>已添加房型</legend>
                            </fieldset>

                            <div class="layui-form-item layui-row">
                                <div class="  layui-col-md12">
                                    <table class="layui-table">
                                        <colgroup>
                                            <col width="150">
                                            <col width="200">
                                            <col>
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>会所名称</th>
                                            <th>房间名称</th>
                                            <th>描述</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>上海静安会所</td>
                                            <td>豪华房</td>
                                            <td>豪华到你想不到</td>
                                            <td><a class="layui-btn layui-btn-xs" lay-event="edit">查看</a></td>
                                        </tr>
                                        <tr>
                                            <td>上海静安会所</td>
                                            <td>豪华房</td>
                                            <td>豪华到你想不到</td>
                                            <td><a class="layui-btn layui-btn-xs" lay-event="edit">查看</a></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="layui-form-item btn-position">
                                <div class=" layui-inline">
                                    <button class="layui-btn layui-btn-primary next-step"   lay-filter="demo1">下一页</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="col_main lightshadow form-panel layui-col-md12">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>新建月嫂</legend>
                        </fieldset>

                        <form class="layui-form" action="">

                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">会所名</label>
                                    <div class="layui-input-inline">
                                        <input type="tel" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="上海静安会所">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">服务名称</label>
                                    <div class="layui-input-inline">
                                        <input type="tel" name="name" lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">banner图(1张)</label>
                                    <div class="layui-input-inline">
                                        <%--<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" >--%>
                                            <%--<i class="layui-icon">&#xe67c;</i>上传--%>
                                        <%--</button>--%>
                                        <%--<span style="margin-left: 10px;color:blue;">查看示例</span>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">缩略图（1张）</label>
                                    <div class="layui-input-inline">
                                        <%--<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" >--%>
                                            <%--<i class="layui-icon">&#xe67c;</i>上传--%>
                                        <%--</button>--%>
                                        <%--<span style="margin-left: 10px;color:blue;">查看示例</span>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">详情图(多张)</label>
                                    <div class="layui-input-inline">
                                        <%--<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" >--%>
                                            <%--<i class="layui-icon">&#xe67c;</i>上传--%>
                                        <%--</button>--%>
                                        <%--<span style="margin-left: 10px;color:blue;">查看示例</span>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">服务描述</label>
                                    <div class="layui-input-inline">
                                        <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                                    </div>
                                </div>
                            </div>

                            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                <legend>已添加月嫂服务</legend>
                            </fieldset>

                            <div class="layui-form-item layui-row">
                                <div class="  layui-col-md12">
                                    <table class="layui-table">
                                        <colgroup>
                                            <col width="150">
                                            <col width="200">
                                            <col>
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>会所名称</th>
                                            <th>名称</th>
                                            <th>描述</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>上海静安会所</td>
                                            <td>一星月嫂</td>
                                            <td>专业的团队</td>
                                            <td><a class="layui-btn layui-btn-xs" lay-event="edit">查看</a></td>
                                        </tr>
                                        <tr>
                                            <td>上海静安会所</td>
                                            <td>五星月嫂</td>
                                            <td>顾客就是上帝</td>
                                            <td><a class="layui-btn layui-btn-xs" lay-event="edit">查看</a></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="layui-form-item btn-position">
                                <div class=" layui-inline">
                                    <button class="layui-btn layui-btn-primary next-step"   lay-filter="demo1">下一页</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="col_main lightshadow form-panel layui-col-md12">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>添加月子餐</legend>
                        </fieldset>

                        <form class="layui-form" action="">

                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">会所名</label>
                                    <div class="layui-input-inline">
                                        <input type="tel" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="上海静安会所">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">餐品名称</label>
                                    <div class="layui-input-inline">
                                        <input type="tel" name="name" lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">banner图(1张)</label>
                                    <div class="layui-input-inline">
                                        <%--<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" >--%>
                                            <%--<i class="layui-icon">&#xe67c;</i>上传--%>
                                        <%--</button>--%>
                                        <%--<span style="margin-left: 10px;color:blue;">查看示例</span>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">缩略图（1张）</label>
                                    <div class="layui-input-inline">
                                        <%--<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" >--%>
                                            <%--<i class="layui-icon">&#xe67c;</i>上传--%>
                                        <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
                                        <%--<span style="margin-left: 10px;color:blue;">查看示例</span>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">详情图(多张)</label>
                                    <div class="layui-input-inline">
                                        <%--<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" >--%>
                                            <%--<i class="layui-icon">&#xe67c;</i>上传--%>
                                        <%--</button>--%>
                                        <%--<span style="margin-left: 10px;color:blue;">查看示例</span>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">餐品描述</label>
                                    <div class="layui-input-inline">
                                        <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                                    </div>
                                </div>
                            </div>

                            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                <legend>已添加月子餐</legend>
                            </fieldset>

                            <div class="layui-form-item layui-row">
                                <div class="  layui-col-md12">
                                    <table class="layui-table">
                                        <colgroup>
                                            <col width="150">
                                            <col width="200">
                                            <col>
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>会所名称</th>
                                            <th>餐品名称</th>
                                            <th>餐品描述</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>上海静安会所</td>
                                            <td>一般餐品</td>
                                            <td>好吃到你想不到</td>
                                            <td><a class="layui-btn layui-btn-xs" lay-event="edit">查看</a></td>
                                        </tr>
                                        <tr>
                                            <td>上海静安会所</td>
                                            <td>豪华餐品</td>
                                            <td>好吃到你想不到</td>
                                            <td><a class="layui-btn layui-btn-xs" lay-event="edit">查看</a></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="col_main lightshadow form-panel layui-col-md12">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>增值服务</legend>
                        </fieldset>

                        <form class="layui-form" action="">

                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">会所名</label>
                                    <div class="layui-input-inline">
                                        <input type="tel" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="上海静安会所">
                                    </div>
                                </div>
                            </div>

                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">服务名称</label>
                                    <div class="layui-input-inline">
                                        <input type="tel" name="name" lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">+c
                                    <label class="layui-form-label label-style">可选数量</label>
                                    <div class="layui-input-inline">
                                        <input type="checkbox" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="开|关">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">banner图(1张)</label>
                                    <div class="layui-input-inline">
                                        <%--<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" >--%>
                                            <%--<i class="layui-icon">&#xe67c;</i>上传--%>
                                        <%--</button>--%>
                                        <%--<span style="margin-left: 10px;color:blue;">查看示例</span>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">缩略图（1张）</label>
                                    <div class="layui-input-inline">
                                        <%--<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" >--%>
                                            <%--<i class="layui-icon">&#xe67c;</i>上传--%>
                                        <%--</button>--%>
                                        <%--<span style="margin-left: 10px;color:blue;">查看示例</span>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">详情图(多张)</label>
                                    <div class="layui-input-inline">
                                        <%--<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" >--%>
                                            <%--<i class="layui-icon">&#xe67c;</i>上传--%>
                                        <%--</button>--%>
                                        <%--<span style="margin-left: 10px;color:blue;">查看示例</span>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">服务描述</label>
                                    <div class="layui-input-inline">
                                        <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                                    </div>
                                </div>
                            </div>

                            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                <legend>已添加服务</legend>
                            </fieldset>

                            <div class="layui-form-item layui-row">
                                <div class="  layui-col-md12">
                                    <table class="layui-table">
                                        <colgroup>
                                            <col width="150">
                                            <col width="200">
                                            <col>
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>会所名称</th>
                                            <th>服务名称</th>
                                            <th>描述</th>
                                            <th>是否可选数量</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>上海静安会所</td>
                                            <td>宝宝游泳</td>
                                            <td>舒服到你想不到</td>
                                            <td>是</td>
                                            <td><a class="layui-btn layui-btn-xs" lay-event="edit">查看</a></td>
                                        </tr>
                                        <tr>
                                            <td>上海静安会所</td>
                                            <td>宝宝赛跑</td>
                                            <td>厉害到你想不到</td>
                                            <td>否</td>
                                            <td><a class="layui-btn layui-btn-xs" lay-event="edit">查看</a></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<div class='layerbox' id='lottery' style="display:none;    width: 450px;">
    <div class="layui-form-item layui-row" style="margin-top: 30px">
        <div class="  layui-col-md12">
            <label class="layui-form-label label-style">会所名</label>
            <div class="layui-input-inline">
                <input type="tel" name="name" lay-verify="required" autocomplete="off" class="layui-input " value="上海静安会所" style="border: none;">
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-row">
        <div class=" layui-col-md12">
            <label class="layui-form-label label-style">banner图(1张)</label>
            <div class="layui-input-inline">
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-row">
        <div class=" layui-col-md12">
            <label class="layui-form-label label-style">缩略图（1张）</label>
            <div class="layui-input-inline">
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-row">
        <div class=" layui-col-md12">
            <label class="layui-form-label label-style">详情图(多张)</label>
            <div class="layui-input-inline">
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-row">
        <div class=" layui-col-md12">
            <label class="layui-form-label label-style">房间描述</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
    </div>
    <div class="layui-form-item btn-position">
        <div class=" layui-inline">
            <button class="layui-btn  next-step"   lay-filter="demo1">确定</button>
        </div>
    </div>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    $(".layui-btn-xs").click(function(){
        layer.open({
            title:"房型",
            area: ['500px', '470px'],
            type: 1,
            content: $('#lottery') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
        });
    });
    // var $step = $("#step");
    // var $index = $("#index");
    //
    // $step.step({
    //     index: 0,
    //     time: 500,
    //     title: ["会所信息", "添加房型", "月嫂", "月子餐","增值服务"]
    // });

    layui.use(['form', 'element'], function(){
        var form = layui.form;
        var element = layui.element;


        var layid = location.hash.replace(/^#test1=/, '');//根据hash来改变tab
        element.tabChange('test1', layid);
        $("#prevBtn").on("click", function() {
            $step.prevStep();
            element.tabChange('test1', $step.getIndex());//传入相应的lay-id属性，下面tab切换
        });//上一步

        $(".next-step").on("click", function() {
            $step.nextStep();
            // $step.toStep(2);//改变某一个步骤的样式传入相应tab的lay-id
            element.tabChange('test1', $step.getIndex());//传入相应的lay-id属性，下面tab切换
        });//下一步。
        //监听Tab切换，以改变地址hash值
        element.on('tab(test1)', function(){
            location.hash = 'test1='+ this.getAttribute('lay-id');
            // $step.toStep( this.getAttribute('lay-id'))
        });
    });

</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/js/bootstrap.min.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/jquery.dcjqaccordion.2.7.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/jquery.scrollTo.min.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/jquery.nicescroll.js" ></script>
<script src="${ctx}/static/js/common-scripts.js?v=${webVersion}"></script>


</body>
</html>
