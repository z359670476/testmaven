<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@page import="com.enums.MarkEnum"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>签到</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script src="../layui/layui.js"></script>
  <script src="../js/base.js?v=1.1"></script>
</head>
<body>
	<form id="form" class="layui-form"  method="post">
   <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;"></label>
      <div class="layui-input-inline">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">版本号(Version)</label>
      <div class="layui-input-inline">
        <input type="text" name="Version" autocomplete="off" class="layui-input input-disabled" readonly  style="color:#795499; border: 0px;" value="1.0.0">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">业务代码(BusCd)</label>
      <div class="layui-input-inline">
        <input type="text" name="BusCd"  autocomplete="off" class="layui-input input-disabled" readonly  style="color:#795499; border: 0px;" value="20001">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易日期(Date)</label>
      <div class="layui-input-inline">
        <input type="text" name="Date"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易时间(Time)</label>
      <div class="layui-input-inline">
        <input type="text" name="Time"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
      <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="fresh2" style="font-size: 26px; color: #1E9FFF;margin-left: 10px;">&#x1002;</i>   </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易流水号(FtSeq)</label>
      <div class="layui-input-inline">
        <input type="text" name="FtSeq"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场代码(MarketId)</label>
      <div class="layui-input-inline">
        <input type="text" name="MarketId"  value="<%=MarkEnum.MARKCODE.getValue()%>" autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" >
      <input type="hidden" name="action" value="20001" autocomplete="off" class="layui-input clear" style="width: 300px;" >
      <input type="hidden" name="markDemo" value="true" autocomplete="off" class="layui-input clear" style="width: 300px;" >
      </div>
    </div>
  </div>
  
  
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">发送签到指令</button>
    </div>
  </div>
</form>
<script>
layui.use(['form'], function(){
  var form = layui.form
  ,layer = layui.layer;
  
  $("input[name='Date']").val(new Date().pattern("yyyyMMdd"));
  $("input[name='Time']").val(new Date().pattern("HHmmss"));
  $("input[name='FtSeq']").val(new Date().pattern("yyyyMMddHHmmss")+num());

  
 
  
  
 
  
  //监听提交
  form.on('submit(demo1)', function(data){
    $.ajax({
		url : "../demo/demo_buss_servlet.jsp",
		type : "post",
		async : false,
		data : $("#form").serialize(),
		dataType : "text",
		success : function(res) {
			layer.alert(res.trim());
			parent.getData();
//  			parent.location.reload(); 
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("signature fail: " + XMLHttpRequest.status + " , "
					+ XMLHttpRequest.readyState + " , " + textStatus);
		}
	});

    return false;
  });
  
  
});




</script>

	
</body>
</html>