<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>交易所模拟系统</title>
  <link rel="stylesheet" href="layui/css/layui.css">
  <style type="text/css">

    .layui-body{overflow-y: scroll;}
  </style>
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo" style="margin-left: 8px;">
    	<img src="layui/images/logo.png" />
    </div>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-this"><a href="javascript:void(0);" onclick="go('index');"><b>首页</b></a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('tzrgl');"><b>投资人管理</b></a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('crjgl');"><b>出入金交易管理</b></a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('ebanksback');"><b>网银入金后台通知</b></a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('down_dir');"><b>下载日终资金对账文件</b></a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('rzqs');"><b>市场日终清算</b></a></li>
        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/index.jsp"><b>存管市场管理系统</b></a></li>
        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/indexjys.jsp"><b>存管业务模拟系统</b></a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
	<div style="padding: 15px;height:100%;">
		<iframe id="iframe" src="markdemo/demo_index.jsp" height="100%" width="100%" frameborder="0" scrolling="auto"<%--seamless--%>></iframe>
	</div>
  </div>
<%--  <div class="layui-footer">
    © 北京登记结算有限公司
  </div>--%>
  
</div>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;

});
function go(d){
	$("#iframe").attr("src","markdemo/demo_"+d+".jsp");
}
</script>
</body>
</html>