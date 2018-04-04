<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>菜单管理</title>

    <!-- Bootstrap core CSS -->
    <%--<link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">--%>
    <!--external css-->
    <%--<link rel="stylesheet" type="text/css" href="${ctx}/static/css/zabuto_calendar.css">--%>
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <script src="${ctx}/static/js/common/jquery-1.11.1.min.js?v=${webVersion}"></script>
    <script src="${ctx}/static/js/common/jquery.step.min.js?v=${webVersion}"></script>


</head>

<body>




<script>

    var settings = {
        "async": true,
        "crossDomain": true,
        "url": "${ctx}/report/getSalesSummaryReport",
        "method": "POST",
        "headers": {
            "Content-Type": "application/json",
        },
        "processData": false,
        "data": "{\r\n \"subsyCode\":\"3130113001\",\r\n \"queryStartDate\":\"20171010\",\r\n \"queryEndDate\":\"20181212\"\r\n}"
    };

    function show(){
        $.ajax(settings).done(function (response) {
            console.log(response);
        });
    }






    function getTaskStatis() {
        var isSuccess= false;
        $.ajax({
            async: false,
            url: "${ctx}/task/getTaskStatis",
            type: 'post',
            data: JSON.stringify({"subsyCode":"3130113001","queryStartDate":"20170812","queryEndDate":"20180813","taskTranCode":"00340004"}),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            timeout: 10000,
            success: function (data) {
                if (data.status === 200) {
                    if(data!=null && data.result!=null){
                        if(data.result==1){
                            layer.alert("ok");
                            isSuccess = true;
                        }else{
                            layer.alert("失败");
                        }
                    }
                } else {
                    //layer.alert(data.errorMsg)
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

        return isSuccess;
    }

    function getSalesSummaryReport() {
        var isSuccess= false;
        $.ajax({
            async: false,
            url: "${ctx}/report/getSalesSummaryReport",
            type: 'post',
            data: JSON.stringify({"subsyCode" : "3130113001", "queryStartDate" : "20170101", "queryEndDate":"20180303"}),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            timeout: 10000,
            success: function (data) {
                if (data.status === 200) {
                    if(data!=null && data.result!=null){
                        if(data.result==1){
                            layer.alert("ok");
                            isSuccess = true;
                        }else{
                            layer.alert("失败");
                        }
                    }
                } else {
                    //layer.alert(data.errorMsg)
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

        return isSuccess;
    }

    function getCntrctIncomeStatis() {
        var isSuccess= false;
        $.ajax({
            async: false,
            url: "${ctx}/income/getCntrctIncomeStatis",
            type: 'post',
            data: JSON.stringify({"subsyCode" : "3130113001", "queryStartDate" : "20170101", "queryEndDate":"20180303"}),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            timeout: 10000,
            success: function (data) {
                if (data.status === 200) {
                    if(data!=null && data.result!=null){
                        if(data.result==1){
                            layer.alert("ok");
                            isSuccess = true;
                        }else{
                            layer.alert("失败");
                        }
                    }
                } else {
                    //layer.alert(data.errorMsg)
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

        return isSuccess;
    }


</script>


<input type="button" onclick="getCntrctIncomeStatis()" value="getCntrctIncomeStatis()">

<input type="button" onclick="getSalesSummaryReport()" value="getSalesSummaryReport()">
<input type="button" onclick="getTaskStatis()" value="getTaskStatis()">

<input type="button" onclick="show()" value="show()">


<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    $(".layui-btn-xs").click(function () {
        layer.open({
            title: "房型",
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

    layui.use(['form', 'element'], function () {
        var form = layui.form;
        var element = layui.element;


        var layid = location.hash.replace(/^#test1=/, '');//根据hash来改变tab
        element.tabChange('test1', layid);
        $("#prevBtn").on("click", function () {
            $step.prevStep();
            element.tabChange('test1', $step.getIndex());//传入相应的lay-id属性，下面tab切换
        });//上一步

        $(".next-step").on("click", function () {
            $step.nextStep();
            // $step.toStep(2);//改变某一个步骤的样式传入相应tab的lay-id
            element.tabChange('test1', $step.getIndex());//传入相应的lay-id属性，下面tab切换
        });//下一步。
        //监听Tab切换，以改变地址hash值
        element.on('tab(test1)', function () {
            location.hash = 'test1=' + this.getAttribute('lay-id');
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
<script src="${ctx}/static/js/jquery.nicescroll.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/common-scripts.js?v=${webVersion}"></script>


</body>
</html>
