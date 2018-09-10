<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>存管</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script src="../layui/layui.js"></script>
  <script src="../js/base.js?v=1.2"></script>
  
</head>
<body>
          
              
<!-- <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"> -->
<!--   <legend>出入金交易查询</legend> -->
<!-- </fieldset> -->
 
<form class="layui-form"  method="post" style="margin-top: 20px;">
      <label class="layui-form-label" style="width: 180px;"> </label>
  <div class="layui-form-item" style="display: none;">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">版本号(Version)</label>
      <div class="layui-input-inline">
        <input type="text" name="Version" autocomplete="off" class="layui-input" value="1.0.0">
      </div>
    </div>
  </div>
  <div class="layui-form-item" style="display: none;">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">业务代码(BusCd)</label>
      <div class="layui-input-inline">
        <input type="text" name="BusCd"  autocomplete="off" class="layui-input" value="20005">
      </div>
    </div>
  </div>
  <div class="layui-form-item" style="display: none;">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易日期(Date)</label>
      <div class="layui-input-inline">
        <input type="text" name="Date"  autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item" style="display: none;">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易时间(Time)</label>
      <div class="layui-input-inline">
        <input type="text" name="Time"  autocomplete="off" class="layui-input">
      </div>
      <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="fresh3" style="font-size: 26px; color: #1E9FFF;margin-left: 10px;">&#x1002;</i>   </div>
      <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="clear" style="font-size: 26px; color: #FF3030;margin-left: 10px;">&#xe639;</i>   </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场代码(MarketId)</label>
      <div class="layui-input-inline">
        <input type="text" name="MarketId"  autocomplete="off" class="layui-input clear " style="width: 300px;border: 0px;" disabled>
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">原交易流水号(FtSeq)</label>
      <div class="layui-input-inline">
        <input type="text" name="FtSeq"  autocomplete="off" class="layui-input clear " style="width: 300px;border: 0px;" disabled>
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">原交易日期(SrcDate)</label>
      <div class="layui-input-inline">
        <input type="text" name="SrcDate"  autocomplete="off" class="layui-input clear " style="width: 300px;border: 0px;" disabled>
      </div>
    </div>
  </div>
  
  
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">发送查看结果指令</button>
    </div>
  </div>
</form>




<div class="layui-form-item layui-form-text" style="display: none;">
    <label class="layui-form-label" style="width: 180px;">发送报文为：</label>
    <div class="layui-input-block">
      <textarea id="send" class="layui-textarea clear" style="min-height: 200px;"></textarea>
    </div>
  </div>
<div class="layui-form-item layui-form-text" style="display: none;">
    <label class="layui-form-label" style="width: 180px;">收到的报文为：</label>
    <div class="layui-input-block">
      <textarea  id="recver" class="layui-textarea clear "  style="min-height: 200px;"></textarea>
    </div>
  </div>




          
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form'], function(){
  var form = layui.form
  ,layer = layui.layer;
  
  $("input[name='Date']").val(new Date().pattern("yyyyMMdd"));
  $("input[name='Time']").val(new Date().pattern("HHmmss"));
  
  
  
  $("input[name='MarketId']").val(parent.editData.MARKET_CD);
  $("input[name='FtSeq']").val(parent.editData.SERIAL_NO);
  if(parent.editData.TRANS_DT==""){
	  $("input[name='SrcDate']").val((parent.editData.SERIAL_NO).substring(0,8));
  }else $("input[name='SrcDate']").val(parent.editData.TRANS_DT);
 
  
  
  //自定义验证规则
//   form.verify({
//     title: function(value){
//       if(value.length < 5){
//         return '标题至少得5个字符啊';
//       }
//     }
//     ,pass: [/(.+){6,12}$/, '密码必须6到12位']
//     ,content: function(value){
//       layedit.sync(editIndex);
//     }
//   });
  
  //监听提交
  form.on('submit(demo1)', function(data){
	  data.field.action="20005";
	  data.field.markdemo="selStaus";
    $.ajax({
		url : "../demo/demo_buss_servlet.jsp",
		type : "post",
		async : false,
		data : data.field,
		dataType : "json",
		success : function(res) {
			parent.$("#"+parent.editData.SERIAL_NO).hide();
			layer.alert(res.msg);
			parent.editData.data=res.data;
// 			setTimeout("parent.layer.close(parent.layer.getFrameIndex(window.name));",400);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("signature fail: " + XMLHttpRequest.status + " , "
					+ XMLHttpRequest.readyState + " , " + textStatus);
		}
	});
//     layer.alert(JSON.stringify(data.field), {
//       title: '最终的提交信息'
//     })
    return false;
  });
  
  
});




</script>

</body>
</html>