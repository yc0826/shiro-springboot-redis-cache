<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shb" uri="http://www.babysky.com/platform/tags/shb-functions" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>活动管理</title>
    <!-- Bootstrap core CSS -->
    <!--external css-->
    <!-- Custom styles for this template -->
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/multiple-select.css" rel="stylesheet">
    <style>
        /*  */
        .babysky_course_div1{
            display:none !important;
        }
        .babysky_novip_div22222{
            display:none !important;
        }
        .upload_box1 {
            display: none;
        }
    </style>
</head>

<body>
<div class="row mt wrapper  layui-container ">
    <div class=" layui-row row-style">
        <div class="col_main lightshadow form-panel layui-col-md12">

            <!-- 表格开始 -->
            <form:form method="post" commandName="activBaseEntity" cssClass="layui-form">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>活动/课程编辑</legend>
                </fieldset>

                <form:hidden path="activCode"/>
                <form:hidden path="verNum"/>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>会所：</label>
                    <div class="layui-input-inline inline-adress">
                        <c:if test="${op eq '提交'}">
                            <select id="subsyCode" name="subsyCode" lay-verify="required" lay-verType="tips"  lay-filter="selectSubsyCode">
                                <option value="">请选择</option>
                                <c:forEach items="${subsyList}" var="subsyList">
                                    <option value="${subsyList.subsyCode}" <c:if test="${subsyList.subsyCode == activBaseEntity.subsyCode}">selected</c:if> >${subsyList.subsyName}</option>
                                </c:forEach>
                            </select>
                        </c:if>
                        <c:if test="${op ne '提交'}">
                            <div class="layui-input-inline">
                                ${subsyName}
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>举办地址：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                               id="activAddress" name="activAddress" value="${activBaseEntity.activAddress}" placeholder="输入举办地址" maxlength="500"  />
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>活动/课程名称：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                               id="activName" name="activName" value="${activBaseEntity.activName}" placeholder="输入活动/课程名称" maxlength="32"  />
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>活动/课程分类：</label>
                    <div class="layui-input-inline inline-adress">
                        <c:forEach items="${shb:getListByType('0021')}" var="gen">
                            <c:if test="${gen.genCode != 00210003}">
                                <input type="radio" lay-verify="required" name="activCateCode" value="${gen.genCode}" title="${gen.genSubName}"
                                   <c:if test="${activBaseEntity.activCateCode == gen.genCode}">checked="checked"</c:if> lay-filter="activCateCode">
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

                <!--课程start-->

                <div class="layui-form-item babysky_course_div">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>是否vip课程：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="radio" name="vipCourseFlg" id="vipCourseFlg1" value="1" title="vip课程" <c:if test="${activCourseEntity.vipCourseFlg == true}">checked="checked"</c:if> lay-filter="vipCourseFlg">
                        <input type="radio" name="vipCourseFlg" id="vipCourseFlg2" value="0" title="非vip课程" <c:if test="${activCourseEntity.vipCourseFlg == false}">checked="checked"</c:if> lay-filter="vipCourseFlg">
                    </div>
                </div>
                <div class="layui-form-item babysky_course_div">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>课程类型：</label>
                    <div class="layui-input-inline inline-adress">
                        <c:forEach items="${shb:getListByType('0022')}" var="gen">
                            <input type="radio" lay-verify="required" name="courseTypeCode" value="${gen.genCode}" title="${gen.genSubName}"
                                   <c:if test="${activCourseEntity.courseTypeCode == gen.genCode}">checked="checked"</c:if>>
                        </c:forEach>
                    </div>
                </div>
                <div class="layui-form-item babysky_course_div">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>课程分类：</label>
                    <div class="layui-input-inline inline-adress">
                        <c:forEach items="${shb:getListByType('0058')}" var="gen">
                            <input type="radio" name="courseCateCode" value="${gen.genCode}" title="${gen.genSubName}"
                                   <c:if test="${activCourseEntity.courseCateCode == gen.genCode}">checked="checked"</c:if>>
                        </c:forEach>
                    </div>
                </div>
                <div class="layui-form-item babysky_course_div">
                    <label class="layui-form-label label-style">课程资源URL：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="text" class="layui-input" autocomplete="false"
                               id="courseResoUrl" name="courseResoUrl" value="${activCourseEntity.courseResoUrl}" placeholder="输入课程资源URL" maxlength="128" />
                    </div>
                </div>
                <div class="layui-form-item layui-form-text babysky_course_div">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>课程安排描述：</label>
                    <div class="layui-input-inline inline-adress">
                        <textarea  class="layui-textarea"
                               id="courseAgendaDesc" name="courseAgendaDesc" placeholder="输入课程安排描述" maxlength="512">${activCourseEntity.courseAgendaDesc}</textarea>
                    </div>
                </div>
                <div class="layui-form-item babysky_course_div">
                    <label class="layui-form-label label-style">课程时长：</label>
                    <div class="layui-input-inline inline-adress">
                        <%--<input type="text" class="layui-input" autocomplete="false"--%>
                               <%--id="courseDuration" name="courseDuration" value="${activCourseEntity.courseDuration}" placeholder="输入课程时长" maxlength="20" />--%>
                            <select id="courseDuration" name="courseDuration" lay-verType="tips" >
                                <option value="">请选择</option>
                                <c:forEach items="${shb:getListByType('0087')}" var="gen">
                                    <option value="${gen.genSubName}" <c:if test="${gen.genSubName == activCourseEntity.courseDuration}">selected</c:if> >${gen.genSubName}</option>
                                </c:forEach>
                            </select>
                    </div>
                </div>

                <!--课程end-->


                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>活动/课程类型：</label>
                    <div class="layui-input-inline inline-adress">
                        <c:forEach items="${shb:getListByType('0055')}" var="gen">
                            <input type="radio" lay-verify="required" name="activTypeCode" value="${gen.genCode}" title="${gen.genSubName}"
                                   <c:if test="${activBaseEntity.activTypeCode == gen.genCode}">checked="checked"</c:if>>
                        </c:forEach>
                    </div>
                </div>
                <div class="layui-form-item layui-row activDesc_div">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>活动/课程描述：</label>
                    <div class="layui-input-inline inline-adress">
                        <textarea class="layui-textarea"
                                  id="activDesc" name="activDesc" placeholder="输入活动/课程描述" maxlength="512">${activBaseEntity.activDesc}</textarea>
                    </div>
                </div>

                <%--<div class="layui-form-item layui-row">--%>
                    <%--<label class="layui-form-label label-style"><span style="color:red">※</span>活动状态：</label>--%>
                    <%--<div class="layui-input-inline inline-adress">--%>
                        <%--<c:forEach items="${shb:getListByType('0035')}" var="gen">--%>
                            <%--<input type="radio" lay-verify="required" name="activStatusCode" value="${gen.genCode}" title="${gen.genSubName}"--%>
                                   <%--<c:if test="${activBaseEntity.activStatusCode == gen.genCode}">checked="checked"</c:if>>--%>
                        <%--</c:forEach>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>活动/课程预计开始时间：</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                                   id="activExpectStartTime" name="activExpectStartTimeDisplay" value="${activBaseEntity.activExpectStartTimeDisplay}" placeholder="活动/课程预计开始时间"  />
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>活动/课程预计结束时间：</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                                   id="activExpectEndTime" name="activExpectEndTimeDisplay" value="${activBaseEntity.activExpectEndTimeDisplay}" placeholder="活动/课程预计结束时间"  />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>活动/课程显示开始时间：</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                                   id="activDispStartTime" name="activDispStartTimeDisplay" value="${activBaseEntity.activDispStartTimeDisplay}" placeholder="活动/课程开始展示的时间"  />
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style"><span style="color:red">※</span>活动/课程显示结束时间：</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                                   id="activDispEndTime" name="activDispEndTimeDisplay" value="${activBaseEntity.activDispEndTimeDisplay}" placeholder="活动/课程结束展示的时间"  />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row babysky_novip_div">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>在线预约：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="radio" lay-verify="required" name="onlineResvFlg" id="onlineResvFlg1" value="1" title="可以在线预约" <c:if test="${activBaseEntity.onlineResvFlg == true}">checked="checked"</c:if>>
                        <input type="radio" lay-verify="required" name="onlineResvFlg" id="onlineResvFlg2" value="0" title="不能在线预约" <c:if test="${activBaseEntity.onlineResvFlg == false}">checked="checked"</c:if>>
                    </div>
                </div>
                <div class="layui-form-item layui-row babysky_novip_div">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>预约结束时间：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="text" class="layui-input" autocomplete="false"
                               id="resvEndTime" name="resvEndTimeDisplay" value="${activBaseEntity.resvEndTimeDisplay}" placeholder="预约结束的时间"  />
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>电话咨询：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="radio" lay-verify="required" name="phoneQueryFlg" id="phoneQueryFlg1" value="1" title="提供电话咨询" <c:if test="${activBaseEntity.phoneQueryFlg == true}">checked="checked"</c:if>>
                        <input type="radio" lay-verify="required" name="phoneQueryFlg" id="phoneQueryFlg2" value="0" title="没有电话咨询" <c:if test="${activBaseEntity.phoneQueryFlg == false}">checked="checked"</c:if>>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>目标人群：</label>
                    <div class="layui-input-inline inline-adress">
                        <c:forEach items="${shb:getListByType('0056')}" var="gen">
                            <input type="radio" lay-verify="required" name="activTargetPopulation" value="${gen.genCode}" title="${gen.genSubName}"
                                   <c:if test="${activBaseEntity.activTargetPopulation == gen.genCode}">checked="checked"</c:if>>
                        </c:forEach>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style">最大参与人数：</label>
                    <div class="layui-input-inline inline-adress">
                        <input type="text" class="layui-input" autocomplete="false" lay-verify="required"
                               id="activAttendMax" name="activAttendMax" value="${activBaseEntity.activAttendMax}" placeholder="输入最大参与人数" maxlength="10" />
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>活动/课程顶部标题图片</label>
                    <label><font size="1px" color="red">图片大小：宽1125像素 * 高600像素</font></label>
                    <div class="layui-input-inline inline-adress">
                        <span style="float: left;display: inline-block">
                            <div class="upload_box1" <c:if test="${activBannerCode != null}">style="display: block;"</c:if> >
                                <img id="bannerImg1" class="upload_img"
                                     src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${activBannerCode}"/>
                            </div>
                        </span>
                        <span class="upload_btn">
                            <input type="hidden" id="activBannerCode" name="activBannerCode" value="${activBannerCode}" respCode="00480009" height="600" width="1125">
                            <button type="button" id="test1" class="layui-btn layui-btn-sm layui-btn-primary uploader" <c:if test="${activBannerCode != null}">style="display: none;"</c:if> >
                                <i class="layui-icon">&#xe67c;</i><span>上传图片</span>
                            </button>
                            <button type="button" class="layui-btn layui-btn-sm layui-btn-primary imageRemoverBtn" <c:if test="${activBannerCode == null}">style="display:none"</c:if><c:if test="${activBannerCode != null}">style="display:block"</c:if> >
                                <i class="layui-icon">&#xe640;</i><span>删除图片</span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style"><span style="color:red">※</span>活动/课程缩略图</label>
                    <label><font size="1px" color="red">图片大小：宽330像素 * 高258像素</font></label>
                    <div class="layui-input-inline inline-adress">
                        <span style="float: left;display: inline-block">
                            <div class="upload_box1" <c:if test="${activThumbCode != null}">style="display: block;"</c:if> >
                                <img id="bannerImg2" class="upload_img"
                                     src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${activThumbCode}"/>
                            </div>
                        </span>
                        <span class="upload_btn">
                            <input type="hidden" id="activThumbCode" name="activThumbCode" value="${activThumbCode}" respCode="00480008" height="258" width="330">
                            <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploader" <c:if test="${activThumbCode != null}">style="display: none;"</c:if> >
                                <i class="layui-icon">&#xe67c;</i><span>上传图片</span>
                            </button>
                            <button type="button" class="layui-btn layui-btn-sm layui-btn-primary imageRemoverBtn" <c:if test="${activThumbCode == null}">style="display:none"</c:if><c:if test="${activThumbCode != null}">style="display:block"</c:if> >
                                <i class="layui-icon">&#xe640;</i><span>删除图片</span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label label-style">活动/课程详情图片</label>
                    <label><font size="1px" color="red">图片大小：宽981像素</font></label>
                    <div class="layui-input-inline inline-adress">
                        <span style="float: left;display: inline-block">
                            <div>
                                <input type="hidden" id="activDetailImgCodeList" name="activDetailImgCodeList" value="${activDetailImgCodes}" respCode="00480010" height="-1" width="981"> <!--格式：|abc|def| -->
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploader">
                                    <i class="layui-icon">&#xe67c;</i><span>上传图片</span>
                                </button>
                            </div>
                            <div id="activDetailImgDiv" class="upload_box1" <c:if test="${activDetailImgCodeList != null}">style="display: inline;"</c:if> >
                                <!--图片预览区域 -->
                            </div>
                        </span>
                    </div>
                </div>



                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button type="button" class="layui-btn command-btn-submit" lay-submit lay-filter="activBaseEntity">${op}</button>
                    </div>
                    <div class=" layui-inline">
                        <button type="button" id="back" class="layui-btn layui-btn-primary">返回</button>
                    </div>
                </div>
            </form:form>
            <!-- 表格结束-->
            </div>
        </div>
    </div>

<!--main content end-->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>


    //JavaScript代码区域
    layui.use(['form', 'element', 'layer', 'globalAjax', 'multipleSelect', 'upload', 'laydate'], function () {

        var $= layui.jquery, element = layui.element, layer = layui.layer, upload = layui.upload, multipleSelect = layui.multipleSelect;
        var form = layui.form,
            laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#activExpectStartTime'
            ,format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
            ,type:'datetime'
        });
        laydate.render({
            elem: '#activExpectEndTime'
            ,format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
            ,type:'datetime'
        });
        laydate.render({
            elem: '#activDispStartTime'
            ,format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
        });
        laydate.render({
            elem: '#activDispEndTime'
            ,format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
        });
        laydate.render({
            elem: '#resvEndTime'
            ,format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
            ,type:'datetime'
        });




        <%--$("#interUserCode").change(function () {--%>
            <%--var userCode = $(this).val();--%>
            <%--$("#subsyCode").empty();--%>
            <%--$.get("${ctx}/user/getSubsyListByUserCode",--%>
                <%--{--%>
                    <%--'userCode': userCode--%>
                <%--}, function (data) {--%>
                    <%--$("#subsyCode").append("<option>请选择</option>");--%>
                    <%--$.each(data, function (index, item) {--%>
                        <%--$("#subsyCode").append("<option value=\"" + item.subsyCode + "\">" + item.subsyName + "</option>");--%>
                    <%--});--%>
                <%--}, 'json')--%>

        <%--})--%>

        //监听提交
        form.on('submit(activBaseEntity)', function (data) {
            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if(data.status === 200) {
                        layer.open({
                            content: '${op}成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                window.location.href = "${ctx}/activ/list";
                            }
                            ,cancel: function(){
                                return false;
                            }
                        });
                    } else {
                        if(data.status === 500) {
                            layer.alert("服务器繁忙，请联系管理员，谢谢。");
                        }else if(data.status === 555){
                            layer.alert(data.errorMsg)
                        }else {
                            layer.alert(data.msg)
                        }
                    }
                }
            });
            return false;
        });

        //点击活动分类，切换活动部分显示隐藏
        form.on('radio(activCateCode)', function(data){
            // console.log(data.elem); //得到radio原始DOM对象
            //console.log(data.value); //被点击的radio的value值
            if (this.value == '00210001') {
                $('.babysky_course_div').hide(100);  //活动
                $('.activDesc_div').show(100); //show活动描述
                $('.babysky_novip_div').show(100);  // ”预约结束时间“、”在线预约“
            } else if (this.value == '00210002') {
                $('.babysky_course_div').show(100);  //课程
                $('.activDesc_div').hide(100); //隐藏活动描述
            }

            $('[name=vipCourseFlg]').each(function(i,item){
                $(item).prop('checked',false);
            });
            form.render('radio'); //刷新select选择框渲染

        });

        //点击是否vip课程”vip课程“的时候不要显示”预约结束时间“、”在线预约“
        form.on('radio(vipCourseFlg)', function(data){
            if (this.value == '1') {
                $('.babysky_novip_div').hide(100);  //vip课程
            } else{
                $('.babysky_novip_div').show(100);  //非vip课程
            }
        });




        //执行实例
        upload.render({
            elem: '.uploader' //绑定元素
            , url: '${ctx}/activ/uploadImg' //上传接口
            , accept: 'images'
            , exts: 'jpg|png|gif|bmp|jpeg'
            , field: 'upload'
            , before: function () {
                var respCode = $(this.item.get(0)).prev().attr("respCode");
                var height = $(this.item.get(0)).prev().attr("height");
                var width = $(this.item.get(0)).prev().attr("width");

                this.data = {"fileTypeCode": respCode, "height":height, "width":width};
                layer.load();
            }
            , done: function (res) {
                if(res.status === 500){
                    layer.alert(res.message);
                } else if(res.status === 200){
                    if(typeof(res.imageCode)=="undefined" || res.imageCode==""){
                        layer.alert("上传文件不正常，请联系管理员，谢谢。");
                        return;
                    }

                    var uploadBtn = $(this.item.get(0)); //上传按钮
                    var hiddenInput = uploadBtn.prev();  //文件code隐藏域

                    layer.closeAll('loading');

                    //
                    if (hiddenInput.attr("id") === "activThumbCode" || hiddenInput.attr("id") === "activBannerCode") {
                        //只允许上传一个文件
                        var imageRemoverBtn = uploadBtn.next().next(); //删除按钮
                        var upload_box = uploadBtn.parent().prev().children().first();  //图片预览div
                        var upload_img = upload_box.children().first();  //图片预览img

                        uploadBtn.hide(); //隐藏上传按钮
                        imageRemoverBtn.css("display", "block"); //显示删除按钮
                        //预览图片
                        hiddenInput.val(res.imageCode);  //保存文件code到隐藏域
                        upload_box.css("display", "block"); //显示图片预览div
                        upload_img.attr("src", "${ctx}/reso/downLoadPicFile?tranResoFileMngId=" + res.imageCode);  //显示图片预览
                    } else if (hiddenInput.attr("id") === "activDetailImgCodeList") {
                        //允许上传多个文件
                        if(hiddenInput.val() === ""){
                            hiddenInput.val("|" + res.imageCode + "|");
                        }else{
                            hiddenInput.val(hiddenInput.val() + res.imageCode + "|");
                        }

                        var previewDiv = $("#activDetailImgDiv"); //整个图片预览div
                        previewDiv.css("display", "inline");
                        //在activDetailImgDiv这个div中的最后一个元素后添加新上传的图片预览、删除按钮
                        var removeBtnHtml = "<button type='button' class='layui-btn layui-btn-sm layui-btn-primary multiImageRemoverBtn' style='display:inline' fileCode='" + res.imageCode + "'><i class='layui-icon'>&#xe640;</i><span>删除图片</span></button>";
                        previewDiv.append("<img class='upload_img' src='" + ctx + "/reso/downLoadPicFile?tranResoFileMngId=" + res.imageCode + "'/>" + removeBtnHtml);
                    }


                } else {
                    if(data.status === 500) {
                        layer.alert("服务器繁忙，请联系管理员，谢谢。");
                    }else if(data.status === 555){
                        layer.alert(data.errorMsg)
                    }else {
                        layer.alert(data.msg)
                    }
                }
            }
            ,error: function(){
                //请求异常回调
                layer.alert("服务器繁忙，请联系管理员，谢谢。");
            }
        });


        //删除图片按钮事件
        $(document).on('click', ".imageRemoverBtn", function () {
            //隐藏自己，显示上传按钮，删除隐藏域内容
            var imageRemoverBtn = $(this);
            var uploadBtn = imageRemoverBtn.prev().prev();
            var hiddenInput = uploadBtn.prev();
            var upload_box = uploadBtn.parent().prev().children().first();
            var upload_img = upload_box.children().first();

            imageRemoverBtn.css("display", "none");
            hiddenInput.val("");
            uploadBtn.show();
            upload_box.css("display", "none");
            upload_img.attr("src", "")
        });

        //多附件上传的删除按钮事件
        $(document).on('click', ".multiImageRemoverBtn", function () {
            //隐藏自己，显示上传按钮，删除隐藏域内容
            var imageRemoverBtn = $(this);
            var hiddenInput = imageRemoverBtn.parent().prev().children().first();
            var image = imageRemoverBtn.prev();

            image.remove(); //删除 图片预览
            imageRemoverBtn.remove(); //删除 删除按钮

            //删除隐藏域中的文件code
            var hiddenFileCodes = hiddenInput.val();
            hiddenFileCodes = hiddenFileCodes.replace(imageRemoverBtn.attr("fileCode") + "|", "");
            if(hiddenFileCodes == "|"){
                hiddenFileCodes = "";
            }
            hiddenInput.val(hiddenFileCodes);
        });

        form.on('select(selectSubsyCode)', function(data){
            if("" != data.value && "请选择" != data.value){
                $.post("${ctx}/activ/getActivAddressBySubsyCode",
                    {
                        subsyCode : data.value
                    }, function (data) {
                        $("#activAddress").val(data.subsyAddr);
                        form.render('select');
                    }, 'json');
            } else {
                $("#activAddress").val("");
            }

        });

        $(function () {
            //课程默认不显示
            <c:if test="${activCourseEntity != null}">
                $('.activDesc_div').hide(); //隐藏活动描述
                $('.babysky_course_div').show();
            </c:if>
            <c:if test="${activCourseEntity == null}">
                $('.activDesc_div').show(); //显示活动描述
                $('.babysky_course_div').hide();
            </c:if>

            //vip课程，不要显示”预约结束时间“、”在线预约“
            <c:if test="${activCourseEntity != null && activCourseEntity.vipCourseFlg==true}">
                $('.babysky_novip_div').hide(100);  //vip课程
            </c:if>
            <c:if test="${activCourseEntity != null && activCourseEntity.vipCourseFlg==false}">
                $('.babysky_novip_div').show(100);  //非vip课程
            </c:if>


            //初始化多张图片
            var activDetailImgCodeList = $("#activDetailImgCodeList"); //图片code隐藏域
            if(typeof(activDetailImgCodeList.val())!="undefined" && activDetailImgCodeList.val()!="") {
                var previewDiv = $("#activDetailImgDiv"); //整个图片预览div
                previewDiv.css("display", "inline");


                var codeLists = activDetailImgCodeList.val().split("|");
                if(codeLists.length>0) {
                    codeLists.forEach(function(val,index,arr){
                        if(typeof(val)!="undefined" && val!=""){
                            //在activDetailImgDiv这个div中的最后一个元素后添加新上传的图片预览、删除按钮
                            var removeBtnHtml = "<button type='button' class='layui-btn layui-btn-sm layui-btn-primary multiImageRemoverBtn' style='display:inline' fileCode='" + val + "'><i class='layui-icon'>&#xe640;</i><span>删除图片</span></button>";
                            previewDiv.append("<img class='upload_img' src='" + ctx + "/reso/downLoadPicFile?tranResoFileMngId=" + val + "'/>" + removeBtnHtml);
                        }
                    });
                }

            }
        });

        $("#back").on("click", function(event){
            location.href = "${ctx}/activ/list";
            setReturnValueFalse(event);
        });

    });


</script>
</body>
</html>
