<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@page import="com.enums.MarkEnum"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">          
<title>存管</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
 <link rel="stylesheet" href="../css/index.css">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../layui/layui.js"></script>
<script src="../js/base.js?v=1.2"></script>
</head>
<body>

 
<form class="layui-form"  method="post">
   <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;"></label>
      <div class="layui-input-inline">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">版本号(Version)</label>
      <div class="layui-input-inline">
        <input type="text" name="Version" autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" value="1.0.0">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">业务代码(BusCd)</label>
      <div class="layui-input-inline">
        <input type="text" name="BusCd"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" value="20007">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易日期(Date)</label>
      <div class="layui-input-inline">
        <input type="text" name="Date"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易时间(Time)</label>
      <div class="layui-input-inline">
        <input type="text" name="Time"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
      <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="fresh2" style="font-size: 26px; color: #1E9FFF;margin-left: 10px;">&#x1002;</i>   </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场代码(MarketId)</label>
      <div class="layui-input-inline">
        <input type="text" name="MarketId"  value="<%=MarkEnum.MARKCODE.getValue()%>"   autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" >
      </div>
    </div>
  </div>
  <div class="layui-form-item ">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">清算场次号(SiNum)</label>
      <div class="layui-input-inline">
        <input type="text" name="SiNum"  autocomplete="off" class="layui-input input-disabled"  >
      </div>
    </div>
  </div>
  <div class="layui-form-item ">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">清算批次号(BtNum)</label>
      <div class="layui-input-inline">
        <input type="text" name="BtNum"  autocomplete="off" class="layui-input input-disabled" >
         <input type="hidden" name="markDemo" value="true" autocomplete="off" class="layui-input clear" style="width: 300px;" >
      </div>
    </div>
  </div>
  
  
  
  <div class="layui-form-item isHide" >
    <div class="layui-input-block">
      <button class="layui-btn sub" lay-submit="" lay-filter="demo1">查询清算结果指令</button>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn fakesub" lay-submit="" lay-filter="demo1">提交</button>
    </div>
  </div>
</form>









          
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form'], function(){
  var form = layui.form
  ,layer = layui.layer;
  
  $("input[name='Date']").val(new Date().pattern("yyyyMMdd"));
  $("input[name='Time']").val(new Date().pattern("HHmmss"));
  
  
  $("input[name='SiNum']").val(new Date().pattern("yyyyMMdd"));
  $("input[name='BtNum']").val("0001");
 
  
  
  
  //监听提交
  form.on('submit(demo1)', function(data){
	  data.field.action="20007";
    $.ajax({
		url : "../demo/demo_buss_servlet.jsp",
		type : "post",
		async : false,
		data : data.field,
		dataType : "text",
		success : function(res) {
			layer.alert(res.trim());
			parent.getData();
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