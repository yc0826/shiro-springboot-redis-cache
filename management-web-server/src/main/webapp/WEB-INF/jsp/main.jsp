<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>贝瑞佳母婴管理平台</title>

    <%@ include file="../jsp/common/resource.jsp"%>
    <%@ include file="../jsp/common/tags.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="header.jsp"/>

    <jsp:include page="aside.jsp"/>

    <div class="layui-body index-body">
        <!-- 内容主体区域 -->
        <shiro:hasPermission name="subsyAudit:view">
        <div class="layui-row layui-col-space10">
            <div class="layui-col-md3 btnModule" vb="house">
                <a class="index-row">
                    <div class="index-col">
                        <div><i class="index-font" >&#xe906;</i></div>
                        <div style="margin-top: 10px">会所房型发布</div>
                    </div>
                </a>
            </div>
            <div class="layui-col-md3 btnModule" vb="dinner">
                <a class="index-row">
                    <div class="index-col">
                        <div><i class="index-font" >&#xe900;</i></div>
                        <div style="margin-top: 10px">月子套餐发布</div>
                    </div>
                </a>
            </div>
            <div class="layui-col-md3 btnModule" vb="service">
                <a class="index-row">
                    <div class="index-col">
                        <div><i class="index-font" >&#xe907;</i></div>
                        <div style="margin-top: 10px">增值服务发布</div>
                    </div>
                </a>
            </div>
            <div class="layui-col-md3 btnModule" vb="pord">
                <a class="index-row">
                    <div class="index-col">
                        <div><i class="index-font" >&#xe905;</i></div>
                        <div style="margin-top: 10px">母婴产品发布</div>
                    </div>
                </a>
            </div>
        </div>
        </shiro:hasPermission>
        <div class="layui-row layui-col-space10">
            <shiro:hasPermission name="activ:view">
                <div class="layui-col-md3 btnModule" vb="active">
                    <a class="index-row">
                        <div class="index-col">
                            <div><i class="index-font" >&#xe904;</i></div>
                            <div style="margin-top: 10px">活动课程发布</div>
                        </div>
                    </a>
                </div>
            </shiro:hasPermission>
            <shiro:hasPermission name="nurs:list">
                <div class="layui-col-md3 btnModule" vb="ncare">
                    <a class="index-row">
                        <div class="index-col">
                            <div><i class="index-font" >&#xe903;</i></div>
                            <div style="margin-top: 10px">护理数据</div>
                        </div>
                    </a>
                </div>
            </shiro:hasPermission>
            <shiro:hasPermission name="sale:view">
                <div class="layui-col-md3 btnModule" vb="salesaction">
                    <a class="index-row">
                        <div class="index-col">
                            <div><i class="index-font" >&#xe901;</i></div>
                            <div style="margin-top: 10px">销售行动</div>
                        </div>
                    </a>
                </div>
            </shiro:hasPermission>
            <shiro:hasPermission name="subsyOrder:view">
                <div class="layui-col-md3 btnModule" vb="print">
                    <a class="index-row">
                        <div class="index-col">
                            <div><i class="index-font" >&#xe902;</i></div>
                            <div style="margin-top: 10px">打印手环</div>
                        </div>
                    </a>
                </div>
            </shiro:hasPermission>
        </div>
        <div class="layui-row title-row" style="box-shadow: 0px 1px 0px 0 #e0e0e0;  -webkit-box-shadow: 0px 1px 0px 0 #e0e0e0;">
            <div class="layui-col-md12 title-col" >
                <h3>会所介绍</h3>
            </div>
            <div class="layui-col-md3 img-box-row">
                <c:choose>
                    <c:when test="${null != subsyPicCode && '' != subsyPicCode}">
                        <img class="img-box-col" src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${subsyPicCode}" alt="">
                    </c:when>
                    <c:otherwise>
                        <img class="img-box-col" src="${ctx}/static/img/myphoto.png" alt="">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="layui-col-md9" style="color: gray;font-size: 12px;">
                <p style="font-size: 18px;color: #7d675a;margin-top: 22px;">${subsyInfo.subsyDispName}</p>
                <p style="margin: 12px 0;line-height: 24px;">${subsyInfo.subsyDesc}</p>
                <h3>联系我们</h3>
                <div style="margin-top: 19px;margin-bottom: 30px;">
                    <span>地址：${subsyInfo.subsyAddr}</span>
                    <span style=" margin-left: 30px;">电话：${subsyInfo.phoneNum}</span>
                    <span style=" margin-left: 30px;">营业时间：${subsyInfo.busiTimeDesc}</span>
                </div>
            </div>
        </div>
        <div class="layui-row layui-col-space10" style="margin-bottom: 50px">
            <div class="layui-col-md6" >
                <div class="layui-row title-row" style="margin:16px 8px 0 8px">
                    <div class="layui-col-md12 title-col" >
                        <h3 style="display: inline-block;">会所活动</h3>
                        <div style="display: inline-block;float: right;cursor: pointer;" class="btnActiveMore" title="查看更多"><i class="layui-icon" style="font-size: 22px;">&#xe65f;</i></div>
                    </div>
                    <c:choose>
                        <c:when test="${activList != null && activList.size() > 0}">
                            <c:forEach items="${activList}" var="activInfo" varStatus="activ">
                            <c:choose>
                            <c:when test="${activ.first}">
                            <div class="layui-col-md3 img-box-row" style="height: 125px;line-height: 125px;">
                                <c:choose>
                                    <c:when test="${null != activInfo.activBannerCode && '' !=activInfo.activBannerCode}">
                                        <img class="img-box-col" style=" max-width: 94px; max-height: 94px;" src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${activInfo.activBannerCode}" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img class="img-box-col" style=" max-width: 94px; max-height: 94px;" src="${ctx}/static/img/myphoto.png" alt="">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="layui-col-md9" style="color: gray;font-size: 12px;">
                                <h3 style="margin-top: 10px;">${activInfo.activName}</h3>
                                <p style="margin: 12px 0;line-height: 24px;">${activInfo.activDesc}</p>
                                <div style="margin-top: 13px;margin-bottom: 11px;">
                                    <span>发布时间：${activInfo.crtTimeDisplay}</span>
                                    <span style=" margin-left: 30px;"></span>
                                </div>
                            </div>
                            <hr class="layui-bg-gray" style=" border: none;">
                        </div>
                        </c:when>
                        <c:otherwise>
                            <div class="layui-row title-row" style="margin:0 8px">
                                <div class="layui-col-md3 img-box-row" style="height: 125px;line-height: 125px;">
                                    <c:choose>
                                        <c:when test="${null != activInfo.activBannerCode && '' !=activInfo.activBannerCode}">
                                            <img class="img-box-col" style=" max-width: 94px; max-height: 94px;" src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${activInfo.activBannerCode}" alt="">
                                        </c:when>
                                        <c:otherwise>
                                            <img class="img-box-col" style=" max-width: 94px; max-height: 94px;" src="${ctx}/static/img/myphoto.png" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="layui-col-md9" style="color: gray;font-size: 12px;">
                                    <h3 style="margin-top: 10px;">${activInfo.activName}</h3>
                                    <p style="margin: 12px 0;line-height: 24px;">${activInfo.activDesc}</p>
                                    <div style="margin-top: 13px;margin-bottom: 11px;">
                                        <span>发布时间：${activInfo.crtTimeDisplay}</span>
                                        <span style=" margin-left: 30px;"></span>
                                    </div>
                                </div>
                                <hr class="layui-bg-gray" style=" border: none;">
                            </div>
                        </c:otherwise>
                        </c:choose>
                        </c:forEach>
                        </c:when>
                        <c:otherwise>
                            </div>
                        </c:otherwise>
                    </c:choose>

            </div>



            <div class="layui-col-md6" >
                <div class="layui-row title-row" style="margin:16px 8px 0 8px">
                    <div class="layui-col-md12 title-col" >
                        <h3 style="display: inline-block;">会所课程</h3>
                        <div style="display: inline-block;float: right;cursor: pointer;" class="btnActiveMore" title="查看更多"><i class="layui-icon" style="font-size: 22px;">&#xe65f;</i></div>
                    </div>
                    <c:choose>
                    <c:when test="${courseList != null && courseList.size() > 0}">
                        <c:forEach items="${courseList}" var="courseInfo" varStatus="course">
                        <c:choose>
                        <c:when test="${course.first}">
                        <div class="layui-col-md3 img-box-row" style="height: 125px;line-height: 125px;">
                            <c:choose>
                                <c:when test="${null != courseInfo.activBannerCode && '' !=courseInfo.activBannerCode}">
                                    <img class="img-box-col" style=" max-width: 94px; max-height: 94px;" src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${courseInfo.activBannerCode}" alt="">
                                </c:when>
                                <c:otherwise>
                                    <img class="img-box-col" style=" max-width: 94px; max-height: 94px;" src="${ctx}/static/img/myphoto.png" alt="">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="layui-col-md9" style="color: gray;font-size: 12px;">
                            <h3 style="margin-top: 10px;">${courseInfo.activName}</h3>
                            <p style="margin: 12px 0;line-height: 24px;">${courseInfo.activDesc}</p>
                            <div style="margin-top: 13px;margin-bottom: 11px;">
                                <span>发布时间：${courseInfo.crtTimeDisplay}</span>
                                <span style=" margin-left: 30px;"></span>
                            </div>
                        </div>
                        <hr class="layui-bg-gray" style=" border: none;">
                    </div>
                    </c:when>
                    <c:otherwise>
                        <div class="layui-row title-row" style="margin:0 8px">
                            <div class="layui-col-md3 img-box-row" style="height: 125px;line-height: 125px;">
                                <c:choose>
                                    <c:when test="${null != courseInfo.activBannerCode && '' !=courseInfo.activBannerCode}">
                                        <img class="img-box-col" style=" max-width: 94px; max-height: 94px;" src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${courseInfo.activBannerCode}" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img class="img-box-col" style=" max-width: 94px; max-height: 94px;" src="${ctx}/static/img/myphoto.png" alt="">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="layui-col-md9" style="color: gray;font-size: 12px;">
                                <h3 style="margin-top: 10px;">${courseInfo.activName}</h3>
                                <p style="margin: 12px 0;line-height: 24px;">${courseInfo.activDesc}</p>
                                <div style="margin-top: 13px;margin-bottom: 11px;">
                                    <span>发布时间：${courseInfo.crtTimeDisplay}</span>
                                    <span style=" margin-left: 30px;"></span>
                                </div>
                            </div>
                            <hr class="layui-bg-gray" style=" border: none;">
                        </div>
                    </c:otherwise>
                    </c:choose>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                        </div>
                    </c:otherwise>
                    </c:choose>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
        var $ = layui.jquery;
        $(".btnModule").click(function () {
            var module = $(this).attr("vb");
            if(undefined != module && null != module && "" != module){
                if("house" == module){
                    window.location.href = "${ctx}/subsyAudit";
                } else if("dinner" == module){
                    window.location.href = "${ctx}/subsyAudit";
                } else if("service" == module){
                    window.location.href = "${ctx}/subsyAudit";
                } else if("pord" == module){
                    window.location.href = "${ctx}/subsyAudit";
                } else if("active" == module){
                    window.location.href = "${ctx}/activ/list";
                } else if("ncare" == module){
                    window.location.href = "${ctx}/nurs/list";
                } else if("salesaction" == module){
                    window.location.href = "${ctx}/sale/list";
                } else if("print" == module){
                    window.location.href = "${ctx}/subsy/printList";
                }
            }
        });

        $(".btnActiveMore").click(function () {
            window.location.href = "${ctx}/activ/list";
        });
    });


</script>
</body>
</html>