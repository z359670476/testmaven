<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<title>市场管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="layui-container">
<!-- 	<div class="layui-row" style="margin-top: 20px;"> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">市场编号：1111111111</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">市场存管账号</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">席位号</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">存管系统账号（子账户号）</div> -->
<!-- 	    </div> -->
<!-- 	 </div> -->
<!-- 	<div class="layui-row" style="margin-top: 20px;"> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">投资人类型：1111111111</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">姓名</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">投资人证件类型</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">电子邮箱</div> -->
<!-- 	    </div> -->
<!-- 	 </div> -->
<!-- 	<div class="layui-row" style="margin-top: 20px;"> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">投资人证件号码：1111111111</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">营业执照号</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">组织机构代码</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">税务登记证</div> -->
<!-- 	    </div> -->
<!-- 	 </div> -->
<!-- 	<div class="layui-row" style="margin-top: 20px;"> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">法人姓名：1111111111</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">法人身份证号</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">联系电话</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">联系人</div> -->
<!-- 	    </div> -->
<!-- 	 </div> -->
<!-- 	<div class="layui-row" style="margin-top: 20px;"> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">联系人手机号：1111111111</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">企业注册地址</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">删除标示</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">状态</div> -->
<!-- 	    </div> -->
<!-- 	 </div> -->
<!-- 	<div class="layui-row" style="margin-top: 20px;"> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">创建人：1111111111</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">创建时间</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">修改人</div> -->
<!-- 	    </div> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo">修改日期</div> -->
<!-- 	    </div> -->
<!-- 	 </div> -->
<!-- 	<div class="layui-row" style="margin-top: 20px;"> -->
<!-- 	    <div class="layui-col-xs3"> -->
<!-- 	      <div class="grid-demo grid-demo-bg1">备注：1111111111</div> -->
<!-- 	    </div> -->
<!-- 	 </div> -->
</div>
<script type="text/javascript">
	var obj=[{name:"市场编号",value:parent.editData.MARKET_CD},
	         {name:"市场存管账号",value:parent.editData.CK_ACCT},
	         {name:"席位号",value:parent.editData.SEAT_NO},
	         {name:"存管系统账号（子账户号）",value:parent.editData.SYS_ACCT_NO},
	         {name:"投资人类型",value:(parent.editData.INV_TYPE=="01"?"个人投资人":"企业投资人" )},
	         {name:"姓名",value:parent.editData.INV_NAME},
	         {name:"投资人证件类型",value:getCertType()},
	         {name:"电子邮箱",value:parent.editData.EMAIL},
	         {name:"投资人证件号码",value:parent.editData.CERT_ID},
	         {name:"营业执照号",value:parent.editData.COM_INSTRUMENT},
	         {name:"组织机构代码",value:parent.editData.ORG_CODE},
	         {name:"税务登记证",value:parent.editData.TAX_CERTIF},
	         {name:"法人姓名",value:parent.editData.CORP_REPRESENTIVE},
	         {name:"法人身份证号",value:parent.editData.CORP_CERTIF},
	         {name:"联系电话",value:parent.editData.TELEPHONE},
	         {name:"联系人",value:parent.editData.CONTACTS},
	         {name:"联系人手机号",value:parent.editData.MOBILE},
	         {name:"企业注册地址",value:parent.editData.ADDRESS},
// 	         {name:"删除标示",value:parent.editData.IS_DEL},
	         {name:"状态",value:getStatu()},
	         {name:"创建人",value:parent.editData.CREATED_BY},
	         {name:"创建时间",value:parent.editData.CREATE_TIME},
	         {name:"修改人",value:parent.editData.UPDATED_BY},
	         {name:"修改日期",value:parent.editData.UPDATE_TIME},
	         {name:"备注",value:parent.editData.REMARK}
	];
	var htm="";
	if(obj.length>0){
		htm+="<div class='layui-row' style='margin-top: 20px;'>";
		for(var i=0;i<obj.length;i++){
			if(i!=0&&i%3==0)htm+="</div><div class='layui-row' style='margin-top: 20px;'>";
			htm+="<div class='layui-col-xs4'>"+
		            "<div class='grid-demo grid-demo-bg1'><span class=' layui-word-aux'>"+obj[i].name+"</span>:"+obj[i].value+"</div>"+
			    "</div>";
		}
		htm+="</div>";
	}
	$(".layui-container").html(htm);
	
	function getStatu(){
		var ct= parent.editData.STATUS;
		if(ct=="0"){
			return "提交";
		}else if(ct=="1")
			return "成功";
		else return "失败";
	}
	
	function getCertType(){
// 		01：身份证 02：军官证 03：护照 04：回乡证 05：台胞证 06：警官证 07：士兵证 99：其他证件
		var ct= parent.editData.CERT_TP;
		if(ct=="01"){
			return "身份证";
		}else if(ct=="02"){
			return "军官证";
		}else if(ct=="03"){
			return "护照";
		}else if(ct=="04"){
			return "回乡证";
		}else if(ct=="05"){
			return "台胞证";
		}else if(ct=="06"){
			return "警官证";
		}else if(ct=="07"){
			return "士兵证";
		}else if(ct=="99"){
			return "其他证件";
		}else{
			return "其他证件";
		}
	}
</script>
</body>
</html>