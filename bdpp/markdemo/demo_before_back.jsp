<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="com.dao.Mazeo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
System.out.println("前台........。。。。。。。。。。。。。。。。");
System.out.println("***********************************************");
Map<String,String[]> map = request.getParameterMap();

	String code = "";
	String info = "";
	for(Entry<String,String[]> en:map.entrySet()){
		System.out.println(en.getKey()+":"+en.getValue()[0]);
		if ("respCode".equals(en.getKey()))
		    code = en.getValue()[0];
		else if("respMsg".equals(en.getKey()))
			info = en.getValue()[0];
	}
	Boolean icon = false;
	if ("0000".equals(code))
		icon = true;
	//个人投资人绑卡
	/*if("10001".equals(map.get("busiCode")[0])){
		String channelType=map.get("channelType")[0];//渠道类型
		String transTime=map.get("transTime")[0];//交易时间
		String serialNo=map.get("serialNo")[0];//流水号
		String marketId=map.get("marketId")[0];//市场代码
		String marAcctNo=map.get("marAcctNo")[0];//市场存管账号
		String seatNo=map.get("seatNo")[0];//投资人市场端席位号
		String respCode=map.get("respCode")[0];//应答码
		String respMsg=map.get("respMsg")[0];//应答信息
		String signature=map.get("signature")[0];//签名
		Mazeo maz=new Mazeo();
		String updSql = "update TBL_BDPP_INVESTOR set STATUS=? where MARKET_CD=? and SEAT_NO=?";
		String status="0000".equals(respCode)?"1":"2";
		maz.execute(updSql, new String[] {status,marketId,seatNo});
	}
	//企业投资人绑卡
	else if("10002".equals(map.get("busiCode")[0])){ 
		String channelType=map.get("channelType")[0];//渠道类型
		String transTime=map.get("transTime")[0];//交易时间
		String serialNo=map.get("serialNo")[0];//流水号
		String marketId=map.get("marketId")[0];//市场代码
		String marAcctNo=map.get("marAcctNo")[0];//市场存管账号
		String seatNo=map.get("seatNo")[0];//投资人市场端席位号
		String respCode=map.get("respCode")[0];//应答码
		String respMsg=map.get("respMsg")[0];//应答信息
		String signature=map.get("signature")[0];//签名
		Mazeo maz=new Mazeo();
		String updSql = "update TBL_BDPP_INVESTOR set STATUS=? where MARKET_CD=? and SEAT_NO=?";
		String status="0000".equals(respCode)?"1":"2";
		maz.execute(updSql, new String[] {status,marketId,seatNo});
	}
	//企业b2b入金
	else if("10006".equals(map.get("busiCode")[0])){
		String channelType=map.get("channelType")[0];//渠道类型
		String recvTime=map.get("recvTime")[0];//交易受理时间
		String serialNo=map.get("serialNo")[0];//流水号
		String transAmt=map.get("transAmt")[0];//交易金额
		String marketId=map.get("marketId")[0];//市场代码
		String respCode=map.get("respCode")[0];//应答码
		
		Mazeo maz=new Mazeo();
		String updSql = "update TBL_BDPP_TRANS_FLOW set STATUS=?,TRANS_TIME=?,TRANS_AT=? where SERIAL_NO=?";
		String status="0000".equals(respCode)?"1":"2";
		maz.execute(updSql, new String[] {status,recvTime,transAmt,serialNo});
	}*/

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>存管</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../layui/layui.js"></script>
    <style>
        body{text-align:center}
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">
            <img src="../layui/images/logo.png" />
        </div>
    </div>
    <div style="margin-top:150px;">
        <%
            if(icon){
        %>
        <img src="../img/success.png">
        <%
            }else{
        %>
        <img src="../img/fail.png">
        <%}%>
        <p style="font-size:20px;"><%=info%></p>
    </div>
    <button class="layui-btn layui-btn-primary" style="margin-top:15px" onclick="JavaScript:CloseWebPage();">关闭</button>
</div>
</body>

<script>
    function CloseWebPage(){
        if (navigator.userAgent.indexOf("MSIE") > 0) {
            if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
                window.opener = null;
                window.close();
            } else {
                window.open('', '_top');
                window.top.close();
            }
        }
        else if (navigator.userAgent.indexOf("Firefox") > 0) {
            window.location.href = 'about:blank ';
        } else {
            window.opener = null;
            window.open('', '_self', '');
            window.close();
        }
    }
</script>

</html>


