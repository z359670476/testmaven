<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.Mazeo"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.io.File"%>
<%@page import="com.sdk.PublicKeyUtil"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
Map<String,String[]> map = request.getParameterMap();


Map<String, String> respMap = new LinkedHashMap<String, String>();
for(Entry<String,String[]> en:map.entrySet()){
	if("save".equals(en.getKey()))continue;
	respMap.put(en.getKey(), en.getValue()[0]);
}

PublicKeyUtil keyUtil=new PublicKeyUtil();
respMap= keyUtil.signByRSA(respMap);

out.print("{\"signature\":\""+respMap.get("signature")+"\"}" );
if(map.containsKey("save")){
	String addSql="";
	String[] param=null;
	Mazeo maz=new Mazeo();
	if("10001".equals(map.get("busiCode")[0])){
		String selSql="select * from TBL_BDPP_INVESTOR where MARKET_CD=? and SEAT_NO=? ";
		ArrayList<String[]> list=maz.executeQuery(selSql, new String[]{map.get("marketId")[0],map.get("seatNo")[0]});
		if(list!=null&&list.size()>0){ System.out.println("数据库已包含此投资人...."+map.get("marketId")[0]+":"+map.get("seatNo")[0]); return;}
		addSql="insert into TBL_BDPP_INVESTOR (ID, MARKET_CD, CK_ACCT, SEAT_NO, INV_TYPE, INV_NAME, CERT_TP, CERT_ID, TELEPHONE, IS_DEL, STATUS, CREATE_TIME, REMARK) values (SEQ_BDPP_INVESTOR.NEXTVAL,?,?,?,'01',?,?,?,?,0,0,sysdate,'') ";
		param= new String[]{map.get("marketId")[0],map.get("marAcctNo")[0],map.get("seatNo")[0],map.get("custName")[0],map.get("certificateType")[0],map.get("certificateNum")[0],map.get("phoneNum")[0]};
	}else if("10002".equals(map.get("busiCode")[0])){
		String selSql="select * from TBL_BDPP_INVESTOR where MARKET_CD=? and SEAT_NO=? ";
		ArrayList<String[]> list=maz.executeQuery(selSql, new String[]{map.get("marketId")[0],map.get("seatNo")[0]});
		if(list!=null&&list.size()>0){ System.out.println("数据库已包含此投资人...."+map.get("marketId")[0]+":"+map.get("seatNo")[0]); return;}
		addSql=" insert into TBL_BDPP_INVESTOR (ID, MARKET_CD, CK_ACCT, SEAT_NO, INV_TYPE, INV_NAME, EMAIL, COM_INSTRUMENT, ORG_CODE, TAX_CERTIF, CORP_REPRESENTIVE, CORP_CERTIF, TELEPHONE, CONTACTS, MOBILE, ADDRESS, IS_DEL, STATUS, CREATE_TIME, REMARK) values (SEQ_BDPP_INVESTOR.NEXTVAL,?,?,?,'02',?,?,?,?,?,?,?,?,?,?,?,0,0,sysdate,'') ";
		param= new String[]{map.get("marketId")[0],map.get("marAcctNo")[0],map.get("seatNo")[0],map.get("entName")[0],map.get("email")[0],map.get("busiLiceNo")[0],map.get("organCode")[0],
				map.get("taxRegCertNo")[0],map.get("legalName")[0],map.get("legalCardId")[0],map.get("telephone")[0],map.get("contactName")[0],map.get("contactPhone")[0],map.get("regAddr")[0]};
	}else if("10006".equals(map.get("busiCode")[0])){
		String selSql="select * from TBL_BDPP_INVESTOR where SYS_ACCT_NO=? ";
		ArrayList<String[]> list=maz.executeQuery(selSql, new String[]{map.get("acctNo")[0]});
		System.out.println((map.get("transTime")[0]).substring(0, 8));
		if(list!=null&&list.size()>0)
		addSql="insert into TBL_BDPP_TRANS_FLOW (ID, MARKET_CD,CK_ACCT, SEAT_NO, TRANS_TP,SUB_TRANS_TP,SERIAL_NO,TRANS_DT,TRANS_TIME,TRANS_AT,TRANS_CURR_CD,SYS_ACCT_NO,CHANNEL_TP, IS_DEL, STATUS, CREATE_TIME) values (SEQ_BDPP_TRANS_FLOW.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,0,?,sysdate) ";
		param= new String[]{map.get("marketId")[0],list.get(0)[4],list.get(0)[3],map.get("busiCode")[0],"01",map.get("serialNo")[0],(map.get("transTime")[0]).substring(0, 8),map.get("transTime")[0],
							map.get("transAmt")[0],"156",map.get("acctNo")[0],map.get("channelType")[0],"0"};
	}
	if(!"".equals(addSql))
	if(maz.execute(addSql, param)) System.out.println("插入数据成功...."+map.get("busiCode")[0]);
	else System.out.println("插入数据失败...."+map.get("busiCode")[0]);
}

%>
