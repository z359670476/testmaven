<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<html>
<head>
	<meta charset="utf-8">
	<title>投资人买管理</title>
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
	<input type="hidden" id="MARKET_CD" name="MARKET_CD">
	<%--买方账号信息--%>
	<input type="hidden" id="BUY_SEAT_NO" name="BUY_SEAT_NO">
	<input type="hidden" id="BUY_INVESTOR_ID" name="BUY_INVESTOR_ID">
	<input type="hidden" id="BUY_SYS_ACCT_NO" name="BUY_SYS_ACCT_NO">
	<%--卖方账号信息--%>
	<input type="hidden" id="SELL_SEAT_NO" name="SELL_SEAT_NO">
	<input type="hidden" id="SELL_SYS_ACCT_NO" name="SELL_SYS_ACCT_NO">

	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label" style="width: 120px;">买方名称</label>
			<div class="layui-input-inline">
				<div id="BUY_NAME" class="layui-form-mid layui-word-aux"></div>
			</div>
		</div>
	</div>

	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label" style="width: 120px;">卖方ID</label>
			<div class="layui-input-inline">
				<select name="SELL_INVESTOR_ID" id="SELL_INVESTOR_ID" lay-verify="SELL_INVESTOR_ID" lay-filter="investorOnchange">
				</select>
			</div>
		</div>
	</div>

	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label" style="width: 120px;">标的名称</label>
			<div class="layui-input-inline">
				<input type="text" name="SUBJECT_NAME" autocomplete="off" lay-verify="SUBJECT_NAME" class="layui-input">
			</div>
		</div>
	</div>

	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label" style="width: 120px;">交易金额</label>
			<div class="layui-input-inline">
				<input type="text" name="TRANS_AT" autocomplete="off" lay-verify="TRANS_AT" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">单位：分</div>
		</div>
	</div>

	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label" style="width: 120px;">手续费</label>
			<div class="layui-input-inline">
				<input type="text" name="SERVICE_FEE" autocomplete="off" lay-verify="SERVICE_FEE" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">单位：分</div>
		</div>
	</div>

	<%--<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label" style="width: 120px;">备注</label>
			<div class="layui-input-inline">
				<input type="text" name="REMARK" autocomplete="off" class="layui-input">
			</div>
		</div>
	</div>--%>

	<div class="layui-form-item">
		<div class="layui-inline">
		</div>
	</div>

	<div class="layui-form-item" style="text-align:center;">
		<div class="layui-input-block" style="margin-left:0px;">
			<button class="layui-btn" lay-submit lay-filter="formDemo">保存</button>
		</div>
	</div>
</form>
<script>
    $("#BUY_NAME").text(parent.editData.INV_NAME);
    $("#MARKET_CD").val(parent.editData.MARKET_CD);
    $("#BUY_SYS_ACCT_NO").val(parent.editData.SYS_ACCT_NO);
    $("#BUY_SEAT_NO").val(parent.editData.SEAT_NO);
    $("#BUY_INVESTOR_ID").val(parent.editData.ID);
    layui.use('form', function(){
        var form = layui.form;
        var investor;
        
		$.ajax({
			type: "POST",
			url: "demo_buss_tzrbuy.jsp",
			data: {method:"initModel",marketId:parent.editData.MARKET_CD,investId:parent.editData.ID},
			dataType: "json",
			success: function(d){
				//投资人ID
				investor = d.investorObj;
				$("#SELL_INVESTOR_ID").html("<option value=''>请选择</option>");
				for (var i = 0; i < investor.length; i++) {
					var item = investor[i];
					$("#SELL_INVESTOR_ID").append("<option  value="+item.ID+">"+item.ID+"-"+item.INV_NAME+"</option>");
				}
				form.render();
			},
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("signature fail: " + XMLHttpRequest.status + " , "
                    + XMLHttpRequest.readyState + " , " + textStatus);
            }
		});
		
		form.verify({
			  SELL_INVESTOR_ID: function(value, item){ //value：表单的值、item：表单的DOM对象
			    if(value==""){
			    	return '请选择卖方！';
			    }
			  }
			  ,SUBJECT_NAME: function(value, item){ //value：表单的值、item：表单的DOM对象
			    if(value==""){
			    	return '标的名称不能为空！';
			    }
			  }
			  ,TRANS_AT: function(value, item){ //value：表单的值、item：表单的DOM对象
			    if(value==""){
			    	return '交易金额不能为空！';
			    }
			  }
			  ,SERVICE_FEE: function(value, item){ //value：表单的值、item：表单的DOM对象
			    if(value==""){
			    	return '手续费不能为空';
			    }
			  }
		}); 
		
        form.on('select(investorOnchange)', function(data){
            var v = data.value;
            for (var i = 0; i < investor.length; i++) {
                var item = investor[i];
                if(v == item.ID){
                    $("#SELL_SEAT_NO").val(item.SEAT_NO);
                    $("#SELL_SYS_ACCT_NO").val(item.SYS_ACCT_NO);
                }
            }
            form.render();
        });

        //监听提交
        form.on('submit(formDemo)', function(data){
            console.log(data)
			data.field.method="addBuy";
			$.ajax({
				type: "POST",
				url: "demo_buss_tzrbuy.jsp",
				data: data.field,
				dataType: "json",
				success: function(d){
					parent.addRet=d.BuyRet&&d.SellRet;
					if(d.BuyRet&&d.SellRet){
						layer.msg("新增成功");
						setTimeout("parent.layer.close(parent.layer.getFrameIndex(window.name));",400);
					}else{
						layer.msg("新增失败");
					}
				}
			});
            return false;
        });
    });
</script>
</body>
</html>