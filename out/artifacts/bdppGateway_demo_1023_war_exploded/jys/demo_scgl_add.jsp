<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>市场管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script src="../layui/layui.js"></script>
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>  
 
 
 
<form class="layui-form"  style="margin-top: 20px;">
<div class="layui-row">
<div class="layui-col-xs6">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 120px;">市场编号</label>
      <div class="layui-input-inline">
        <input type="text" name="MARKET_CD" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  </div>
  <div class="layui-col-xs6">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 120px;">市场名称</label>
      <div class="layui-input-inline">
        <input type="text" name="MARKET_NM" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
</div></div>
<div class="layui-row">
<div class="layui-col-xs6">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 120px;">存款账户</label>
      <div class="layui-input-inline">
        <input type="text" name="CK_ACCT" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  </div>
  <div class="layui-col-xs6">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 120px;">市场收益子账户</label>
      <div class="layui-input-inline">
        <input type="text" name="SY_ACCT" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
</div></div>
<div class="layui-row">
<div class="layui-col-xs6">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 120px;">市场轧差子账户</label>
      <div class="layui-input-inline">
        <input type="text" name="ZC_ACCT" autocomplete="off" class="layui-input">
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
</div></div>
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
  var v="${param.v}";
  if("edit"==v){
	  var data=parent.editData;
	  $("input[name='MARKET_CD']").val(data.MARKET_CD);
	  $("input[name='MARKET_NM']").val(data.MARKET_NM);
	  $("input[name='CK_ACCT']").val(data.CK_ACCT);
	  $("input[name='SY_ACCT']").val(data.SY_ACCT);
	  $("input[name='ZC_ACCT']").val(data.ZC_ACCT);
	  $("input[name='REMARK']").val(data.REMARK);
	  if(data.STATUS=="1"){
		  $("input[name='STATUS']").attr("checked",false);
	  }
	  form.render();
  }
  //监听提交
  form.on('submit(formDemo)', function(data){
//     layer.msg(JSON.stringify(data.field));
	    if("edit"==v){
	    	 data.field.method="updMark";
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
		    data.field.method="addMark";
		    $.ajax({
		        type: "POST",
		        url: "demo_buss_servlet.jsp",
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