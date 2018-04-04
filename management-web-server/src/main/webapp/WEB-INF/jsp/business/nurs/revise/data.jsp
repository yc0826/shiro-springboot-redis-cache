<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>活动管理</title>
    <shiro:hasPermission name="activ:update">
        <c:set value="1" var="allow_update"/>
    </shiro:hasPermission>
    <shiro:hasPermission name="activ:delete">
        <c:set value="1" var="allow_delete"/>
    </shiro:hasPermission>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">
    <link href="${ctx}/static/css/jquery-ui.css" rel="stylesheet">
    <style>
        .ui-autocomplete-loading {
            background: white url("${ctx}/static/img/ui-anim_basic_16x16.gif") right center no-repeat;
        }
        .rolestye{
            margin-left: 10px;
            display: inline-block;
            width: 40px;
            border-radius: 6px;
            height: 17px;
            border: 1px solid #777;
            color: #777;
            text-align: center;
        }
        .rolelink{
            cursor: pointer;
            color: #1E9FFF;
        }
    </style>
</head>


<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!--header start-->
    <jsp:include page="../../../header.jsp"/>
    <!--header end-->
    <!--sidebar start-->
    <jsp:include page="../../../aside.jsp"/>
    <!--sidebar end-->
    <!--main content start-->
    <div class="layui-body">
        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i>修改护理记录</h5>
            </div>
            <div class="layui-form-item ">
                <form class="layui-form" style="padding-top: 22px;">
                    <div class="layui-form-item">

                        <div class="layui-inline">
                            <div class="layui-inline">
                                <label class="layui-form-label">选择日期</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="search">查 询</button>
                            </div>
                            <div class=" layui-inline">
                                <button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>
                            </div>
                        </div>

                    </div>
                </form>
            </div>

            <div class="form-horizontal style-form ">
                <div class="layui-tab" lay-filter="test1">
                    <ul class="layui-tab-title">
                        <li class="layui-this" lay-id="1">护理师记录</li>
                        <li lay-id="2">护士记录</li>
                        <li lay-id="3">医生记录</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <div class="form-group">
                                <div class="col-xs-12 mt">

                                    <div class="content-panel">
                                        <table id="table_data" class="dataTable table table-hover">
                                            <thead>
                                            <tr>
                                                <th >日期</th>
                                                <th >体温°</th>
                                                <th >血压mmh</th>
                                                <th >舒张压mmh</th>
                                                <th >脉搏次/分</th>
                                                <th >呼吸</th>
                                                <th >乳房状况</th>
                                                <th >宫底</th>
                                                <th >/腹部伤口</th>
                                                <th >面色</th>
                                                <th >精神</th>
                                                <th >食欲</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>9:00</td>
                                                <td>36</td>
                                                <td >212</td>
                                                <td>142</td>
                                                <td>60</td>
                                                <td>良好</td>
                                                <td >良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>
                                                    <div class="layui-btn-group">
                                                        <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                            <i class="layui-icon">&#xe642;</i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>10:00</td>
                                                <td>36</td>
                                                <td >212</td>
                                                <td>142</td>
                                                <td>60</td>
                                                <td>良好</td>
                                                <td >良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>
                                                    <div class="layui-btn-group">
                                                        <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                            <i class="layui-icon">&#xe642;</i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>13:00</td>
                                                <td>36</td>
                                                <td >212</td>
                                                <td>142</td>
                                                <td>60</td>
                                                <td>良好</td>
                                                <td >良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>
                                                    <div class="layui-btn-group">
                                                        <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                            <i class="layui-icon">&#xe642;</i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>18:00</td>
                                                <td>36</td>
                                                <td >212</td>
                                                <td>142</td>
                                                <td>60</td>
                                                <td>良好</td>
                                                <td >良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>良好</td>
                                                <td>
                                                    <div class="layui-btn-group">
                                                        <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                            <i class="layui-icon">&#xe642;</i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="layui-tab-item layui-show">
                                <div class="form-group">
                                    <div class="col-xs-12 mt">

                                        <div class="content-panel">
                                            <table id="table_data" class="dataTable table table-hover">
                                                <thead>
                                                <tr>
                                                    <th >日期</th>
                                                    <th >体温°</th>
                                                    <th >血压mmh</th>
                                                    <th >舒张压mmh</th>
                                                    <th >脉搏次/分</th>
                                                    <th >呼吸</th>
                                                    <th >乳房状况</th>
                                                    <th >宫底</th>
                                                    <th >/腹部伤口</th>
                                                    <th >面色</th>
                                                    <th >精神</th>
                                                    <th >食欲</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>9:00</td>
                                                    <td>36</td>
                                                    <td >212</td>
                                                    <td>142</td>
                                                    <td>60</td>
                                                    <td>良好</td>
                                                    <td >良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>
                                                        <div class="layui-btn-group">
                                                            <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                                <i class="layui-icon">&#xe642;</i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>10:00</td>
                                                    <td>36</td>
                                                    <td >212</td>
                                                    <td>142</td>
                                                    <td>60</td>
                                                    <td>良好</td>
                                                    <td >良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>
                                                        <div class="layui-btn-group">
                                                            <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                                <i class="layui-icon">&#xe642;</i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>13:00</td>
                                                    <td>36</td>
                                                    <td >212</td>
                                                    <td>142</td>
                                                    <td>60</td>
                                                    <td>良好</td>
                                                    <td >良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>
                                                        <div class="layui-btn-group">
                                                            <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                                <i class="layui-icon">&#xe642;</i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>18:00</td>
                                                    <td>36</td>
                                                    <td >212</td>
                                                    <td>142</td>
                                                    <td>60</td>
                                                    <td>良好</td>
                                                    <td >良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>
                                                        <div class="layui-btn-group">
                                                            <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                                <i class="layui-icon">&#xe642;</i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="layui-tab-item layui-show">
                                <div class="form-group">
                                    <div class="col-xs-12 mt">

                                        <div class="content-panel">
                                            <table id="table_data" class="dataTable table table-hover">
                                                <thead>
                                                <tr>
                                                    <th >日期</th>
                                                    <th >体温°</th>
                                                    <th >血压mmh</th>
                                                    <th >舒张压mmh</th>
                                                    <th >脉搏次/分</th>
                                                    <th >呼吸</th>
                                                    <th >乳房状况</th>
                                                    <th >宫底</th>
                                                    <th >/腹部伤口</th>
                                                    <th >面色</th>
                                                    <th >精神</th>
                                                    <th >食欲</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>9:00</td>
                                                    <td>36</td>
                                                    <td >212</td>
                                                    <td>142</td>
                                                    <td>60</td>
                                                    <td>良好</td>
                                                    <td >良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>
                                                        <div class="layui-btn-group">
                                                            <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                                <i class="layui-icon">&#xe642;</i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>10:00</td>
                                                    <td>36</td>
                                                    <td >212</td>
                                                    <td>142</td>
                                                    <td>60</td>
                                                    <td>良好</td>
                                                    <td >良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>
                                                        <div class="layui-btn-group">
                                                            <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                                <i class="layui-icon">&#xe642;</i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>13:00</td>
                                                    <td>36</td>
                                                    <td >212</td>
                                                    <td>142</td>
                                                    <td>60</td>
                                                    <td>良好</td>
                                                    <td >良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>
                                                        <div class="layui-btn-group">
                                                            <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                                <i class="layui-icon">&#xe642;</i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>18:00</td>
                                                    <td>36</td>
                                                    <td >212</td>
                                                    <td>142</td>
                                                    <td>60</td>
                                                    <td>良好</td>
                                                    <td >良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>良好</td>
                                                    <td>
                                                        <div class="layui-btn-group">
                                                            <button class="layui-btn layui-btn-primary layui-btn-sm toEdit" >
                                                                <i class="layui-icon">&#xe642;</i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>


    <!--main content end-->
    <jsp:include page="../../../footer.jsp"/>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域

    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'jqueryui', 'form', 'laydate'], function () {
        var $= layui.jquery, layer = layui.layer, datatable = layui.datatable;
        var form = layui.form
            ,laydate = layui.laydate;


        laydate.render({
            elem: '#date1'
        });


        if('${msg}') {
            layer.alert("${msg}", {icon: 1})
        }
        //初始化表格

        $("#add").click(function () {
            window.location.href = "${ctx}/activ/create"
        });

        $(document).on('click', ".toEdit", function () {
            var code = $(this).attr("vb");
            window.location.href = "${ctx}/activ/" + code + "/update"
        });
        $("#back").on("click", function(event){
            location.href = "${ctx}/nurs/list";
            console.log(456)
        })

    });

</script>


</body>
</html>
