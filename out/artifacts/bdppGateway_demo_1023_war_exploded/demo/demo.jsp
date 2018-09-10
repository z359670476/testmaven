<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>存管市场管理系统</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script src="../layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">存管市场管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
<!--     <ul class="layui-nav layui-layout-left"> -->
<!--       <li class="layui-nav-item"><a href="">控制台</a></li> -->
<!--       <li class="layui-nav-item"><a href="">商品管理</a></li> -->
<!--       <li class="layui-nav-item"><a href="">用户</a></li> -->
<!--       <li class="layui-nav-item"> -->
<!--         <a href="javascript:;">其它系统</a> -->
<!--         <dl class="layui-nav-child"> -->
<!--           <dd><a href="">邮件管理</a></dd> -->
<!--           <dd><a href="">消息管理</a></dd> -->
<!--           <dd><a href="">授权管理</a></dd> -->
<!--         </dl> -->
<!--       </li> -->
<!--     </ul> -->
<!--     <ul class="layui-nav layui-layout-right"> -->
<!--       <li class="layui-nav-item"> -->
<!--         <a href="javascript:;"> -->
<!--           <img src="http://t.cn/RCzsdCq" class="layui-nav-img"> -->
<!--           贤心 -->
<!--         </a> -->
<!--         <dl class="layui-nav-child"> -->
<!--           <dd><a href="">基本资料</a></dd> -->
<!--           <dd><a href="">安全设置</a></dd> -->
<!--         </dl> -->
<!--       </li> -->
<!--       <li class="layui-nav-item"><a href="">退了</a></li> -->
<!--     </ul> -->
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
<!--         <li class="layui-nav-item layui-nav-itemed"> -->
<!--           <a class="" href="javascript:;">所有商品</a> -->
<!--           <dl class="layui-nav-child"> -->
<!--             <dd><a href="javascript:;">列表一</a></dd> -->
<!--             <dd><a href="javascript:;">列表二</a></dd> -->
<!--             <dd><a href="javascript:;">列表三</a></dd> -->
<!--             <dd><a href="">超链接</a></dd> -->
<!--           </dl> -->
<!--         </li> -->
<!--         <li class="layui-nav-item"> -->
<!--           <a href="javascript:;">解决方案</a> -->
<!--           <dl class="layui-nav-child"> -->
<!--             <dd><a href="javascript:;">列表一</a></dd> -->
<!--             <dd><a href="javascript:;">列表二</a></dd> -->
<!--             <dd><a href="">超链接</a></dd> -->
<!--           </dl> -->
<!--         </li> -->
        <li class="layui-nav-item layui-this"><a href="javascript:void(0);" onclick="go('10001');">个人投资人绑卡</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10002');">企业投资人绑卡</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10003');">个人投资人换卡</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10004');">企业投资人换卡</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10005');">查询投资人开户及银行卡绑定状态</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10006');">企业B2B入金</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10007');">企业B2B入金结果查询</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10009');">交易市场B2B入金</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('down_dir');">下载日终资金对账文件</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('upload_dir');">上传日终对账文件</a></li>
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
		<iframe id="iframe" src="demo_10001.jsp" seamless height="100%" width="100%" scrolling="auto" frameborder="0"	 ></iframe>
	</div>
  </div>
  
</div>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;

});
function go(d){
	$("#iframe").attr("src","demo_"+d+".jsp");
}
</script>
</body>
</html>