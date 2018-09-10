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
  <script src="../js/base.js?v=1.1"></script>
  
</head>
<body>
          
              
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>市场出金</legend>
</fieldset>
 
<form class="layui-form"  method="post">
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">版本号(Version)</label>
      <div class="layui-input-inline">
        <input type="text" name="Version" autocomplete="off" class="layui-input" value="1.0.0">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">业务代码(BusCd)</label>
      <div class="layui-input-inline">
        <input type="text" name="BusCd"  autocomplete="off" class="layui-input" value="20006">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易日期(Date)</label>
      <div class="layui-input-inline">
        <input type="text" name="Date"  autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易时间(Time)</label>
      <div class="layui-input-inline">
        <input type="text" name="Time"  autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">流水号(FtSeq)</label>
      <div class="layui-input-inline">
        <input type="text" name="FtSeq"  autocomplete="off" class="layui-input">
      </div>
      <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="fresh2" style="font-size: 26px; color: #1E9FFF;margin-left: 10px;">&#x1002;</i>   </div>
      <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="clear" style="font-size: 26px; color: #FF3030;margin-left: 10px;">&#xe639;</i>   </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场代码(MarketId)</label>
      <div class="layui-input-inline">
        <input type="text" name="MarketId"  autocomplete="off" class="layui-input clear" >
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">业务属性(BusAttr)</label>
      <div class="layui-input-inline">
        <input type="text" name="BusAttr"  autocomplete="off" class="layui-input clear" value="1000">
      </div>
      <div class="layui-form-mid layui-word-aux">(1000:资金轧差,1001:收益划出,1111:其他)</div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场存管账号(MarAcctNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="MarAcctNo"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场子账户号(SubAcctNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="SubAcctNo"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">银行账户(Id)</label>
      <div class="layui-input-inline">
        <input type="text" name="Id"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">户主名称(Name)</label>
      <div class="layui-input-inline">
        <input type="text" name="Name"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">账户类型(Type)</label>
      <div class="layui-input-inline">
        <input type="text" name="Type"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">银行标志(BankFlag)</label>
      <div class="layui-input-inline">
        <input type="text" name="BankFlag"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">银行分支行号(RcvCode)</label>
      <div class="layui-input-inline">
        <input type="text" name="RcvCode"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">支行名称(RcvName)</label>
      <div class="layui-input-inline">
        <input type="text" name="RcvName"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易金额(TrfAmt)</label>
      <div class="layui-input-inline">
        <input type="text" name="TrfAmt"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
    </div>
  </div>
</form>




<div class="layui-form-item layui-form-text">
    <label class="layui-form-label" style="width: 180px;">发送报文为：</label>
    <div class="layui-input-block">
      <textarea id="send" class="layui-textarea clear" style="min-height: 200px;"></textarea>
    </div>
  </div>
<div class="layui-form-item layui-form-text">
    <label class="layui-form-label" style="width: 180px;">收到的报文为：</label>
    <div class="layui-input-block">
      <textarea  id="recver" class="layui-textarea clear"  style="min-height: 200px;"></textarea>
    </div>
  </div>




          
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form'], function(){
  var form = layui.form
  ,layer = layui.layer;
  
  $("input[name='Date']").val(new Date().pattern("yyyyMMdd"));
  $("input[name='Time']").val(new Date().pattern("HHmmss"));
  $("input[name='FtSeq']").val(new Date().pattern("yyyyMMddHHmmss")+num());
  
  
  $("input[name='MarketId']").val("100036");
  $("input[name='MarAcctNo']").val("1000360000001");
  $("input[name='SubAcctNo']").val("1000360000003");
  $("input[name='Id']").val("01090353700112000000226");
  $("input[name='Name']").val("北京菁诚明泰礼品有限公司ZBH(脱敏)");
  $("input[name='Type']").val("B");
  $("input[name='BankFlag']").val("BCCB");
  $("input[name='RcvCode']").val("1");
  $("input[name='RcvName']").val("北京南苑支行");
  $("input[name='TrfAmt']").val("1000");
 
  
  
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
	  data.field.action="20006";
    $.ajax({
		url : "demo_buss_servlet.jsp",
		type : "post",
		async : false,
		data : data.field,
		dataType : "text",
		success : function(res) {
			 $("#send").val(res.split("|***|")[0].trim());
			 $("#recver").val(res.split("|***|")[1].trim());
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