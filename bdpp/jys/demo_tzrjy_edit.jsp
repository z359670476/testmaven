<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>投资人交易管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script src="../layui/layui.js"></script>
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
  <style type="text/css">
  	.input-disabled{
	    border-top-width: 0px;
	    border-right-width: 0px;
	    border-bottom-width: 0px;
	    border-left-width: 0px;
  	}
  </style>
</head>
<body>  
 
 
 
<form class="layui-form"  style="margin-top: 20px;">
<div class="layui-row">
<div class="layui-col-xs6">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 120px;">市场编号</label>
      <div class="layui-input-inline">
        <input type="text" name="MARKET_CD" autocomplete="off" class="layui-input input-disabled" disabled>
      </div>
    </div>
  </div>
  </div>
  <div class="layui-col-xs6">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 120px;">席位号</label>
      <div class="layui-input-inline">
        <input type="text" name="SEAT_NO" autocomplete="off" class="layui-input input-disabled" disabled> 
      </div>
    </div>
  </div>
</div></div>
<div class="layui-row">
<div class="layui-col-xs6">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 120px;">姓名</label>
      <div class="layui-input-inline">
        <input type="text" name="INV_NAME" autocomplete="off" class="layui-input input-disabled" disabled>
      </div>
    </div>
  </div>
  </div>
  <div class="layui-col-xs6">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 120px;">投资人账号</label>
      <div class="layui-input-inline">
        <input type="text" name="SYS_ACCT_NO" autocomplete="off" class="layui-input input-disabled" disabled>
      </div>
    </div>
  </div>
</div></div>
<div class="layui-row">
	<div class="layui-col-xs6">
	 <div class="layui-form-item">
	    <div class="layui-inline">
	      <label class="layui-form-label" style="width: 120px;">金额</label>
	      <div class="layui-input-inline">
	        <input type="text" name="TRANS_AT" autocomplete="off" class="layui-input input-disabled" disabled>
	      </div>
	    </div>
	  </div>
	</div>
  <div class="layui-col-xs6">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 120px;">状态</label>
      <div class="layui-input-inline">
        <select name="STATUS" lay-filter="STATUS">
	        <option value="0" selected>提交</option>
	        <option value="1">成功</option>
	        <option value="2">失败</option>
	      </select>
      </div>
    </div>
  </div>
</div></div>
  
  <div class="layui-form-item" style="text-align: center;">
    <div class="layui-input-block" style="margin-left: 0px;">
      <button class="layui-btn" lay-submit lay-filter="formDemo">保存</button>
<!--       <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
    </div>
  </div>
</form>
 
<script>
layui.use('form', function(){
  var form = layui.form;
  
  var data=parent.editData;
  $("input[name='MARKET_CD']").val(data.MARKET_CD);
  $("input[name='SEAT_NO']").val(data.SEAT_NO);
  $("input[name='INV_NAME']").val(data.INV_NAME);
  $("input[name='SYS_ACCT_NO']").val(data.SYS_ACCT_NO);
  $("input[name='TRANS_AT']").val(data.TRANS_AT);
  $("select[name='STATUS']").val(data.STATUS);
  form.render();
	  
  //监听提交
  form.on('submit(formDemo)', function(data){
//     layer.msg(JSON.stringify(data.field));
    	 data.field.method="updFlow";
    	 data.field.ID=parent.editData.ID;
 	    $.ajax({
 	        type: "POST",
 	        url: "demo_buss_servlet.jsp",
 	        data: data.field,
 	        dataType: "json",
 	        success: function(d){
				  parent.editData.ret=d.ret;
 	              if(d.ret){
 	            	  if(d.obj!=null){
 	            		 parent.editData.data=d.obj;
 	            	  }else{
 	            	  	 parent.editData.data=data.field;
 	            	  }
 		              layer.msg("修改成功");
 		  			  setTimeout("parent.layer.close(parent.layer.getFrameIndex(window.name));",400);
 	              }else{
 	            	  layer.msg("修改失败");
 	              }
 	        }
 	   });
    return false;
  });
});
</script>

</body>
</html>