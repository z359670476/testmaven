<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="com.dao.Mazeo"%>
<%@ page import="com.sdk.PublicKeyUtil" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
System.out.println("后台........");
System.out.println("========================================");
Map<String,String[]> map = request.getParameterMap();

for(Entry<String,String[]> en:map.entrySet()){
	System.out.println(en.getKey()+":"+en.getValue()[0]);
}

	Map<String, String> respMap = new LinkedHashMap<String, String>();
	for(Entry<String,String[]> en:map.entrySet()){
		/*if("save".equals(en.getKey()))continue;*/
		respMap.put(en.getKey(), en.getValue()[0]);
	}

	PublicKeyUtil keyUtil=new PublicKeyUtil();
	keyUtil.validateByRSA(respMap);
 
	//个人投资人绑卡
	Mazeo maz=new Mazeo();
	if("10001".equals(map.get("busiCode")[0])){
		//String channelType=map.get("channelType")[0];//渠道类型
		//String transTime=map.get("transTime")[0];//交易时间
		//String serialNo=map.get("serialNo")[0];//流水号
		String marketId=map.get("marketId")[0];//市场代码
		//String marAcctNo=map.get("marAcctNo")[0];//市场存管账号
		String seatNo=map.get("seatNo")[0];//投资人市场端席位号
		String respCode=map.get("respCode")[0];//应答码
		//String respMsg=map.get("respMsg")[0];//应答信息
		String subAcctNo=map.get("subAcctNo")[0];//投资人子账户号
		String bankAcctNo=map.get("bankAcctNo")[0];//银行卡号
		//String signature=map.get("signature")[0];//签名
		if("0000".equals(respCode)){
			String updSql = "update TBL_BDPP_INVESTOR set BANK_ACCT_NO=?, SYS_ACCT_NO=?, STATUS=? where MARKET_CD=? and SEAT_NO=?";
			String status="0000".equals(respCode)?"1":"2";
			maz.execute(updSql, new String[] {bankAcctNo,subAcctNo,status,marketId,seatNo});
		}else{
			String updSql = "update TBL_BDPP_INVESTOR set STATUS=? where MARKET_CD=? and SEAT_NO=?";
			String status="0000".equals(respCode)?"1":"2";
			maz.execute(updSql, new String[] {status,marketId,seatNo});
		}
	}
	//企业投资人绑卡
	else if("10002".equals(map.get("busiCode")[0])){

		//String channelType=map.get("channelType")[0];//渠道类型
		//String transTime=map.get("transTime")[0];//交易时间
		//String serialNo=map.get("serialNo")[0];//流水号
		String marketId=map.get("marketId")[0];//市场代码
		//String marAcctNo=map.get("marAcctNo")[0];//市场存管账号
		String seatNo=map.get("seatNo")[0];//投资人市场端席位号
		String respCode=map.get("respCode")[0];//应答码
		//String respMsg=map.get("respMsg")[0];//应答信息
		String subAcctNo=map.get("subAcctNo")[0];//投资人子账户号
		String bankAcctNo=map.get("bankAcctNo")[0];//银行卡号
		//String signature=map.get("signature")[0];//签名
		
		if("0000".equals(respCode)){
			String updSql = "update TBL_BDPP_INVESTOR set BANK_ACCT_NO=?, SYS_ACCT_NO=?, STATUS=? where MARKET_CD=? and SEAT_NO=?";
			String status="0000".equals(respCode)?"1":"2";
			maz.execute(updSql, new String[] {bankAcctNo,subAcctNo,status,marketId,seatNo});
		}else{
			String updSql = "update TBL_BDPP_INVESTOR set STATUS=? where MARKET_CD=? and SEAT_NO=?";
			String status="0000".equals(respCode)?"1":"2";
			maz.execute(updSql, new String[] {status,marketId,seatNo});
			
		}
	}
	//企业b2b入金
	else if("10006".equals(map.get("busiCode")[0])){
// 		String channelType=map.get("channelType")[0];//渠道类型
		String transTime=map.get("transTime")[0];//交易时间
		String serialNo=map.get("serialNo")[0];//流水号
		String transAmt=map.get("transAmt")[0];//交易金额
// 		String serialSeq=map.get("serialSeq")[0];//存管系统流水号
// 		String marketId=map.get("marketId")[0];//市场代码
// 		String acctNo=map.get("acctNo")[0];//资金账号
		String respCode=map.get("respCode")[0];//应答码
		String updSql = "update TBL_BDPP_TRANS_FLOW set STATUS=?,TRANS_TIME=?,TRANS_AT=? where SERIAL_NO=?";
		String status="0000".equals(respCode)?"1":"2";
		maz.execute(updSql, new String[] {status,transTime,transAmt,serialNo});
	}
			

%>