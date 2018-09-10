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
  <legend>下载日终资金对账文件</legend>
</fieldset>
 
<form class="layui-form">
 <div class="layui-form-item">
    <label class="layui-form-label" >文件类型</label>
    <div class="layui-input-block"  style="width: 200px;">
      <select name="type" >
        <option value="DTL01">出入金交易明细对账</option>
        <option value="DTL02">开销户明细对账</option>
        <option value="DTL03">清算失败结果文件</option>
      </select>
    </div>
  </div>  
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" >日期</label>
      <div class="layui-input-inline">
        <input type="text" name="date"  autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" >市场编号</label>
      <div class="layui-input-inline">
        <input type="text" name="makeId"  autocomplete="off" class="layui-input" value="100019">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">下载</button>
    </div>
  </div>
</form>
          
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form'], function(){
  var form = layui.form
  ,layer = layui.layer;
  
  var day1 = new Date() ;
  day1.setDate(day1.getDate() - 1);
 $("input[name='date']").val(day1.pattern("yyyyMMdd"));
  
  
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
	  data.field.action="down";
    $.ajax({
		url : "demo_ftp_servlet.jsp",
		type : "post",
		async : false,
		data : data.field,
		dataType : "json",
		success : function(res) {
			if(res.code==0){
				var $eleForm = $("<form method='get' action='demo_ftp_servlet.jsp'>"+
						"<input type='hidden' name='action' value='downs'>"+
						"<input type='hidden' name='name' value='"+res.name+"'>"+
						" </form>");
			      $(document.body).append($eleForm);
			      //提交表单，实现下载
			      $eleForm.submit();
			}else{
				alert("下载出错");
			}
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