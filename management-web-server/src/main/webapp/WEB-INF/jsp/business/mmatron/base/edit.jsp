<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>护理师管理</title>
    <!-- Bootstrap core CSS -->
    <!--external css-->
    <!-- Custom styles for this template -->
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/multiple-select.css" rel="stylesheet">
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
    </style>
</head>

<body>
<div class="row mt wrapper  layui-container ">
    <div class=" layui-row row-style">
        <div class="form-panel">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>基本信息</legend>
            </fieldset>
            <form class="layui-form">
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>护理师姓</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLastName"
                                   autocomplete="off"
                                   class="layui-input"
                                   placeholder="请输入护理师姓"
                                   lay-verify="notnull"
                                   maxlength="16"
                                   value="${mmatron.mmatronLastName}"
                            >
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>护理师名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronFirstName"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入护理师名" lay-verify="notnull" maxlength="16"
                                   value="${mmatron.mmatronFirstName}">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>身份证</label>
                        <div class="layui-input-inline">
                            <input id="idCardNum" type="text" name="idCardNum"
                                   placeholder="请输入身份证" class="layui-input" lay-verify="idCardNum"
                                   autocomplete="false" maxlength="18" value="${mmatron.idCardNum}"/>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">性别</label>
                        <div class="layui-input-inline">
                            <div class="layui-input-inline inline-noborder">
                                <span id="gderFlg"></span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">属相</label>
                        <div class="layui-input-inline inline-noborder">
                            <span id="zodiacSpan"></span>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">星座</label>
                        <div class="layui-input-inline">
                            <div class="layui-input-inline inline-noborder">
                                <span id="constellationSpan"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">生日</label>
                        <div class="layui-input-inline inline-noborder">
                            <span id="birthdaySpan"></span>
                        </div>

                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">年龄</label>
                        <div class="layui-input-inline inline-noborder">
                            <span id="mmatronAgeSpan"></span>
                        </div>

                    </div>
                </div>
                <c:if test="${mmatron.mmatronBaseCode != null}">
                    <div class="layui-form-item layui-row">
                        <div class="layui-col-md6">
                            <label class="layui-form-label label-style"><span style="color:red">※</span>护理师编号</label>
                            <div class="layui-input-inline inline-noborder">
                                <span>${mmatron.mmatronBaseCode}</span>
                                <input type="hidden" name="mmatronBaseCode"
                                       value="${mmatron.mmatronBaseCode}"/>
                            </div>
                        </div>
                        <div class=" layui-col-md6">
                            <label class="layui-form-label label-style">护理师状态</label>
                            <div class="layui-input-inline inline-noborder">
                                <span>${mmatron.mmatronStatusName}</span>
                            </div>
                        </div>
                    </div>
                </c:if>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>仅服务本会所</label>
                        <div class="layui-input-inline">
                            <c:choose>
                                <c:when test="${mmatron.mmatronBaseCode == null}">
                                    <input type="radio" name="servOwnCompFlg" value="1" title="是"
                                           lay-filter="servOwnCompFlg">
                                    <input type="radio" name="servOwnCompFlg" value="0" title="否"
                                           lay-filter="servOwnCompFlg" checked>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${mmatron.servOwnCompFlg}">
                                        <input type="radio" name="servOwnCompFlg" value="1" title="是"
                                               lay-filter="servOwnCompFlg" checked>
                                        <input type="radio" name="servOwnCompFlg" value="0" title="否"
                                               lay-filter="servOwnCompFlg">
                                    </c:if>
                                    <c:if test="${!mmatron.servOwnCompFlg}">
                                        <input type="radio" name="servOwnCompFlg" value="1" title="是"
                                               lay-filter="servOwnCompFlg">
                                        <input type="radio" name="servOwnCompFlg" value="0" title="否"
                                               lay-filter="servOwnCompFlg" checked>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                    <div class="layui-col-md6" id="servCityCodes_div"
                         <c:if test="${mmatron.servOwnCompFlg}">style="display: none" </c:if> >
                        <label class="layui-form-label label-style"><span style="color:red">※</span>服务区域</label>
                        <div class="layui-input-inline layui-form" lay-filter="servCityCodesMs">
                            <select id="servCityCodesMs" multiple="multiple" lay-ignore
                                    vb="服务区域" <c:if test="${!mmatron.servOwnCompFlg}">lay-verify="selectcheck"</c:if>>
                                <c:forEach items="${shb:getMmatronServCityList()}" var="city">
                                    <option value="${city.regionId}">${city.regionName}</option>
                                </c:forEach>
                            </select>
                            <input type="hidden" id="mmatronServCityCodes" name="mmatronServCityCodes">
                        </div>
                    </div>

                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>护理师等级</label>
                        <div class="layui-input-inline">
                            <select name="mmatronGrade" lay-verify="selectcheck" vb="护理师等级">
                                <option value="">请选择</option>
                                <c:forEach items="${shb:getListByType('0043')}" var="gen">
                                    <option value="${gen.genCode}"
                                            <c:if test="${gen.genCode == mmatron.mmatronGrade}">selected</c:if> >${gen.genSubName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>服务类型</label>
                        <div class="layui-input-block">
                            <c:set var="tranSpeci" value=",${mmatron.mmatronServSpeciDesc},"/>
                            <input type="checkbox" lay-skin="primary" name="mmatronServSpeciDescArray[0]" value="住家月嫂"
                                   title="住家月嫂"
                            <c:if test="${fn:contains(tranSpeci,',住家月嫂,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronServSpeciDescArray[1]" value="会所月嫂"
                                   title="会所月嫂"
                            <c:if test="${fn:contains(tranSpeci,',会所月嫂,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronServSpeciDescArray[2]" value="育儿嫂"
                                   title="育儿嫂"
                            <c:if test="${fn:contains(tranSpeci,',育儿嫂,')}">
                                   checked
                            </c:if>
                            >
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">身高(cm)</label>
                        <div class="layui-input-inline">
                            <input type="text"
                                   name="height"
                                   placeholder="请输入身高"
                                   class="layui-input"
                                   autocomplete="off" value="${mmatron.height}"/>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">体重(kg)</label>
                        <div class="layui-input-inline">
                            <input type="text" name="weight"
                                   placeholder="请输入体重" class="layui-input"
                                   autocomplete="off" value="${mmatron.weight}"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">政治面貌</label>
                        <div class="layui-input-inline">
                            <select name="politicalStatus">
                                <option value="">请选择</option>
                                <c:forEach items="${shb:getListByType('0070')}" var="gen">
                                    <option value="${gen.genSubName}"
                                            <c:if test="${gen.genSubName == mmatron.politicalStatus}">selected</c:if> >${gen.genSubName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">民族</label>
                        <div class="layui-input-inline">
                            <input type="text" name="nation"
                                   placeholder="请输入民族"
                                   class="layui-input"
                                   autocomplete="off" value="${mmatron.nation}"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">血型</label>
                        <div class="layui-input-inline">
                            <select name="bloodType">
                                <option value="">请选择</option>
                                <c:forEach items="${shb:getListByType('0073')}" var="gen">
                                    <option value="${gen.genSubName}"
                                            <c:if test="${gen.genSubName == mmatron.bloodType}">selected</c:if> >${gen.genSubName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>文化程度</label>
                        <div class="layui-input-inline">
                            <select name="mmatronEducatName" lay-verify="selectcheck" vb="文化程度">
                                <option value="">请选择</option>
                                <c:forEach items="${shb:getListByType('0071')}" var="gen">
                                    <option value="${gen.genSubName}"
                                            <c:if test="${gen.genSubName == mmatron.mmatronEducatName}">selected</c:if> >${gen.genSubName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">毕业学校</label>
                        <div class="layui-input-inline">
                            <input type="text"
                                   name="graduateFrom"
                                   placeholder="请输入毕业学校"
                                   class="layui-input"
                                   autocomplete="off" value="${mmatron.graduateFrom}"/>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">专业</label>
                        <div class="layui-input-inline">
                            <input type="text" name="majored"
                                   placeholder="请输入专业" class="layui-input"
                                   autocomplete="off" value="${mmatron.majored}"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">

                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>归属公司</label>
                        <div class="layui-input-inline">
                            <select name="subsyCode" lay-search lay-verify="selectcheck" vb="归属公司">
                                <option value="">请选择</option>
                                <c:forEach items="${subsyList}" var="subsy">
                                    <option value="${subsy.subsyCode}"
                                            <c:if test="${subsy.subsyCode == mmatron.subsyCode}">selected</c:if> >${subsy.subsyDispName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>开户行名称</label>
                        <div class="layui-input-inline">
                            <input type="text"
                                   name="bankName"
                                   placeholder="请输入开户行名称"
                                   class="layui-input"
                                   lay-verify="notnull"
                                   maxlength="30"
                                   autocomplete="off" value="${mmatron.bankName}"/>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>开户行账户名</label>
                        <div class="layui-input-inline">
                            <input type="text"
                                   name="bankAccountName"
                                   placeholder="请输入开户行账户名"
                                   class="layui-input"
                                   lay-verify="notnull"
                                   maxlength="30"
                                   autocomplete="off"
                                   value="${mmatron.bankAccountName}"
                            />
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>开户行卡号</label>
                        <div class="layui-input-inline">
                            <input type="text"
                                   name="bankCardNo"
                                   placeholder="请输入开户行卡号"
                                   class="layui-input"
                                   maxlength="30"
                                   lay-verify="notnull|number"
                                   autocomplete="off"
                                   value="${mmatron.bankCardNo}"
                            />
                        </div>
                    </div>

                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">籍贯</label>
                        <div class="layui-input-inline">
                            <select name="mmatronNativeName" lay-search>
                                <option value="">请选择</option>
                                <c:forEach items="${shb:getCityList()}" var="city">
                                    <option value="${city.regionName}"
                                            <c:if test="${city.regionName == mmatron.mmatronNativeName}">selected</c:if>>${city.regionName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>现居住地</label>
                        <div class="layui-input-inline">
                            <input type="text" name="ghetto" value="${mmatron.ghetto}" placeholder="请输入现居住地"
                                   autocomplete="off" class="layui-input" lay-verify="notnull" maxlength="50">
                        </div>
                    </div>

                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>紧急联系人</label>
                        <div class="layui-input-inline">
                            <input type="text"
                                   name="urgentContact"
                                   value="${mmatron.urgentContact}"
                                   placeholder="请输入联系人姓名"
                                   maxlength="12"
                                   class="layui-input"
                                   lay-verify="notnull"
                                   autocomplete="off"/>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>紧急联系电话</label>
                        <div class="layui-input-inline">
                            <input type="text"
                                   name="urgentContactPhone"
                                   value="${mmatron.urgentContactPhone}"
                                   placeholder="请输入紧急联系电话"
                                   class="layui-input"
                                   maxlength="11"
                                   lay-verify="notnull|number"
                                   autocomplete="off"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">

                        <div class=" layui-form-item layui-row">
                            <div class=" layui-col-md12">
                                <label class="layui-form-label label-style">婚姻状况</label>
                                <div class="layui-input-inline">
                                    <select name="maritalStatus">
                                        <option value="">请选择</option>
                                        <c:forEach items="${shb:getListByType('0072')}" var="gen">
                                            <option value="${gen.genSubName}"
                                                    <c:if test="${gen.genSubName == mmatron.maritalStatus}">selected</c:if> >${gen.genSubName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class=" layui-form-item layui-row">
                            <div class=" layui-col-md12">
                                <label class="layui-form-label label-style"><span style="color:red">※</span>手机号</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="mmatronMobNum"
                                           placeholder="请输入手机号" class="layui-input" lay-verify="notnull|phone"
                                           autocomplete="false" maxlength="11" value="${mmatron.mmatronMobNum}"/>
                                </div>
                            </div>
                        </div>
                        <div class=" layui-form-item layui-row">
                            <div class=" layui-col-md12">
                                <label class="layui-form-label label-style">介绍人</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="introducer" value="${mmatron.introducer}"
                                           placeholder="请输入介绍人"
                                           autocomplete="off" class="layui-input" maxlength="128">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">用户头像</label>
                        <div class="layui-input-inline">
                            <span style="float: left;display: inline-block">
                                <c:if test="${mmatron.avtrImgCode != null}">
                                   <div class="img-box">
                                       <img src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${mmatron.avtrImgCode}"
                                            width="200"
                                            height="200">
                                       <div class="del-icon">
                                    <i class="layui-icon">&#x1006;</i>
                                       </div>
                                   </div>
                                </c:if>
                            </span>
                            <input type="hidden" name="avtrImgCode" value="${mmatron.avtrImgCode}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" value="00480003">
                                <button type="button" class="layui-btn  layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                            </span>
                        </div>
                    </div>
                </div>

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>证书及特长</legend>
                </fieldset>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px"><span style="color:red">※</span>健康证</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLicense[0].getDate" id="getDate_0" autocomplete="off"
                                   class="layui-input" value="${mmatron.getDateA}" lay-verify="notnull">
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">到期日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLicense[0].expiredDate" id="expiredDate_0"
                                   autocomplete="off" class="layui-input" value="${mmatron.expiredDateA}"
                                   lay-verify="notnull">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">附件照片</label>
                        <div class="layui-input-inline">

                            <span style="float: left;display: inline-block">
                               <c:if test="${mmatron.imageCodeA != null}">
                                   <div class="img-box">
                                       <img src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${mmatron.imageCodeA}"
                                            width="200"
                                            height="200">
                                       <div class="del-icon">
                                    <i class="layui-icon">&#x1006;</i>
                                       </div>
                                   </div>
                               </c:if>
                            </span>
                            <input type="hidden" id="imageCode_0" name="mmatronLicense[0].imageCode"
                                   value="${mmatron.imageCodeA}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[0].licenseTypeCode" id="licenseTypeCode_0"
                                       value="00750001">
                                <button type="button" class="layui-btn  layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px"><span style="color:red">※</span>母婴护理证</legend>
                </fieldset>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLicense[1].getDate" id="getDate_1" autocomplete="off"
                                   class="layui-input" value="${mmatron.getDateB}" lay-verify="notnull">
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">到期日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLicense[1].expiredDate" id="expiredDate_1"
                                   autocomplete="off" class="layui-input" value="${mmatron.expiredDateB}"
                                   lay-verify="notnull">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">附件照片</label>
                        <div class="layui-input-inline">
                            <span style="float: left;display: inline-block">
                                <c:if test="${mmatron.imageCodeB != null}">
                                   <div class="img-box">
                                       <img src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${mmatron.imageCodeB}"
                                            width="200"
                                            height="200">
                                       <div class="del-icon">
                                    <i class="layui-icon">&#x1006;</i>
                                       </div>
                                   </div>
                                </c:if>
                            </span>
                            <input type="hidden" id="imageCode_1" name="mmatronLicense[1].imageCode"
                                   value="${mmatron.imageCodeB}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[1].licenseTypeCode" id="licenseTypeCode_1"
                                       value="00750002">
                                <button type="button" class="layui-btn  layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">催乳师证</legend>

                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLicense[2].getDate" id="getDate_2" autocomplete="off"
                                   class="layui-input" value="${mmatron.getDateC}">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">附件照片</label>
                        <div class="layui-input-inline">
                            <span style="float: left;display: inline-block">
                                <c:if test="${mmatron.imageCodeC != null}">
                                   <div class="img-box">
                                       <img src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${mmatron.imageCodeC}"
                                            width="200"
                                            height="200">
                                       <div class="del-icon">
                                    <i class="layui-icon">&#x1006;</i>
                                       </div>
                                   </div>
                                </c:if>
                            </span>
                            <input type="hidden" id="imageCode_2" name="mmatronLicense[2].imageCode"
                                   value="${mmatron.imageCodeC}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[2].licenseTypeCode" id="licenseTypeCode_2"
                                       value="00750003">
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">育婴师证</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLicense[3].getDate" id="getDate_3" autocomplete="off"
                                   class="layui-input" value="${mmatron.getDateD}">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">附件照片</label>
                        <div class="layui-input-inline">
                            <span style="float: left;display: inline-block">
                                <c:if test="${mmatron.imageCodeD != null}">
                                   <div class="img-box">
                                       <img src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${mmatron.imageCodeD}"
                                            width="200"
                                            height="200">
                                       <div class="del-icon">
                                    <i class="layui-icon">&#x1006;</i>
                                       </div>
                                   </div>
                                </c:if>
                            </span>
                            <input type="hidden" id="imageCode_3" name="mmatronLicense[3].imageCode"
                                   value="${mmatron.imageCodeD}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[3].licenseTypeCode" id="licenseTypeCode_3"
                                       value="00750004">
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">营养师证</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLicense[4].getDate" id="getDate_4" autocomplete="off"
                                   class="layui-input" value="${mmatron.getDateE}">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">附件照片</label>
                        <div class="layui-input-inline">
                            <span style="float: left;display: inline-block">
                               <c:if test="${mmatron.imageCodeE != null}">
                                   <div class="img-box">
                                       <img src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${mmatron.imageCodeE}"
                                            width="200"
                                            height="200">
                                       <div class="del-icon">
                                    <i class="layui-icon">&#x1006;</i>
                                       </div>
                                   </div>
                               </c:if>
                            </span>
                            <input type="hidden" id="imageCode_4" name="mmatronLicense[4].imageCode"
                                   value="${mmatron.imageCodeE}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[4].licenseTypeCode" id="licenseTypeCode_4"
                                       value="00750004">
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">小儿推拿证</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLicense[5].getDate" id="getDate_5" autocomplete="off"
                                   class="layui-input" value="${mmatron.getDateF}">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">附件照片</label>
                        <div class="layui-input-inline">
                            <span style="float: left;display: inline-block">
                                 <c:if test="${mmatron.imageCodeF != null}">
                                   <div class="img-box">
                                       <img src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${mmatron.imageCodeF}"
                                            width="200"
                                            height="200">
                                       <div class="del-icon">
                                    <i class="layui-icon">&#x1006;</i>
                                       </div>
                                   </div>
                                 </c:if>
                            </span>
                            <input type="hidden" id="imageCode_5" name="mmatronLicense[5].imageCode"
                                   value="${mmatron.imageCodeF}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                 <input type="hidden" name="mmatronLicense[5].licenseTypeCode" id="licenseTypeCode_5"
                                        value="00750006">
                                <button type="button" class="layui-btn  layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">月子餐烹饪证</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLicense[6].getDate" id="getDate_6" autocomplete="off"
                                   class="layui-input" value="${mmatron.getDateG}">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">附件照片</label>
                        <div class="layui-input-inline">
                            <span style="float: left;display: inline-block">
                               <c:if test="${mmatron.imageCodeG != null}">
                                   <div class="img-box">
                                       <img src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${mmatron.imageCodeG}"
                                            width="200"
                                            height="200">
                                       <div class="del-icon">
                                    <i class="layui-icon">&#x1006;</i>
                                       </div>
                                   </div>
                               </c:if>
                            </span>
                            <input type="hidden" id="imageCode_6" name="mmatronLicense[6].imageCode"
                                   value="${mmatron.imageCodeG}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[6].licenseTypeCode" id="licenseTypeCode_6"
                                       value="00750007">
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">心理咨询证</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mmatronLicense[7].getDate" id="getDate_7" autocomplete="off"
                                   class="layui-input" value="${mmatron.getDateH}">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">附件照片</label>
                        <div class="layui-input-inline">
                            <span style="float: left;display: inline-block">
                               <c:if test="${mmatron.imageCodeH != null}">
                                   <div class="img-box">
                                       <img src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${mmatron.imageCodeH}"
                                            width="200"
                                            height="200">
                                       <div class="del-icon">
                                    <i class="layui-icon">&#x1006;</i>
                                       </div>
                                   </div>
                               </c:if>
                            </span>
                            <input type="hidden" id="imageCode_7" name="mmatronLicense[7].imageCode"
                                   value="${mmatron.imageCodeH}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[7].licenseTypeCode" id="licenseTypeCode_7"
                                       value="00750008">
                                <button type="button" class="layui-btn  layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">特长</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md12">
                        <label class="layui-form-label label-style">业务特长描述</label>
                        <div class="layui-input-block">
                            <c:set var="tranSpeci" value=",${mmatron.mmatronTranSpeciDesc},"/>
                            <input type="checkbox" lay-skin="primary" name="mmatronTranSpeciDescArray[0]" value="早教"
                                   title="早教"
                            <c:if test="${fn:contains(tranSpeci,',早教,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronTranSpeciDescArray[2]" value="驾驶"
                                   title="驾驶"
                            <c:if test="${fn:contains(tranSpeci,',驾驶,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronTranSpeciDescArray[3]" value="月子餐"
                                   title="月子餐"
                            <c:if test="${fn:contains(tranSpeci,',月子餐,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronTranSpeciDescArray[4]" value="产后修复"
                                   title="产后修复"
                            <c:if test="${fn:contains(tranSpeci,',产后修复,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronTranSpeciDescArray[5]" value="乳房护理"
                                   title="乳房护理"
                            <c:if test="${fn:contains(tranSpeci,',乳房护理,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronTranSpeciDescArray[6]" value="辅食添加"
                                   title="辅食添加"
                            <c:if test="${fn:contains(tranSpeci,',辅食添加,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronTranSpeciDescArray[7]" value="心理辅导"
                                   title="心理辅导"
                            <c:if test="${fn:contains(tranSpeci,',心理辅导,')}">
                                   checked
                            </c:if>
                            >
                        </div>
                    </div>

                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md12">
                        <label class="layui-form-label label-style">个人特长描述</label>
                        <div class="layui-input-block">
                            <c:set var="indivSpeci" value=",${mmatron.mmatronIndivSpeciDesc},"/>
                            <input type="checkbox" lay-skin="primary" name="mmatronIndivSpeciDescArray[0]" value="责任心"
                                   title="责任心"
                            <c:if test="${fn:contains(indivSpeci,',责任心,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronIndivSpeciDescArray[1]" value="亲和力"
                                   title="亲和力"
                            <c:if test="${fn:contains(indivSpeci,',亲和力,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronIndivSpeciDescArray[2]" value="待人热情"
                                   title="待人热情"
                            <c:if test="${fn:contains(indivSpeci,',待人热情,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" name="mmatronIndivSpeciDescArray[3]" value="善于沟通"
                                   title="善于沟通"
                            <c:if test="${fn:contains(indivSpeci,',善于沟通,')}">
                                   checked
                            </c:if>
                            >
                        </div>
                    </div>
                </div>
                <c:if test="${mmatron.mmatronBaseCode != null}">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>审核信息</legend>
                    </fieldset>
                </c:if>
                <c:if test="${not empty mmatronAuditList}">
                    <c:forEach items="${mmatronAuditList}" var="audit">
                        <div class="layui-form-item layui-row">
                            <div class="  layui-col-md6">
                                <label class="layui-form-label label-style">审核人</label>
                                <div class="layui-input-inline inline-noborder">
                                        ${audit.auditUserName}
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


                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button class="layui-btn" lay-submit lay-filter="save">保存</button>
                    </div>

                    <div class="layui-inline">
                        <button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>

<!--main content end-->

<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域
    layui.use(['layer', 'globalAjax', 'multipleSelect', 'form', 'verify', 'laydate', 'upload'], function () {
        var $ = layui.jquery, layer = layui.layer,
            form = layui.form, verify = layui.verify,
            upload = layui.upload,
            laydate = layui.laydate;


        var mmatronServCityCodes = '${mmatron.mmatronServCityCodes}';
        var mmatronServCityArray = [];
        if (mmatronServCityCodes) {
            mmatronServCityArray = mmatronServCityCodes.split(",");
        }

        $(function () {
            if ('${mmatron.idCardNum}') {
                idCardInfo('${mmatron.idCardNum}');
            }
            initMs();

        });

        function initMs() {
            $('#servCityCodesMs').change(function () {
                $("#mmatronServCityCodes").val($(this).val())
            }).multipleSelect({
                placeholder: "多选",
                filter: true,
                selectAll: false,
                allSelected: false,
                countSelected: false,
                width: '100%',
                noMatchesFound: '没有符合条件'
            }, "setSelects", mmatronServCityArray);
            $(".ms-drop input[type='checkbox']").css("display", 'inline-block');
        }

        $("#idCardNum").on("change", function () {
            $("#zodiacSpan").html("");
            $("#zodiac").val("");
            $("#constellationSpan").html("");
            $("#constellation").val("");
            $("#mmatronAgeSpan").html("");
            $("#mmatronAge").val("");
            $("#birthdaySpan").html("");
            $("#birthday").val("")
        }).on("blur", function () {
            var value = $(this).val();
            idCardInfo(value);
        });

        function idCardInfo(value) {
            var birth = value.substring(6, 10) + "-" + value.substring(10, 12) + "-" + value.substring(12, 14);
            if (parseInt(value.substr(16, 1)) % 2 === 1) {
                $("#gderFlg").html("男");
            } else {
                $("#gderFlg").html("女");
            }
            var zodiac = Calculator.shengxiao(birth);
            $("#zodiacSpan").html(zodiac);
            var constellation = Calculator.astro(value.substring(6, 10), value.substring(10, 12), value.substring(12, 14));
            $("#constellationSpan").html(constellation);
            $("#mmatronAgeSpan").html(Calculator.age(birth));
            $("#birthdaySpan").html(birth);
        }

        //日期前后联动
        var getDate_0 = laydate.render({
            elem: '#getDate_0',
            done: function (value, date) {
                expiredDate_0.config.min = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }
            }
        });

        var expiredDate_0 = laydate.render({
            elem: '#expiredDate_0',
            done: function (value, date) {
                getDate_0.config.max = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }
            }
        });

        //日期前后联动
        var getDate_1 = laydate.render({
            elem: '#getDate_1',
            done: function (value, date) {
                expiredDate_1.config.min = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }
            }
        });

        var expiredDate_1 = laydate.render({
            elem: '#expiredDate_1',
            done: function (value, date) {
                getDate_1.config.max = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }
            }
        });

        var getDate_2 = laydate.render({
            elem: '#getDate_2'
        });
        var getDate_3 = laydate.render({
            elem: '#getDate_3'
        });
        var getDate_4 = laydate.render({
            elem: '#getDate_4'
        });
        var getDate_5 = laydate.render({
            elem: '#getDate_5'
        });
        var getDate_6 = laydate.render({
            elem: '#getDate_6'
        });
        var getDate_7 = laydate.render({
            elem: '#getDate_7'
        });
        var getDate_8 = laydate.render({
            elem: '#getDate_8'
        });

        form.verify(verify);

        //上传
        upload.render({
            elem: '.uploadImg' //绑定元素
            , url: '${ctx}/mmatron/uploadImg' //上传接口
            , accept: 'images'
            , exts: 'jpg|png|jpeg'
            , field: 'upload'
            , before: function () {
                layer.load();
                var item = this.item;
                this.data = {"licenseTypeCode": item.prev().val()};
            }
            , done: function (res) {
                layer.closeAll('loading');
                var item = this.item;
                var height = 200, width = 200;
                item.parent().prev().val(res.imageCode);
                var array = [];
                array.push("<div class=\"img-box\" vb=\"" + res.imageCode + "\">");
                var src = "${ctx}/reso/downLoadPicFile?tranResoFileMngId=" + res.imageCode;
                array.push("<img src= \"" + src + "\" width='" + width + "' height='" + height + "'/>");
                array.push("<div class=\"del-icon\"> <i class=\"layui-icon\">&#x1006;</i></div>");
                array.push("</div>");
                item.parent().prev().prev().html(array.join(""));
            }
        });


        //删除图片
        $(document).on("click", ".del-icon", function () {
            delPic(this);
        });

        //删除图片公共方法
        function delPic(obj) {
            $(obj).parent().parent().next().val("");
            $(obj).parent().remove();
        }

        form.on('radio(servOwnCompFlg)', function (data) {
            if (data.value === "1") {
                $("#servCityCodesMs").removeAttr("lay-verify");
                $("#servCityCodes_div").hide();
            } else {
                $("#servCityCodesMs").attr("lay-verify", "required|selectcheck");
                $("#servCityCodes_div").show();
            }
        });

        form.on("submit(save)", function (data) {
            var imageCode_0 = $("#imageCode_0").val();
            if (!imageCode_0) {
                layer.alert("健康证不能为空！", {icon: 2});
                return false;
            }
            var imageCode_1 = $("#imageCode_1").val();
            if (!imageCode_1) {
                layer.alert("母婴护理证不能为空！", {icon: 2});
                return false;
            }
            var mmatronCode = data.field.mmatronBaseCode;
            if (!mmatronCode) {
                $.ajax({
                    url: "${ctx}/mmatron/create",
                    type: 'post',
                    data: data.field,
                    dataType: 'json',
                    timeout: 10000,
                    success: function (data) {
                        if (data.status === 200) {
                            layer.alert("新增月嫂成功", {closeBtn: 0}, function () {
                                window.location.href = "${ctx}/mmatron";
                            })
                        } else {
                            layer.alert(data.errorMsg)
                        }
                    }
                });
            } else {
                $.ajax({
                    url: "${ctx}/mmatron/update",
                    type: 'post',
                    data: data.field,
                    dataType: 'json',
                    timeout: 10000,
                    success: function (data) {
                        if (data.status === 200) {
                            layer.alert("更新月嫂成功", {closeBtn: 0}, function () {
                                window.location.href = "${ctx}/mmatron";
                            })
                        } else {
                            layer.alert(data.errorMsg)
                        }
                    }
                });
            }

            return false;
        });


        $("#back").on("click", function () {
            location.href = "${ctx}/mmatron";
        })
    });


</script>
</body>
</html>