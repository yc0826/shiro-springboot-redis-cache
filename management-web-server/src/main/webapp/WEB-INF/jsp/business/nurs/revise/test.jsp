<%--
  Created by IntelliJ IDEA.
  User: zhm
  Date: 2018/1/31
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<html>
<script src="${ctx}/babyskymng/static/js/common/jquery-1.11.1.min.js?v=${webVersion}"></script>
<head>
    <title>Title</title>
</head>
<body>
<%--<input type="button" onclick="test()"/>--%>
   <form action="http://127.0.0.1:9083/babyskymng/ncare/crtNcareBaseData" method="post"  >
       <input type="text" name="subsyCode" value="3130113001"/>
       <input type="text" name="ncareTranCode" value="NBIZ1001"/>
       <input type="text" name="itemName" value="121354456"/>
       <input type="text" name="unitName" value="mi/min"/>
       <input type="text" name="valiData[0].valiOprCode" value="00180002"/>
       <input type="text" name="valiData[0].valiDataVal" value="22.3"/>
       <input type="text" name="valiData[0].status" value="true"/>
       <input type="text" name="valiData[1].valiOprCode" value="00180003"/>
       <input type="text" name="valiData[1].valiDataVal" value="22.5"/>
       <input type="text" name="valiData[1].status" value="true"/>
      <input type="text" name="minVal" value="198.3"/>
       <input type="text" name="maxVal" value="203.5">
       <input type="text" name="ruleItemCountAndTime.day" value="1"/>
       <input type="text" name="ruleItemCountAndTime.count" value="2"/>
       <input type="text" name="ruleItemCountAndTime.time[0]" value="153000"/>
       <input type="text" name="ruleItemCountAndTime.time[1]" value="153000"/>
       <input type="submit" value="test" id="submit" >
</form>
</body>
<script type="text/javascript">

    /*function test() {

        $.ajax({
            url: 'http://127.0.0.1:9083/babyskymng/ncare/getNcareBaseData',
            type: 'get',
            data: {

                'subsyCode': '3130113001'
                , 'ncareTranCode': 'NBIZ1001'

            },
            dataType: 'json',
            timeout: 10000,
            success: function (data) {

                if (data.status === 200) {
                    alert(1);
                } else {
                    alert(0);
                }
            }
        });
        return false;
    }*/
</script>
</html>
