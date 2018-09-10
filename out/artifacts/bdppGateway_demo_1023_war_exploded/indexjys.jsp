<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>存管业务模拟系统</title>
  <link rel="stylesheet" href="layui/css/layui.css">
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">存管业务模拟系统</div>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-this"><a href="javascript:void(0);" onclick="go('scgl');">市场管理</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('tzrgl');">投资人管理</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('tzrjy');">投资人交易管理</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('tzrye');">投资人余额管理</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('tzrbuy');">投资人买管理</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('tzrsell');">投资人卖管理</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
<!--     <div style="padding: 15px;">内容主体区域1</div> -->
<!--     <div style="padding: 15px;">内容主体区域2</div> -->
<!--     <div style="padding: 15px;">内容主体区域3</div> -->

<!-- 	<iframe src="http://www.baidu.com" ></iframe> -->
	<div style="padding: 0px;height:98%;">
		<iframe id="iframe" src="jys/demo_scgl.jsp" seamless height="100%" width="100%" scrolling="auto" frameborder="0"	 ></iframe>
	</div>
  </div>
  
</div>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;

});
function go(d){
	$("#iframe").attr("src","jys/demo_"+d+".jsp");
}
</script>
</body>
</html>