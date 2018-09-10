<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
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
	



 
<form class="layui-form" action="http://101.231.114.246:8080/interface/market/comB2B.do" target= "_blank" method="post">
   <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;"></label>
      <div class="layui-input-inline">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">版本号(version)</label>
      <div class="layui-input-inline">
        <input type="text" name="version" autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" value="1.0">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">编码(encoding)</label>
      <div class="layui-input-inline">
        <input type="text" name="encoding"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" value="utf-8">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">业务代码(busiCode)</label>
      <div class="layui-input-inline">
        <input type="text" name="busiCode"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" value="10009">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">渠道类型(channelType)</label>
      <div class="layui-input-inline">
        <input type="text" name="channelType"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" value="01">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易时间(transTime)</label>
      <div class="layui-input-inline">
        <input type="text" name="transTime"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">流水号(serialNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="serialNo"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
      <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="fresh" style="font-size: 26px; color: #1E9FFF;margin-left: 10px;">&#x1002;</i>   </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易金额(transAmt)</label>
      <div class="layui-input-inline">
        <input type="text" name="transAmt"  autocomplete="off" class="layui-input clear" style="width: 198px;">
      </div>
       <div class="layui-form-mid layui-word-aux">单位 : 分</div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场代码(marketId)</label>
      <div class="layui-input-inline">
        <input type="text" name="marketId"  value="<%=MarkEnum.MARKCODE.getValue()%>" autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" >
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">资金账号 (acctNo)</label>
      <div class="layui-input-inline">
         <select name="acctNo"   lay-verify="required"  >
	        <option id="acctNo1" value=""></option>
	        <option id="acctNo2" value=""></option>
     	 </select>
      </div>
    </div>
  </div>
  
   <input type="hidden" name="CK_ACCT"  autocomplete="off" class="layui-input clear" style="width: 198px;">
     <%@include file="demo_1_tail.jsp"%>
  
  
  
  <div class="layui-form-item isHide">
    <div class="layui-input-block">
      <button name="goldin" class="layui-btn sub" lay-submit="" lay-filter="demo1">发送入金指令</button>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button name="tijiao" class="layui-btn fakesub" lay-submit="" lay-filter="isHide" >提交</button>
    </div>
  </div>
</form>
          
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
/* $(function(){
	 $(".isHide").each(function() {
			$(this).parent().parent(".layui-form-item").hide();
			$(this).parent().parent().parent(".layui-form-item").hide();
		});
});
 */

layui.use(['form'], function(){
  var form = layui.form
  ,layer = layui.layer;
  
 
  
  $("input[name='transTime']").val(new Date().pattern("yyyyMMddHHmmss"));
  $("input[name='serialNo']").val(new Date().pattern("yyyyMMddHHmmss")+num());
  $("input[name='CK_ACCT']").val(parent.$("#CK_ACCT").text());
  
  
  $("input[name='transAmt']").val("100");

 var t='<option  value="'+parent.$("#ZC_ACCT").text()+'">'+parent.$("#ZC_ACCT").text()+'</option><option  value="'+parent.$("#SY_ACCT").text()+'">'+parent.$("#SY_ACCT").text()+'</option>';
 $("select[name='acctNo']").html(t);
 form.render(); 

 
  
  
 
  
  //监听提交
  form.on('submit(demo1)', function(data){
    $.ajax({
		url : "../demo/signature_servlet.jsp",
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