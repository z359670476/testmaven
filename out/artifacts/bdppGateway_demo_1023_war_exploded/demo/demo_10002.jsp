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
  <legend>企业绑卡</legend>
</fieldset>
 
<form class="layui-form" action="http://101.231.114.246:8080/interface/market/comBindCard.do" target= "_blank" method="post">
  
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
        <input type="text" name="busiCode"  autocomplete="off" class="layui-input" value="10002">
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
      <label class="layui-form-label" style="width: 180px;">市场存管账号(marAcctNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="marAcctNo"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">企业名称(entName)</label>
      <div class="layui-input-inline">
        <input type="text" name="entName"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">营业执照号(busiLiceNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="busiLiceNo"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">税务登记证号(taxRegCertNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="taxRegCertNo"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">组织机构代码(organCode)</label>
      <div class="layui-input-inline">
        <input type="text" name="organCode"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">电子邮箱(email)</label>
      <div class="layui-input-inline">
        <input type="text" name="email"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">法人姓名(legalName)</label>
      <div class="layui-input-inline">
        <input type="text" name="legalName"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">法人身份证号(legalCardId)</label>
      <div class="layui-input-inline">
        <input type="text" name="legalCardId"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">企业注册地址(regAddr)</label>
      <div class="layui-input-inline">
        <input type="text" name="regAddr"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">联系人姓名(contactName)</label>
      <div class="layui-input-inline">
        <input type="text" name="contactName"  autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">联系人电话(contactPhone)</label>
      <div class="layui-input-inline">
        <input type="text" name="contactPhone"  autocomplete="off" class="layui-input clear">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">联系人手机号(telephone)</label>
      <div class="layui-input-inline">
        <input type="text" name="telephone"  autocomplete="off" class="layui-input clear">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">前台返回地址(frontUrl)</label>
      <div class="layui-input-inline">
        <input type="text" name="frontUrl"  autocomplete="off" class="layui-input clear" style="width: 300px;" value="https://www.baidu.com" >
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">后台通知地址(backUrl)</label>
      <div class="layui-input-inline">
        <input type="text" name="backUrl"  autocomplete="off" class="layui-input clear" style="width: 300px;" value="http://172.21.21.71:11000/bdpp-test/acp/backRcv.do">
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
  
  
  
  <div class="layui-form-item" style="text-align:center;">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
      <button class="layui-btn" lay-submit="" lay-filter="save">提交保存</button>
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
  $("input[name='marAcctNo']").val("1000650000001");
  
  $("input[name='seatNo']").val("dj0045");
  $("input[name='entName']").val("北京中景筑业装饰装潢设计有限公司 ACR( 脱敏 )");
  $("input[name='busiLiceNo']").val("11110000000");
  $("input[name='taxRegCertNo']").val("22220000000");
  $("input[name='organCode']").val("33330000000");
  $("input[name='email']").val("z359670476@163.com");
  $("input[name='legalName']").val("张一");
  $("input[name='legalCardId']").val("341126197709218462");
  $("input[name='regAddr']").val("北京丹棱街13号");
  $("input[name='contactName']").val("张一");
  $("input[name='contactPhone']").val("13100000015");
  $("input[name='telephone']").val("13100000015");
  
//   $("input[name='certificateNum']").val("130525199425321254");
//   $("input[name='phoneNum']").val("17710352025");
 
  
  
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
    return false;
  });
  form.on('submit(save)', function(data){
	  data.field.save=true;
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
    return false;
  });
  
  
});

</script>

</body>
</html>