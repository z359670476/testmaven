<%--
  Created by IntelliJ IDEA.
  User: 不才
  Date: 2018/9/7
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>出入金交易管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../layui/layui.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>网银入金结果查询</legend>
</fieldset>
<div style="margin-left: 20px;width: 95%;">

    <table class="layui-table" lay-data="{ even:true,page:true ,limits:[5,10,15],url:'demo_servlet.jsp',limit:'10',where: {method: 'eBanksBack'},method: 'post',initSort:{field:'CREATE_TIME', type:'desc'}}" lay-filter="demo">
        <thead>
        <tr>
            <th lay-data="{field:'TRANS_TIME', width:200,fixed: true}">处理时间</th>
            <th lay-data="{field:'SEAT_NO', width:150 }">投资人席位号</th>
            <th lay-data="{field:'SERIAL_NO', width:150,templet:'#tran_type'}">北京结算流水号</th>
            <th lay-data="{field:'TRANS_AMT', width:150}">入金金额</th>
            <th lay-data="{field:'RESP_CODE', width:150}">应答码</th>
            <th lay-data="{field:'RESP_MSG', width:150}">应答信息</th>
        </tr>
        </thead>
    </table>

</div>
<script>
    layui.use('table', function(){
        var table = layui.table;
        //监听表格复选框选择
        table.on('checkbox(demo)', function(obj){
            console.log(obj)
        });




    });
</script>


</body>
</html>