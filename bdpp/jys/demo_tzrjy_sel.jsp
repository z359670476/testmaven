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
</div>
<script type="text/javascript">
	var obj=[{name:"市场编号",value:parent.editData.MARKET_CD},
	         {name:"市场存管账号",value:parent.editData.CK_ACCT},
	         {name:"席位号",value:parent.editData.SEAT_NO},
	         {name:"交易类型",value:transType()},
	         {name:"子交易类型",value:subTransType()},
	         {name:"市场端流水号",value:parent.editData.SERIAL_NO},
	         {name:"交易日期",value:parent.editData.TRANS_DT},
	         {name:"交易时间",value:parent.editData.TRANS_TIME},
	         {name:"交易金额",value:parent.editData.TRANS_AT},
	         {name:"交易币种",value:parent.editData.TRANS_CURR_CD},
	         {name:"存管系统账号（子账户号）",value:parent.editData.SYS_ACCT_NO},
	         {name:"渠道类型",value:parent.editData.CHANNEL_TP},
	         {name:"交易卡号/账号(银行账号)",value:parent.editData.BANK_ACCT_NO},
	         {name:"银行简码",value:parent.editData.BANK_ABBR},
	         {name:"银行中文名称",value:parent.editData.BANK_NM},
	         {name:"业务属性",value:getBussType()},
	         {name:"账户类型",value:(parent.editData.ACCT_TYPE=="B"?"对公账户":"对私账户")},
	         {name:"银行标志",value:parent.editData.BANK_FLAG},
	         {name:"银行分支行号",value:parent.editData.RCV_BANK_CODE},
	         {name:"支行名称",value:parent.editData.RCV_BANK_NAME},
// 	         {name:"删除标示",value:parent.editData.IS_DEL},
	         {name:"状态",value:getStatus()},
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
	
	function getStatus(){
		var ct= parent.editData.STATUS;
		if(ct=="0"){
			return "提交";
		}else if(ct=="1"){
			return "成功";
		}else if(ct=="2"){
			return "失败";
		}
	}
	function getBussType(){
		var ct= parent.editData.BUSINESS_ATTR;
		if(ct=="1000"){
			return "资金轧差";
		}else if(ct=="1001"){
			return "收益划出";
		}else if(ct=="1111"){
			return "其他";
		}else{
			return "";
		}
	}
	function transType(){
		var ct= parent.editData.TRANS_TP;
		if(ct!=null&&ct=="10001"){ 
		  	return "个人投资人登记绑卡";
		}else if(ct!=null&&ct=="10002"){ 
			return "企业投资人登记绑银行账户";
		}else if(ct!=null&&ct=="10003"){ 
			return "个人投资人更换出入金银行卡";
		}else if(ct!=null&&ct=="10004"){ 
			return "企业投资人更换出金银行账户";
		}else if(ct!=null&&ct=="10005"){ 
			return "查询投资人开户及银行账户绑定状态";
		}else if(ct!=null&&ct=="10006"){ 
			return "企业投资人 B2B入金";
		}else if(ct!=null&&ct=="10007"){ 
			return "企业投资人 B2B入金结果查询";
		}else if(ct!=null&&ct=="20003"){ 
			return "投资人入金";
		}else if(ct!=null&&ct=="20004"){ 
			return "投资人出金";
		}else if(ct!=null&&ct=="20005"){ 
			return "出入金交易查询";
		}else if(ct!=null&&ct=="20006"){ 
			return "市场出金";
		}else if(ct!=null&&ct=="20010"){ 
			return "市场入金";
		}else if(ct!=null&&ct=="20011"){ 
			return "投资人账户余额查询";
		}else { 
			return "字段错误";
		}
	}
	function subTransType(){
		 var ct= parent.editData.SUB_TRANS_TP;
		 var d=parent.editData;
		 if(d.TRANS_TP!=null&&d.TRANS_TP=="20004"){ 
			 if(ct!=null&&ct=="01"){ 
				 return "个人";
			 }else { 
				 return "企业";
			 }
		 }else if(d.TRANS_TP!=null&&d.TRANS_TP=="20006"){ 
			 if(ct!=null&&ct=="01"){ 
				 return "轧差子账户";
			 }else { 
				 return "收益子账户";
			 }
		 }else {
			 return "";
		 }
	}
</script>
</body>
</html>