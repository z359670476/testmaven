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
    <script src="../js/base.js"></script>
  
</head>
<body>
          
              
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>个人投资人换卡</legend>
</fieldset>
 
<form class="layui-form" action="http://101.231.114.246:8080/interface/market/perExchangeCard.do" target= "_blank" method="post">
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">版本号(version)</label>
      <div class="layui-input-inline">
        <input type="text" name="version" autocomplete="off" class="layui-input" value="1.0">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">编码(encoding)</label>
      <div class="layui-input-inline">
        <input type="text" name="encoding"  autocomplete="off" class="layui-input" value="utf-8">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">业务代码(busiCode)</label>
      <div class="layui-input-inline">
        <input type="text" name="busiCode"  autocomplete="off" class="layui-input" value="10003">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">渠道类型(channelType)</label>
      <div class="layui-input-inline">
        <input type="text" name="channelType"  autocomplete="off" class="layui-input" value="01">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易时间(transTime)</label>
      <div class="layui-input-inline">
        <input type="text" name="transTime"  autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">流水号(serialNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="serialNo"  autocomplete="off" class="layui-input">
      </div>
            <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="fresh" style="font-size: 26px; color: #1E9FFF;margin-left: 10px;">&#x1002;</i>   </div>
            <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="clear" style="font-size: 26px; color: #FF3030;margin-left: 10px;">&#xe639;</i>   </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场代码(marketId)</label>
      <div class="layui-input-inline">
        <input type="text" name="marketId"  autocomplete="off" class="layui-input clear" style="width: 300px;" >
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">投资人席位号(seatNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="seatNo"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">投资人子账户号(subAcctNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="subAcctNo"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">前台返回地址(frontUrl)</label>
      <div class="layui-input-inline">
        <input type="text" name="frontUrl"  autocomplete="off" class="layui-input clear" style="width: 300px;" value="http://117.78.48.115:8083/cgdemo/markdemo/demo_before_back.jsp" >
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">后台通知地址(backUrl)</label>
      <div class="layui-input-inline">
        <input type="text" name="backUrl"  autocomplete="off" class="layui-input clear" style="width: 300px;" value="http://117.78.48.115:8083/cgdemo/markdemo/demo_last_back.jsp">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">签名(signature)</label>
      <div class="layui-input-inline">
        <input type="text" name="signature"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  
  
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
    </div>
  </div>
</form>
          
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form'], function(){
  var form = layui.form
  ,layer = layui.layer;
  
  $("input[name='transTime']").val(new Date().pattern("yyyyMMddHHmmss"));
  $("input[name='serialNo']").val(new Date().pattern("yyyyMMddHHmmss")+num());
  
  
  $("input[name='marketId']").val("100065");
  $("input[name='subAcctNo']").val("1000652017050814004301000101");
  $("input[name='seatNo']").val("002");
 
  
  
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
    $.ajax({
		url : "signature_servlet.jsp",
		type : "post",
		async : false,
		data : data.field,
		dataType : "json",
		success : function(sig) {
			 $("input[name='signature']").val(sig.signature);
			 $("form").submit();
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