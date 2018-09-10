<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>存管市场管理系统</title>
  <link rel="stylesheet" href="layui/css/layui.css">
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">存管市场管理系统</div>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test" style="width:240px;">
        <li class="layui-nav-item layui-this"><a href="javascript:void(0);" onclick="go('20001');">签到</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('20002');">签退</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10001');">个人投资人绑卡</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10002');">企业投资人绑卡</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10003');">个人投资人换卡</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10004');">企业投资人换卡</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10005');">查询投资人开户绑卡状态</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10006');">企业B2B入金</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10007');" title="经过验证个人出入金/企业出入金/市场出入金都可以查询">企业(市场)B2B入金结果查询</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('20003');">个人入金</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('20004');">出金(企业/个人)</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('20005');" title="出入金查询(个人出入金/企业出入金/市场出入金)市场B2B入金结果查询更详细些">出入金查询(个人出入金/企业出入金/市场出入金)</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10009');">市场入金</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('20006');">市场出金</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('20010');">余额查询</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('down_dir');">下载日终资金对账文件</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('upload_dir');">上传日终对账文件</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('20008');">文件生成通知</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('20007');">获取清算结果</a></li>
        <li class="layui-nav-item"><a href="javascript:void(0);" onclick="go('10010');">投资人销户</a></li>
        
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
	<div style="padding: 0px;height:98%;">
		<iframe id="iframe" src="demo/demo_20001.jsp" seamless height="100%" width="100%" scrolling="auto" frameborder="0"	 ></iframe>
	</div>
  </div>
  
</div>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;

});
function go(d){
	$("#iframe").attr("src","demo/demo_"+d+".jsp");
}
</script>
</body>
</html>