<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.dao.FenYe"%>
<%@page import="com.dao.Mazeo"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String method = request.getParameter("method");
	Mazeo maz=new Mazeo();
	/*if("queryBuyList".equals(method)){
		String pages=request.getParameter("page");
		String limit=request.getParameter("limit");
		String selSql="SELECT S.*,I.INV_NAME FROM TBL_BDPP_DEAL_BUY S left join TBL_BDPP_INVESTOR I on S.INVESTOR_ID = I.ID where S.IS_DEL!=1 ORDER BY S.ID DESC";
		FenYe fy=new FenYe(selSql,null,Integer.parseInt(StringUtils.isBlank(limit)?"10":limit),Integer.parseInt(pages));
		out.println( fy.getNextPageJson());
	}else */if("addBuy".equals(method)){
		String MARKET_CD=request.getParameter("MARKET_CD");
		String BUY_SEAT_NO=request.getParameter("BUY_SEAT_NO");
		String BUY_INVESTOR_ID=request.getParameter("BUY_INVESTOR_ID");
		String BUY_SYS_ACCT_NO=request.getParameter("BUY_SYS_ACCT_NO");

		String SELL_SEAT_NO=request.getParameter("SELL_SEAT_NO");
		String SELL_INVESTOR_ID=request.getParameter("SELL_INVESTOR_ID");
		String SELL_SYS_ACCT_NO=request.getParameter("SELL_SYS_ACCT_NO");
		String SUBJECT_NAME=request.getParameter("SUBJECT_NAME");
		String TRANS_AT=request.getParameter("TRANS_AT");
		String SERVICE_FEE  =request.getParameter("SERVICE_FEE");
		String STATUS="0";
		String REMARK=request.getParameter("REMARK");
		//新增买交易
		String addBuySql="insert into TBL_BDPP_DEAL_BUY(ID,MARKET_CD,SEAT_NO，INVESTOR_ID,SYS_ACCT_NO,SUBJECT_NAME,TRANS_AT,SERVICE_FEE,STATUS,REMARK,IS_DEL,CREATE_TIME) values(SEQ_BDPP_DEAL_BUY.Nextval,?,?,?,?,?,?,?,?,?,0,sysdate )";
		boolean BuyRet=maz.execute(addBuySql, new String[]{MARKET_CD,BUY_SEAT_NO,BUY_INVESTOR_ID,BUY_SYS_ACCT_NO,SUBJECT_NAME,TRANS_AT,SERVICE_FEE,STATUS,REMARK});
		//新增卖交易
		String addSellSql="insert into TBL_BDPP_DEAL_SELL(ID,MARKET_CD,SEAT_NO，INVESTOR_ID,SYS_ACCT_NO,SUBJECT_NAME,TRANS_AT,SERVICE_FEE,STATUS,REMARK,IS_DEL,CREATE_TIME) values(SEQ_BDPP_DEAL_SELL.Nextval,?,?,?,?,?,?,?,?,?,0,sysdate )";
		boolean SellRet=maz.execute(addSellSql, new String[]{MARKET_CD,SELL_SEAT_NO,SELL_INVESTOR_ID,SELL_SYS_ACCT_NO,SUBJECT_NAME,TRANS_AT,SERVICE_FEE,STATUS,REMARK});
		out.println("{\"BuyRet\":"+BuyRet+",\"SellRet\":"+SellRet+"}");
	}/*else if("delBuy".equals(method)){
		String ID=request.getParameter("ID");
		String delSql="update TBL_BDPP_DEAL_BUY set IS_DEL=1,UPDATE_TIME=sysdate where ID=? and IS_DEL=0";
		boolean ret=maz.execute(delSql, new String[]{ID});
		out.println("{\"ret\":"+ret+"}");
	}else if("updBuy".equals(method)){
		String ID=request.getParameter("ID");
		String MARKET_CD=request.getParameter("MARKET_CD");
		String SEAT_NO=request.getParameter("SEAT_NO");
		String INVESTOR_ID=request.getParameter("INVESTOR_ID");
		String SYS_ACCT_NO=request.getParameter("SYS_ACCT_NO");
		String SUBJECT_NAME=request.getParameter("SUBJECT_NAME");
		String TRANS_AT=request.getParameter("TRANS_AT");
		String SERVICE_FEE  =request.getParameter("SERVICE_FEE");
		String STATUS=request.getParameter("STATUS");
		STATUS="on".equals(STATUS)?"0":"1";
		String REMARK=request.getParameter("REMARK");
		String updSql="update TBL_BDPP_DEAL_BUY set MARKET_CD=?,SEAT_NO=?,INVESTOR_ID=?,SYS_ACCT_NO=?,SUBJECT_NAME=?,TRANS_AT=?,SERVICE_FEE=?,STATUS=?,REMARK=?,UPDATE_TIME=sysdate where ID=?";
		boolean ret=maz.execute(updSql, new String[]{MARKET_CD,SEAT_NO,INVESTOR_ID,SYS_ACCT_NO,SUBJECT_NAME,TRANS_AT,SERVICE_FEE,STATUS,REMARK,ID});
		if(ret){
			String selSql="select * from TBL_BDPP_DEAL_BUY where IS_DEL!=1 and ID=?";
			JSONArray arr=maz.executeQueryToJSON(selSql,new String[]{ID});
			if(arr.size()>0){
				out.println("{\"ret\":"+ret+",\"obj\":"+arr.getJSONObject(0)+"}");
				return;
			}
		}
		out.println("{\"ret\":"+ret+"}");
	}*/else  if("initModel".equals(method)){//初始化投资人列表
		String investId = request.getParameter("investId");
		String marketId = request.getParameter("marketId");
		String investorSql="select T.ID,T.SEAT_NO,T.SYS_ACCT_NO,T.INV_NAME from TBL_BDPP_INVESTOR T where T.IS_DEL!=1 and MARKET_CD = '"+ marketId +"' and ID != ' "+ investId +" 'order by T.ID desc";
		JSONArray investorArr=maz.executeQueryToJSON(investorSql,null);
		out.println("{\"investorObj\":"+investorArr+"}");
	}
	
%>
