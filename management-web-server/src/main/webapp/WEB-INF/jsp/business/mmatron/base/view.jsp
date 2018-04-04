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
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>仅服务本会所</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.servOwnCompFlg ? '是' : '否'}
                        </div>
                    </div>
                    <div class="layui-col-md6" <c:if test="${mmatron.servOwnCompFlg}">style="display: none" </c:if>>
                        <label class="layui-form-label label-style"><span style="color:red">※</span>服务区域</label>
                        <div class="layui-input-inline inline-noborder">
                            <span>${mmatron.mmatronServCityNames}</span>
                        </div>
                    </div>

                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>护理师等级</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.mmatronGradeName}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">业务特长描述</label>
                        <div class="layui-input-block">
                            <c:set var="tranSpeci" value=",${mmatron.mmatronServSpeciDesc},"/>
                            <input type="checkbox" lay-skin="primary" disabled name="mmatronServSpeciDescArray[0]"
                                   value="住家月嫂"
                                   title="住家月嫂"
                            <c:if test="${fn:contains(tranSpeci,',住家月嫂,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" disabled name="mmatronServSpeciDescArray[1]"
                                   value="会所月嫂"
                                   title="会所月嫂"
                            <c:if test="${fn:contains(tranSpeci,',会所月嫂,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" disabled name="mmatronServSpeciDescArray[2]"
                                   value="育儿嫂"
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
                        <label class="layui-form-label label-style"><span style="color:red">※</span>护理师姓</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.mmatronLastName}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>护理师名</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.mmatronFirstName}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>身份证</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.idCardNum}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">性别</label>
                        <div class="layui-input-inline inline-noborder">
                            <span id="gderFlg"></span>
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
                        <div class="layui-input-inline inline-noborder">
                            <span id="constellationSpan"></span>
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
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">身高(cm)</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.height}
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">体重(kg)</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.height}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">政治面貌</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.politicalStatus}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">民族</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.nation}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">血型</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.bloodType}
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">文化程度</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.mmatronEducatName}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">毕业学校</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.graduateFrom}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">专业</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.majored}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">

                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>归属公司</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.mmatronBelongCorpName}
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>开户行名称</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.bankName}
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>开户行账户名</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.bankAccountName}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>开户行卡号</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.bankCardNo}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">籍贯</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.mmatronNativeName}
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>现居住地</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.ghetto}
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>紧急联系人</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.urgentContact}
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>紧急联系电话</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.urgentContactPhone}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">

                        <div class=" layui-form-item layui-row">
                            <div class=" layui-col-md12">
                                <label class="layui-form-label label-style">婚姻状况</label>
                                <div class="layui-input-inline inline-noborder">
                                    ${mmatron.maritalStatus}
                                </div>
                            </div>
                        </div>

                        <div class=" layui-form-item layui-row">
                            <div class=" layui-col-md12">
                                <label class="layui-form-label label-style"><span style="color:red">※</span>手机号</label>
                                <div class="layui-input-inline inline-noborder">
                                    ${mmatron.mmatronMobNum}
                                </div>
                            </div>
                        </div>
                        <div class=" layui-form-item layui-row">
                            <div class=" layui-col-md12">
                                <label class="layui-form-label label-style">介绍人</label>
                                <div class="layui-input-inline inline-noborder">
                                    ${mmatron.introducer}
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
                                   </div>
                                </c:if>
                            </span>
                            <input type="hidden" name="avtrImgCode" value="${mmatron.avtrImgCode}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" value="00480003">
                            </span>
                        </div>
                    </div>
                </div>

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>证书及特长</legend>
                </fieldset>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">健康证</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.getDateA}
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">到期日期</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.expiredDateA}
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
                                    
                                   </div>
                               </c:if>
                            </span>
                            <input type="hidden" id="imageCode_0" name="mmatronLicense[0].imageCode"
                                   value="${mmatron.imageCodeA}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[0].licenseTypeCode" id="licenseTypeCode_0"
                                       value="00750001">
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">母婴护理证</legend>
                </fieldset>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.getDateB}
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">到期日期</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.expiredDateB}
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
                                    
                                   </div>
                                </c:if>
                            </span>
                            <input type="hidden" id="imageCode_1" name="mmatronLicense[1].imageCode"
                                   value="${mmatron.imageCodeB}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[1].licenseTypeCode" id="licenseTypeCode_1"
                                       value="00750002">
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
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.getDateC}
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
                                    
                                   </div>
                                </c:if>
                            </span>
                            <input type="hidden" id="imageCode_2" name="mmatronLicense[2].imageCode"
                                   value="${mmatron.imageCodeC}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[2].licenseTypeCode" id="licenseTypeCode_2"
                                       value="00750003">
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
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.getDateD}
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
                                    
                                   </div>
                                </c:if>
                            </span>
                            <input type="hidden" id="imageCode_3" name="mmatronLicense[3].imageCode"
                                   value="${mmatron.imageCodeD}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[3].licenseTypeCode" id="licenseTypeCode_3"
                                       value="00750004">
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
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.getDateE}
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
                                    
                                   </div>
                               </c:if>
                            </span>
                            <input type="hidden" id="imageCode_4" name="mmatronLicense[4].imageCode"
                                   value="${mmatron.imageCodeE}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[4].licenseTypeCode" id="licenseTypeCode_4"
                                       value="00750004">
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
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.getDateF}
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
                                    
                                   </div>
                                 </c:if>
                            </span>
                            <input type="hidden" id="imageCode_5" name="mmatronLicense[5].imageCode"
                                   value="${mmatron.imageCodeF}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                 <input type="hidden" name="mmatronLicense[5].licenseTypeCode" id="licenseTypeCode_5"
                                        value="00750006">
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">月子餐烹饪证</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">发证日期</label>
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.getDateG}
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
                                    
                                   </div>
                               </c:if>
                            </span>
                            <input type="hidden" id="imageCode_6" name="mmatronLicense[6].imageCode"
                                   value="${mmatron.imageCodeG}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[6].licenseTypeCode" id="licenseTypeCode_6"
                                       value="00750007">
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
                        <div class="layui-input-inline inline-noborder">
                            ${mmatron.getDateH}
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
                                    
                                   </div>
                               </c:if>
                            </span>
                            <input type="hidden" id="imageCode_7" name="mmatronLicense[7].imageCode"
                                   value="${mmatron.imageCodeH}">
                            <span class="upload_btn" style="margin-left: 5px;">
                                <input type="hidden" name="mmatronLicense[7].licenseTypeCode" id="licenseTypeCode_7"
                                       value="00750008">
                            </span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 14px">
                    <legend style="font-size: 14px">特长</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md12">
                        <label class="layui-form-label label-style">业务特长描述</label>
                        <div class="layui-input-block">
                            <c:set var="tranSpeci" value=",${mmatron.mmatronTranSpeciDesc},"/>
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronTranSpeciDescArray[0]" value="早教"
                                   title="早教"
                            <c:if test="${fn:contains(tranSpeci,',早教,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronTranSpeciDescArray[1]" value="住家"
                                   title="住家"
                            <c:if test="${fn:contains(tranSpeci,',住家,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronTranSpeciDescArray[2]" value="驾驶"
                                   title="驾驶"
                            <c:if test="${fn:contains(tranSpeci,',驾驶,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronTranSpeciDescArray[3]" value="月子餐"
                                   title="月子餐"
                            <c:if test="${fn:contains(tranSpeci,',月子餐,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronTranSpeciDescArray[4]" value="产后修复"
                                   title="产后修复"
                            <c:if test="${fn:contains(tranSpeci,',产后修复,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronTranSpeciDescArray[5]" value="乳房护理"
                                   title="乳房护理"
                            <c:if test="${fn:contains(tranSpeci,',乳房护理,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronTranSpeciDescArray[6]" value="辅食添加"
                                   title="辅食添加"
                            <c:if test="${fn:contains(tranSpeci,',辅食添加,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronTranSpeciDescArray[7]" value="心理辅导"
                                   title="心理辅导"
                            <c:if test="${fn:contains(tranSpeci,',心理辅导,')}">
                                   checked
                            </c:if>
                            >
                        </div>
                    </div>

                </div>
                <div class="layui-form-item layui-row">
                    <div class="  layui-col-md12">
                        <label class="layui-form-label label-style">个人特长描述</label>
                        <div class="layui-input-block">
                            <c:set var="indivSpeci" value=",${mmatron.mmatronIndivSpeciDesc},"/>
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronIndivSpeciDescArray[0]" value="责任心"
                                   title="责任心"
                            <c:if test="${fn:contains(indivSpeci,',责任心,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronIndivSpeciDescArray[1]" value="亲和力"
                                   title="亲和力"
                            <c:if test="${fn:contains(indivSpeci,',亲和力,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronIndivSpeciDescArray[2]" value="待人热情"
                                   title="待人热情"
                            <c:if test="${fn:contains(indivSpeci,',待人热情,')}">
                                   checked
                            </c:if>
                            >
                            <input type="checkbox" lay-skin="primary" class="checkbox"
                                   name="mmatronIndivSpeciDescArray[3]" value="善于沟通"
                                   title="善于沟通"
                            <c:if test="${fn:contains(indivSpeci,',善于沟通,')}">
                                   checked
                            </c:if>
                            >
                        </div>
                    </div>
                </div>
                <c:if test="${not empty mmatronAuditList}">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>审核信息</legend>
                    </fieldset>

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
                <%--<div class="layui-form-item btn-position">--%>
                <%--<div class="layui-inline">--%>
                <%--<button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>--%>
                <%--</div>--%>
                <%--</div>--%>
            </form>
        </div>

    </div>
</div>

<!--main content end-->

<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域
    layui.use(['layer', 'globalAjax', 'form', 'verify', 'laydate', 'upload'], function () {
        var $ = layui.jquery, layer = layui.layer,
            form = layui.form, verify = layui.verify,
            upload = layui.upload,
            laydate = layui.laydate;

        $(function () {
            if ('${mmatron.idCardNum}') {
                idCardInfo('${mmatron.idCardNum}');
            }
            $(".checkbox").attr("disabled", "disabled");
            form.render();
        });

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

        // //日期前后联动
        // var getDate_0 = laydate.render({
        //     elem: '#getDate_0',
        //     done: function (value, date) {
        //         expiredDate_0.config.min = {
        //             year: date.year,
        //             month: date.month - 1,
        //             date: date.date
        //         }
        //     }
        // });
        //
        // var expiredDate_0 = laydate.render({
        //     elem: '#expiredDate_0',
        //     done: function (value, date) {
        //         getDate_0.config.max = {
        //             year: date.year,
        //             month: date.month - 1,
        //             date: date.date
        //         }
        //     }
        // });
        //
        // //日期前后联动
        // var getDate_1 = laydate.render({
        //     elem: '#getDate_1',
        //     done: function (value, date) {
        //         expiredDate_1.config.min = {
        //             year: date.year,
        //             month: date.month - 1,
        //             date: date.date
        //         }
        //     }
        // });
        //
        // var expiredDate_1 = laydate.render({
        //     elem: '#expiredDate_1',
        //     done: function (value, date) {
        //         getDate_1.config.max = {
        //             year: date.year,
        //             month: date.month - 1,
        //             date: date.date
        //         }
        //     }
        // });
        //
        // var getDate_2 = laydate.render({
        //     elem: '#getDate_2'
        // });
        // var getDate_3 = laydate.render({
        //     elem: '#getDate_3'
        // });
        // var getDate_4 = laydate.render({
        //     elem: '#getDate_4'
        // });
        // var getDate_5 = laydate.render({
        //     elem: '#getDate_5'
        // });
        // var getDate_6 = laydate.render({
        //     elem: '#getDate_6'
        // });
        // var getDate_7 = laydate.render({
        //     elem: '#getDate_7'
        // });
        // var getDate_8 = laydate.render({
        //     elem: '#getDate_8'
        // });
        //
        // form.verify(verify);


        //删除图片
        $(document).on("click", ".del-icon", function () {
            delPic(this);
        });

        //删除图片公共方法
        function delPic(obj) {
            $(obj).parent().parent().next().val("");
            $(obj).parent().remove();
        }


        $("#back").on("click", function () {
            location.href = "${ctx}/mmatron";
        })
    });


</script>
</body>
</html>