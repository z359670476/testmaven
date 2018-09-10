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
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
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
  <div class="layui-form-item isHide" >
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">版本号(Version)</label>
      <div class="layui-input-inline">
        <input type="text" name="Version" autocomplete="off"  value="1.0.0" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" >
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">业务代码(BusCd)</label>
      <div class="layui-input-inline">
        <input type="text" name="BusCd"  autocomplete="off"  value="20006" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易日期(Date)</label>
      <div class="layui-input-inline">
        <input type="text" name="Date"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" >
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易时间(Time)</label>
      <div class="layui-input-inline">
        <input type="text" name="Time"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">流水号(FtSeq)</label>
      <div class="layui-input-inline">
        <input type="text" name="FtSeq"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
      <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="fresh2" style="font-size: 26px; color: #1E9FFF;margin-left: 10px;">&#x1002;</i>   </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场代码(MarketId)</label>
      <div class="layui-input-inline">
        <input type="text" name="MarketId"  value="<%=MarkEnum.MARKCODE.getValue()%>"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" >
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">业务属性(BusAttr)</label>
      <div class="layui-input-inline ">
        <select  name="BusAttr"   lay-filter="BusAttr" >
	        <option value="1000" >1000</option>
	        <option value="1001">1001</option>
	      </select>
      </div>
      <div class="layui-form-mid layui-word-aux">(1000:资金轧差,1001:收益划出)</div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场存管账号(MarAcctNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="MarAcctNo"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" >
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场子账户号(SubAcctNo)</label>
      <div class="layui-input-inline">
        <input type="text" name="SubAcctNo"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;" >
      </div>
    </div>
  </div>
  
  <div class="layui-form-item" >
    <div class="layui-inline" >
      <label class="layui-form-label" style="width: 180px;">银行账户(Id)</label>
      <div class="layui-input-inline" style="width: 240px;">
        <select id="idtwo"   lay-verify="required"  >
        <option value="01090353700120101002220" > 01090353700120101002220</option>
        <option selected="selected" value="01090353700120101011747">01090353700120101011747</option>
        
      </select>
      </div>
      
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">户主名称(Name)</label>
      <div class="layui-input-inline">
        <input type="text" name="Name"  autocomplete="off" class="layui-input input-disabled" value="北京测试交易市场" readonly style="color:#795499; border: 0px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">账户类型(Type)</label>
      <div class="layui-input-inline">
        <input type="text" name="Type"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
       <div class="layui-form-mid layui-word-aux">( B企业 C个人)</div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">银行标志(BankFlag)</label>
      <div class="layui-input-inline">
        <input type="text" name="BankFlag"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
       <div class="layui-form-mid layui-word-aux">(BCCB:北京银行)</div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">银行分支行号(RcvCode)</label>
      <div class="layui-input-inline">
        <input type="text" name="RcvCode"  autocomplete="off" value="15984152316841565" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">支行名称(RcvName)</label>
      <div class="layui-input-inline">
        <input type="text" name="RcvName"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#795499; border: 0px;">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item" >
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易金额(TrfAmt)</label>
      <div class="layui-input-inline">
        <input type="text" name="TrfAmt"  autocomplete="off" class="layui-input clear" style="width: 198px;">
        <input type="hidden" name="markDemo" value="true" autocomplete="off" class="layui-input clear" style="width: 300px;">
      </div>
        <div class="layui-form-mid layui-word-aux">单位 : 分</div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-input-block">
      <button class="layui-btn sub" lay-submit="" lay-filter="demo1">发送出金指令</button>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn fakesub" lay-submit="" lay-filter="isHide" >提交</button>
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
  $("input[name='FtSeq']").val(new Date().pattern("yyyyMMddHHmmss")+num());
  
  $("input[name='MarAcctNo']").val(parent.$("#CK_ACCT").text());
  $("input[name='SubAcctNo']").val(parent.$("#ZC_ACCT").text());
  $("input[name='Id']").val("01090353700120101002220");
 // $("input[name='Name']").val("北京梅纳雪家居饰品有限公司ZRV(脱敏)");
  $("input[name='Type']").val("B");
  $("input[name='BankFlag']").val("BCCB");
  //$("input[name='RcvCode']").val("1");
  $("input[name='RcvName']").val("丰台支行");
  $("input[name='TrfAmt']").val("100");

  
  form.on('select(BusAttr)', function(data){
	  console.log(data.elem); //得到select原始DOM对象
// 	  alert(data.value); //得到被选中的值
	  console.log(data.othis); //得到美化后的DOM对象
		  
		  if(data.value=="1000"){
	 		  $("input[name='SubAcctNo']").val(parent.$("#ZC_ACCT").text());
	 		  $("#idtwo").html(  '<option value="01090353700120101002220" > 01090353700120101002220</option> <option selected="selected" value="01090353700120101011747">01090353700120101011747</option>' );
		  }else{
	 		  $("input[name='SubAcctNo']").val(parent.$("#SY_ACCT").text());
	 		  $("#idtwo").html('<option selected="selected" value="01090353700120101002220" > 01090353700120101002220</option> <option  value="01090353700120101011747">01090353700120101011747</option>' );
		  }
		  form.render();
		  
  });  
 
  
  //监听提交
  form.on('submit(demo1)', function(data){
	  data.field.action="20006";
	  if(getval()=="1000"){
		  data.field.Id="01090353700120101011747"
	  }else{
		  data.field.Id="01090353700120101002220";
	  }
	  data.field.Name="北京梅纳雪家居饰品有限公司ZRV(脱敏)";
	  data.field.RcvCode="1";
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
  
//   form.on('submit(demo2)', function(data){
// 	  isHide();
	  
//     return false;
//   });
  
  
});




</script>


</body>
</html>
