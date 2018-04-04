<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../common/resource.jsp" %>
    <%@ include file="../../../../common/tags.jsp" %>

    <title>护理师等级</title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">
    <style>
        .indextab {
            pointer-events: none;
            cursor: default;
            opacity: 0.6;
            cursor: not-allowed;
        }

        .indextab :hover {
            cursor: not-allowed;
        }

        table {
            font-size: 12px;
            border: none;
            border-spacing: 0;
            width: 100%;
            text-align: center;
        }

        th {
            max-width: 50px;
            height: 50px;
            word-break: break-all;
            word-wrap: break-word;
        }

        tr {
            height: 44px;
        }

        td {
            border: 1px solid #eae5e5

        }

        tbody tr:nth-child(odd) {
            background: #f9f9f9;
        }

        .pointer {
            color: #1E9FFF;
            cursor: pointer;
        }
    </style>
</head>

<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <!--header start-->
    <jsp:include page="../../../../header.jsp"/>
    <!--header end-->
    <!--sidebar start-->
    <jsp:include page="../../../../aside.jsp"/>
    <!--sidebar end-->
    <!--main content start-->
    <div class="layui-body">
        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i>月嫂各级别数量统计表</h5>
            </div>


            <div class="form-horizontal style-form ">
                <form class="layui-form">
                    <div class="layui-form-item layui-row">

                        <div class="layui-inline layui-col-md8">

                            <div class="layui-inline">
                                <label class="layui-form-label">会所</label>
                                <div class="layui-input-inline">
                                    <select name="subsyCode" lay-search>
                                        <option value="">请选择</option>
                                        <c:forEach items="${subsyList}" var="subsy">
                                            <option value="${subsy.subsyCode}">${subsy.subsyDispName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="layui-inline layui-col-md3">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search">查 询</button>
                            <button type="reset" class="layui-btn layui-btn-normal">清 空</button>
                        </div>

                    </div>
                </form>
                <div class="form-group">
                    <div class="row mt wrapper  layui-container ">
                        <div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>一星</th>
                                    <th>二星</th>
                                    <th>三星</th>
                                    <th>四星</th>
                                    <th>五星</th>
                                    <th>六星</th>
                                    <th>七星</th>
                                    <th>八星</th>
                                    <th>九星</th>
                                    <th>十星</th>
                                    <th>十一星</th>
                                    <th>十二星</th>
                                    <th>十三星</th>
                                    <th>十四星</th>
                                    <th>十五星</th>
                                    <th>总计</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--main content end-->
    <jsp:include page="../../../../footer.jsp"/>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'jquery', 'form'], function () {
        var $ = layui.jquery, form = layui.form, laydate = layui.laydate;


        form.on('submit(search)', function (data) {
            initGradeReportList(data.field.subsyCode);
            return false;
        });

        $(function(){
            initGradeReportList("");
        });

        function initGradeReportList(subsyCode) {
            $.get("${ctx}/mmatronReport/getGradeInfoListByCondition",
                {
                    subsyCode: subsyCode
                },
                function (data) {
                    if (data && data.length > 0) {
                        var array = [];
                        $.each(data, function (i, item) {
                            array.push("<tr>");
                            array.push("<td>" + item.subsyName + "</td>");
                            array.push("<td>" + item.column1 + "</td>");
                            array.push("<td>" + item.column2 + "</td>");
                            array.push("<td>" + item.column3 + "</td>");
                            array.push("<td>" + item.column4 + "</td>");
                            array.push("<td>" + item.column5 + "</td>");
                            array.push("<td>" + item.column6 + "</td>");
                            array.push("<td>" + item.column7 + "</td>");
                            array.push("<td>" + item.column8 + "</td>");
                            array.push("<td>" + item.column9 + "</td>");
                            array.push("<td>" + item.column10 + "</td>");
                            array.push("<td>" + item.column11 + "</td>");
                            array.push("<td>" + item.column12 + "</td>");
                            array.push("<td>" + item.column13 + "</td>");
                            array.push("<td>" + item.column14 + "</td>");
                            array.push("<td>" + item.column15 + "</td>");
                            array.push("<td>" + item.total + "</td>");
                            array.push("</tr>")
                        });
                        $("tbody").html(array.join(""));
                    }

                })
        }


    });


</script>
</body>
</html>
