<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>出入金交易管理</title>
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
  <legend>出入金交易管理</legend>
</fieldset>
<div style="margin-left: 20px;width: 95%;">
	
	<table class="layui-table" lay-data="{ even:true,page:true ,limits:[5,10,15],url:'demo_servlet.jsp',limit:'10',where: {method: 'selFlow'},method: 'post',initSort:{field:'CREATE_TIME', type:'desc'}}" lay-filter="demo">
	  <thead>
	    <tr>
<!-- 	      <th lay-data="{field:'MARKET_CD', width:150, sort: true, fixed: true}">市场编号</th> -->
	      <th lay-data="{field:'SERIAL_NO', width:200,fixed: true}">市场端流水号</th>
	      <th lay-data="{field:'SEAT_NO', width:150 }">席位号</th>
<!-- 	      <th lay-data="{field:'CK_ACCT', width:150}">市场存管账号</th> -->
	      <th lay-data="{field:'TRANS_TP', width:150,templet:'#tran_type'}">交易类型</th>
<!-- 	      <th lay-data="{field:'SUB_TRANS_TP', width:150,templet:'#sub_tran_type'}">子交易类型</th> -->
	      
	      <th lay-data="{field:'TRANS_DT', width:150}">交易日期</th>
	      <th lay-data="{field:'TRANS_TIME', width:150}">交易时间</th>
	      <th lay-data="{field:'TRANS_AT', width:150}">交易金额</th>
	      <th lay-data="{field:'SYS_ACCT_NO', width:200}">投资人账号</th>

			<!-- 	      <th lay-data="{field:'BANK_ACCT_NO', width:200}">交易卡号/账号(银行账号)</th> -->
	      <th lay-data="{field:'STATUS', width:100,templet:'#status'}">状态</th>
<!-- 	      <th lay-data="{field:'set',fixed: 'right', width:160, align:'left', templet: '#barDemo'}">操作</th> -->
	      <th lay-data="{field:'set', width:100, align:'left', templet: '#barDemo'}">操作</th>
	    </tr>
	  </thead>
	</table>
<!-- 	<button class="layui-btn" id="add"> -->
<!-- 	  <i class="layui-icon">&#xe608;</i> 添加 -->
<!-- 	</button> -->
 </div>
<!--   <a class="layui-btn layui-btn-mini" lay-event="edit"> -->
<!-- 		 <i class="layui-icon">&#xe642;</i> -->
<!-- 	</a> -->
<!--   <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del"> -->
<!-- 		 <i class="layui-icon">&#xe640;</i> -->
<!-- 	</a> -->
<script type="text/html" id="barDemo">
<%--  <a class="layui-btn layui-btn-mini" lay-event="sel">
		查看
	</a>--%>
{{# if(d.STATUS=="0" ){  }}
  	<a  id="{{d.SERIAL_NO }}" class="layui-btn layui-btn-mini" lay-event="sel2">
		 查看结果
	</a>

{{# } }}
</script>
<script type="text/html" id="tran_type">
{{# if(d.TRANS_TP!=null&&d.TRANS_TP=="10001"){ }}
  个人投资人登记绑卡
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="10002"){ }}
企业投资人登记绑银行账户
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="10003"){ }}
个人投资人更换出入金银行卡
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="10004"){ }}
企业投资人更换出金银行账户
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="10005"){ }}
查询投资人开户及银行账户绑定状态
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="10006"){ }}
企业投资人 B2B入金
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="10007"){ }}
企业投资人 B2B入金结果查询
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="10009"){ }}
市场入金
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="20003"){ }}
投资人入金
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="20004"){ }}
投资人出金
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="20005"){ }}
出入金交易查询
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="20006"){ }}
市场出金
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="20010"){ }}
市场入金
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="20011"){ }}
投资人账户余额查询
{{# }else { }}
 
{{# }}}
</script>
          

<script type="text/html" id="status">
{{# if(d.STATUS=="0"){ }}
	提交
{{#}else if(d.STATUS=="1"){ }}
	成功
{{#}else if(d.STATUS=="2"){ }}
	失败
{{# }else { }}
 
{{# }}}
</script>
<script type="text/html" id="sub_tran_type">
{{# if(d.TRANS_TP!=null&&d.TRANS_TP=="20004"){ }}
	{{# if(d.SUB_TRANS_TP!=null&&d.SUB_TRANS_TP=="01"){ }}
  		个人
	{{# }else { }}
		企业
	{{# }}}
{{#}else if(d.TRANS_TP!=null&&d.TRANS_TP=="20006"){ }}
	{{# if(d.SUB_TRANS_TP!=null&&d.SUB_TRANS_TP=="01"){ }}
  		轧差子账户
	{{# }else { }}
		收益子账户
	{{# }}}
{{# }else { }}
 
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
    if(obj.event === 'sel'){
//       layer.msg('ID：'+ data.id + ' 的查看操作');
    	editData=data;
        layer.open({
        	  type: 2,
        	  skin: 'layui-layer-lan',
        	  title: ['交易流水详细信息', 'font-size:18px;'],
        	  content: 'demo_tzrjy_sel.jsp',
        	  area: ['80%', '85%'],
        	  moveOut :true,
        	  end: function(){
        	  }
    	});
    } else if(obj.event === 'sel2'){
    	editData=data;
    	if(data.STATUS=="1"){
    		layer.alert("此交易成功");
    		return;
    	}else if(data.STATUS=="2"){
    		layer.alert("此交易失败");
    		return;
    	}
        layer.open({
        	  type: 2,
        	  skin: 'layui-layer-lan',
        	  title: ['交易流水查询', 'font-size:18px;'],
        	  content: 'demo_20005.jsp',
        	  area: ['80%', '85%'],
        	  moveOut :true,
        	  end: function(){
        		  obj.update({STATUS:editData.data[0].STATUS,set:editData.data[0].STATUS});
        	  }
    	});
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
    	  $.ajax({
    	        type: "POST",
    	        url: "demo_buss_servlet.jsp",
    	        data: {method:"delFlow",ID:data.ID},
    	        dataType: "json",
    	        success: function(d){
    	              if(d.ret){
    		              layer.msg("删除成功");
    		              obj.del();
    		              layer.close(index);
    	              }else{
    	            	  layer.msg("新增失败");
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
      	  title: ['流水信息修改', 'font-size:18px;'],
      	  content: 'demo_tzrjy_edit.jsp',
    	  area: ['836px', '417px'],
      	  moveOut :true,
      	  end: function(){
      		  	if(editData.ret){
      		  		obj.update({
	      				STATUS:editData.data.STATUS});
      		  			editData.ret=false;
      		  	}
      	  }
  		});
      
      
    }
  });
  
//   var $ = layui.$, active = {
//     getCheckData: function(){ //获取选中数据
//       var checkStatus = table.checkStatus('idTest')
//       ,data = checkStatus.data;
//       layer.alert(JSON.stringify(data));
//     }
//     ,getCheckLength: function(){ //获取选中数目
//       var checkStatus = table.checkStatus('idTest')
//       ,data = checkStatus.data;
//       layer.msg('选中了：'+ data.length + ' 个');
//     }
//     ,isAll: function(){ //验证是否全选
//       var checkStatus = table.checkStatus('idTest');
//       layer.msg(checkStatus.isAll ? '全选': '未全选')
//     }
//   };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  
  $("#add").click(function(){
	  layer.open({
      	  type: 2,
      	  skin: 'layui-layer-lan',
      	  title: ['新增市场信息', 'font-size:18px;'],
      	  content: 'demo_scgl_add.jsp',
      	  area: ['98%', '98%'],
      	  moveOut :true,
      	  end: function(){
      		    if(addRet){
					parent.$("#iframe").attr("src","jys/demo_scgl.jsp");
      		    }
      	  }
  	});
	  
  });
  
});
</script>

</body>
</html>