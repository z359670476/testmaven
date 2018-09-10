<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<title>投资人卖管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<form class="layui-form" style="margin-top:20px;">

	<div class="layui-row">
	    <div class="layui-col-xs6">
		     <div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label" style="width: 120px;">市场编号1111</label>
				    <div class="layui-input-inline">
						<select name="MARKET_CD" id="MARKET_CD">
						</select>
				    </div>
				</div>
			</div>
	    </div>
	    <div class="layui-col-xs6">
	      	<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label" style="width: 120px;">席位号</label>
					<div class="layui-input-inline">
						<input type="text" name="SEAT_NO" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
	    </div>
	  </div>
	  
	  <div class="layui-row">
	    <div class="layui-col-xs6">
		     <div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label" style="width: 120px;">投资人ID</label>
				    <div class="layui-input-inline">
						<select name="INVESTOR_ID" id="INVESTOR_ID" lay-filter="investorOnchange">
						</select>
				    </div>
				</div>
			</div>
	    </div>
	    <div class="layui-col-xs6">
	      	<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label" style="width: 120px;">投资人账号</label>
					<div class="layui-input-inline">
						<input type="text" name="SYS_ACCT_NO" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
	    </div>
	  </div>
	  
	  <div class="layui-row">
	    <div class="layui-col-xs6">
		     <div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label" style="width: 120px;">标的名称</label>
					<div class="layui-input-inline">
						<input type="text" name="SUBJECT_NAME" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
	    </div>
	    <div class="layui-col-xs6">
	      	<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label" style="width: 120px;">交易金额</label>
					<div class="layui-input-inline">
						<input type="text" name="TRANS_AT" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
	    </div>
	  </div>
	  
	   <div class="layui-row">
	    <div class="layui-col-xs6">
		     <div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label" style="width: 120px;">手续费</label>
					<div class="layui-input-inline">
						<input type="text" name="SERVICE_FEE" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
	    </div>
	    <div class="layui-col-xs6">
	      	<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label" style="width: 120px;">状态</label>
					<div class="layui-input-inline">
						<input type="checkbox" name="STATUS" lay-skin="switch" lay-text="启用|禁用" checked>
					</div>
				</div>
			</div>
	    </div>
	  </div>

	<div class="layui-row">
	    <div class="layui-col-xs6">
		     <div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label" style="width: 120px;">备注</label>
					<div class="layui-input-inline">
						<input type="text" name="REMARK" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
	    </div>
	    <div class="layui-col-xs6">
	      	<div class="layui-form-item">
				<div class="layui-inline">
				</div>
			</div>
	    </div>
	  </div>
	<div class="layui-form-item" style="text-align:center;">
		<div class="layui-input-block" style="margin-left:0px;">
			<button class="layui-btn" lay-submit lay-filter="formDemo">保存</button>
		</div>
	</div>
</form>
<script>
layui.use('form', function(){
  var form = layui.form;
  
  
  var investor;
  var v="${param.v}";
  if("edit"==v){
	  var data=parent.editData;
	  $("input[name='SEAT_NO']").val(data.SEAT_NO);
	  $("input[name='SYS_ACCT_NO']").val(data.SYS_ACCT_NO);
	  $("input[name='SUBJECT_NAME']").val(data.SUBJECT_NAME);
	  $("input[name='TRANS_AT']").val(data.TRANS_AT);
	  $("input[name='SERVICE_FEE']").val(data.SERVICE_FEE);
	  $("input[name='REMARK']").val(data.REMARK);
	  if(data.STATUS=="1"){
		  $("input[name='STATUS']").attr("checked",false);
	  }
	  
	  $.ajax({
	      type: "POST",
	      url: "demo_buss_tzrsell.jsp",
	      data: {method:"initModel"},
	      dataType: "json",
	      success: function(d){
	      	    //市场编号
				var market = d.marketObj;
	            $("#MARKET_CD").html("<option value=''>请选择</option>");
	            for (var i = 0; i < market.length; i++) {
	                 var item = market[i];
	                 if(item.MARKET_CD == data.MARKET_CD){
	                	 $("#MARKET_CD").append("<option  value="+item.MARKET_CD+" selected='selected'>"+item.MARKET_CD+"-"+item.MARKET_NM+"</option>");
	                 }else{
	                	 $("#MARKET_CD").append("<option  value="+item.MARKET_CD+">"+item.MARKET_CD+"-"+item.MARKET_NM+"</option>");
	                 }
	                
	            }
	            //投资人ID
	            investor = d.investorObj;
	            $("#INVESTOR_ID").html("<option value=''>请选择</option>");
	            for (var i = 0; i < investor.length; i++) {
	                 var item = investor[i];
	                 if(item.ID == data.INVESTOR_ID){
	                	 $("#INVESTOR_ID").append("<option  value="+item.ID+" selected='selected'>"+item.ID+"-"+item.INV_NAME+"</option>");
	                 }else{
	                	 $("#INVESTOR_ID").append("<option  value="+item.ID+">"+item.ID+"-"+item.INV_NAME+"</option>");
	                 }
	            }
	            form.render(); 
	      	}
	 	});
	  form.render();
  }else{
	  $.ajax({
	      type: "POST",
	      url: "demo_buss_tzrsell.jsp",
	      data: {method:"initModel"},
	      dataType: "json",
	      success: function(d){
	      	    //市场编号
				var market = d.marketObj;
	            $("#MARKET_CD").html("<option value=''>请选择</option>");
	            for (var i = 0; i < market.length; i++) {
	                 var item = market[i];
	                 $("#MARKET_CD").append("<option  value="+item.MARKET_CD+">"+item.MARKET_CD+"-"+item.MARKET_NM+"</option>");
	            }
	            //投资人ID
	            investor = d.investorObj;
	            $("#INVESTOR_ID").html("<option value=''>请选择</option>");
	            for (var i = 0; i < investor.length; i++) {
	                 var item = investor[i];
	                 $("#INVESTOR_ID").append("<option  value="+item.ID+">"+item.ID+"-"+item.INV_NAME+"</option>");
	            }
	            form.render(); 
	      	}
	 	});
  }
  
  	form.on('select(investorOnchange)', function(data){
		var v = data.value;
		for (var i = 0; i < investor.length; i++) {
			var item = investor[i];
			if(v == item.ID){
				$("input[name='SEAT_NO']").val(item.SEAT_NO);
				$("input[name='SYS_ACCT_NO']").val(item.SYS_ACCT_NO);
			}
		}
		form.render(); 
	}); 
  
  //监听提交
  form.on('submit(formDemo)', function(data){
//     layer.msg(JSON.stringify(data.field));
	    if("edit"==v){
	    	 data.field.method="updsell";
	    	 data.field.ID=parent.editData.ID;
	 	    $.ajax({
	 	        type: "POST",
	 	        url: "demo_buss_tzrsell.jsp",
	 	        data: data.field,
	 	        dataType: "json",
	 	        success: function(d){
					  parent.editData.ret=d.ret;
	 	              if(d.ret){
	 	            	  if(d.obj!=null){
	 	            		 parent.editData.data=d.obj;
	 	            	  }else{
	 	            	  	parent.editData.data=data.field;
	 	            	  	parent.editData.data.STATUS=editData.data.STATUS=="on"?"0":"1"
	 	            	  }
	 		              layer.msg("修改成功");
	 		  			  setTimeout("parent.layer.close(parent.layer.getFrameIndex(window.name));",400);
	 	              }else{
	 	            	  layer.msg("修改失败");
	 	              }
	 	        }
	 	   });
	    }else{
			data.field.method="addsell";
		    $.ajax({
		        type: "POST",
		        url: "demo_buss_tzrsell.jsp",
		        data: data.field,
		        dataType: "json",
		        success: function(d){
		        	  parent.addRet=d.ret;
		              if(d.ret){
			              layer.msg("新增成功");
			  			  setTimeout("parent.layer.close(parent.layer.getFrameIndex(window.name));",400);
		              }else{
		            	  layer.msg("新增失败");
		              }
		        }
		   });
	    }
    return false;
  });
});
</script>
</body>
</html>