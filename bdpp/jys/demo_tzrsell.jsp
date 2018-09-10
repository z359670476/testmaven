<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>投资人卖管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script src="../layui/layui.js"></script>
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>  
 
 <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>投资人卖管理</legend>
</fieldset>
<div style="margin-left: 20px;width: 95%;">
	
	<table class="layui-table" lay-data="{ even:true,page:true ,url:'demo_buss_tzrsell.jsp',limit:'5',where: {method: 'querySellList'},method: 'post',initSort:{field:'CREATE_TIME', type:'desc'}}" lay-filter="demo">
	  <thead>
	    <tr>
	      <th lay-data="{field:'MARKET_CD', width:100, sort: true}">市场编号</th>
	      <th lay-data="{field:'SEAT_NO', width:100, sort: true}">席位号</th>
	      <th lay-data="{field:'INV_NAME', width:160, sort: true}">投资人名称</th>
	      <th lay-data="{field:'SYS_ACCT_NO', width:150, sort: true}">投资人账号</th>
	      <th lay-data="{field:'SUBJECT_NAME', width:160}">标的名称</th>
	      <th lay-data="{field:'TRANS_AT', width:100}">交易金额</th>
	      <th lay-data="{field:'SERVICE_FEE', width:100}">手续费</th>
	      
	      <th lay-data="{ field:'STATUS',width:80,templet:'#status'}">状态</th>
	      <th lay-data="{field:'CREATE_TIME', width:180, sort: true}">创建时间</th>
	      <th lay-data="{field:'UPDATE_TIME', width:180, sort: true}">修改日期</th>
	      <th lay-data="{field:'REMARK', width:150, sort: true}">备注</th>
	      <th lay-data="{fixed: 'right', width:110, align:'center', toolbar: '#barDemo'}"></th>
	    </tr>
	  </thead>
	</table>
	<button class="layui-btn" id="add">
	  <i class="layui-icon">&#xe608;</i> 添加
	</button>
 </div>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-mini" lay-event="edit">
		 <i class="layui-icon">&#xe642;</i>
	</a>
  <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">
		 <i class="layui-icon">&#xe640;</i>
	</a>

</script>
<script type="text/html" id="status">
{{# if(d.STATUS!=null&&d.STATUS=="0"){ }}
  启用
{{# }else { }}
 禁止
{{# }}}
</script>
          
<script>
var editData;
layui.use('table', function(){
  var table = layui.table;
  //监听表格复选框选择
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.id + ' 的查看操作');
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
    	  $.ajax({
    	        type: "POST",
    	        url: "demo_buss_tzrsell.jsp",
    	        data: {method:"delsell",ID:data.ID},
    	        dataType: "json",
    	        success: function(d){
    	              if(d.ret){
    		              layer.msg("删除成功");
    		              obj.del();
    		              layer.close(index);
    	              }else{
    	            	  layer.msg("删除成功");
    	              }
    	        }
    	  });
      });
    } else if(obj.event === 'edit'){
//       layer.alert('编辑行：<br>'+ JSON.stringify(data))
      editData=data;
      layer.open({
      	  type: 2,
      	  skin: 'layui-layer-lan',
      	  title: ['修改投资人买交易信息', 'font-size:18px;'],
      	  content: 'demo_tzrsell_add.jsp?v=edit',
      	  area: ['836px', '417px'],
      	  moveOut :true,
      	  end: function(){
      		  	if(editData.ret){
      		  		obj.update({MARKET_CD:editData.data.MARKET_CD,
		      		  			SEAT_NO:editData.data.SEAT_NO,
		      		  			INVESTOR_ID:editData.data.INVESTOR_ID,
			      		  		SYS_ACCT_NO:editData.data.SYS_ACCT_NO,
								SUBJECT_NAME:editData.data.SUBJECT_NAME,
								TRANS_AT:editData.data.TRANS_AT,
								SERVICE_FEE:editData.data.SERVICE_FEE,
			      				STATUS:editData.data.STATUS,
			      				REMARK:editData.data.REMARK});
		      		  			editData.ret=false;
      		  	}
      	  }
  		});
      
      
    }
  });
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  
  $("#add").click(function(){
	  layer.open({
      	  type: 2,
      	  area: ['836px', '417px'],
      	  skin: 'layui-layer-lan',
      	  title: ['新增投资人卖交易信息', 'font-size:18px;'],
      	  content: 'demo_tzrsell_add.jsp',
      	  //area: ['80%', '80%'],
      	  moveOut :true,
      	  end: function(){
    		    if(addRet){
					parent.$("#iframe").attr("src","jys/demo_tzrsell.jsp");
    		    }
    	  }
  	});
	  
  });
  
});
</script>

</body>
</html>