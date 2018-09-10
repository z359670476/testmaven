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
  <legend>上传日终对账文件</legend>
</fieldset>
 
<form class="layui-form">
<!--  <div class="layui-form-item"> -->
<!--     <label class="layui-form-label" >支付渠道</label> -->
<!--     <div class="layui-input-block"  style="width: 200px;"> -->
<!--       <select name="pay" > -->
<!--         <option value=""></option> -->
<!--         <option value="0">北京</option> -->
<!--         <option value="1">上海</option> -->
<!--         <option value="2">广州</option> -->
<!--         <option value="3">深圳</option> -->
<!--         <option value="4">杭州</option> -->
<!--       </select> -->
<!--     </div> -->
<!--   </div>   -->
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" >市场编号</label>
      <div class="layui-input-inline">
        <input type="text" name="makeId"  autocomplete="off" class="layui-input" value="100037">
      </div>
    </div>
  </div>
 <div class="layui-form-item">
    <label class="layui-form-label" >文件类型</label>
    <div class="layui-input-block"  style="width: 200px;">
      <select name="type" >
        <option value="STL01">市场清算文件明细</option>
        <option value="STL02">交易信息登记文件</option>
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
      <label class="layui-form-label" >批次号</label>
      <div class="layui-input-inline">
        <input type="text" name="stakeNum"  autocomplete="off" class="layui-input" value="0001">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
        <input type="file" name="file" id="test20" style="margin-left: 110px;"/>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">上传</button>
      <button class="layui-btn" lay-submit="" lay-filter="create">生成对账文件</button>
    </div>
  </div>
</form>
          
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form','upload'], function(){
  var form = layui.form
  ,upload = layui.upload
  ,layer = layui.layer;
  
//   var day1 = new Date() ;
//   day1.setDate(day1.getDate() - 1);
//  $("input[name='date']").val(day1.pattern("yyyyMMdd"));
 $("input[name='date']").val(new Date().pattern("yyyyMMdd"));
  
 
//绑定原始文件域
var upd1= upload.render({
   elem: '#test20'
   ,url: 'demo_upload_ftp_servlet2.jsp'
   ,accept: 'file'
   ,auto:false
   ,done: function(res){
     console.log(res)
   }
 });
 
  
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
	  upd1.config.data = data.field;
	  upd1.upload();
    return false;
  });
  
  form.on('submit(create)', function(data){
	  data.field.action="createFile";
// 	  $.ajax({
// 			url : "demo_buss_servlet.jsp",
// 			type : "post",
// 			async : false,
// 			data : data.field,
// 			dataType : "json",
// 			success : function(res) {
// 				if(res.ret){
					
// 				}else {
// 					layer.msg(res.msg, {icon: 5});
// 				}
// 			},
// 			error : function(XMLHttpRequest, textStatus, errorThrown) {
// 				alert("signature fail: " + XMLHttpRequest.status + " , "
// 						+ XMLHttpRequest.readyState + " , " + textStatus);
// 			}
// 		});
	  var $eleForm = $("<form method='get' action='demo_buss_servlet.jsp'>"+
				"<input type='hidden' name='action' value='createFile'>"+
				"<input type='hidden' name='makeId' value='"+ data.field.makeId+"'>"+
				"<input type='hidden' name='type' value='"+ data.field.type+"'>"+
				"<input type='hidden' name='date' value='"+ data.field.date+"'>"+
				"<input type='hidden' name='stakeNum' value='"+ data.field.stakeNum+"'>"+
				" </form>");
	      $(document.body).append($eleForm);
	      //提交表单，实现下载
	      $eleForm.submit();
    return false;
  });
  
  
});

</script>

</body>
</html>