<%@page import="com.enums.MarkEnum"%>
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

	if("selMark".equals(method)){
		String pages=request.getParameter("page");
		String limit=request.getParameter("limit");
		String selSql="select * from TBL_BDPP_MARKET where IS_DEL!=1 order by ID desc";
		FenYe fy=new FenYe(selSql,null,Integer.parseInt(StringUtils.isBlank(limit)?"10":limit),Integer.parseInt(pages));
		out.println( fy.getNextPageJson());
	}else if("addMark".equals(method)){
		String MARKET_CD=request.getParameter("MARKET_CD");
		String MARKET_NM=request.getParameter("MARKET_NM");
		String CK_ACCT=request.getParameter("CK_ACCT");
		String SY_ACCT=request.getParameter("SY_ACCT");
		String ZC_ACCT=request.getParameter("ZC_ACCT");
		String STATUS=request.getParameter("STATUS");
		STATUS="on".equals(STATUS)?"0":"1";
		String REMARK=request.getParameter("REMARK");
		String addSql="insert into TBL_BDPP_MARKET(ID,MARKET_CD,MARKET_NM,CK_ACCT,SY_ACCT,ZC_ACCT,STATUS,REMARK,IS_DEL,CREATE_TIME) values(SEQ_BDPP_MARKET.Nextval,?,?,?,?,?,?,?,0,sysdate )";
		boolean ret=maz.execute(addSql, new String[]{MARKET_CD,MARKET_NM,CK_ACCT,SY_ACCT,ZC_ACCT,STATUS,REMARK});
		out.println("{\"ret\":"+ret+"}");
	}else if("delMark".equals(method)){
		String ID=request.getParameter("ID");
		String delSql="update TBL_BDPP_MARKET set IS_DEL=1,UPDATE_TIME=sysdate where ID=? and IS_DEL=0";
		boolean ret=maz.execute(delSql, new String[]{ID});
		out.println("{\"ret\":"+ret+"}");
	}else if("updMark".equals(method)){
		String ID=request.getParameter("ID");
		String MARKET_CD=request.getParameter("MARKET_CD");
		String MARKET_NM=request.getParameter("MARKET_NM");
		String CK_ACCT=request.getParameter("CK_ACCT");
		String SY_ACCT=request.getParameter("SY_ACCT");
		String ZC_ACCT=request.getParameter("ZC_ACCT");
		String STATUS=request.getParameter("STATUS");
		STATUS="on".equals(STATUS)?"0":"1";
		String REMARK=request.getParameter("REMARK");
		String updSql="update TBL_BDPP_MARKET set MARKET_CD=?,MARKET_NM=?,CK_ACCT=?,SY_ACCT=?,ZC_ACCT=?,STATUS=?,REMARK=?,UPDATE_TIME=sysdate where ID=?";
		boolean ret=maz.execute(updSql, new String[]{MARKET_CD,MARKET_NM,CK_ACCT,SY_ACCT,ZC_ACCT,STATUS,REMARK,ID});
		if(ret){
			String selSql="select * from TBL_BDPP_MARKET where IS_DEL!=1 and ID=?";
			JSONArray arr=maz.executeQueryToJSON(selSql,new String[]{ID});
			if(arr.size()>0){
				out.println("{\"ret\":"+ret+",\"obj\":"+arr.getJSONObject(0)+"}");
				return;
			}
		}
		out.println("{\"ret\":"+ret+"}");
	}else if("selBalance".equals(method)){
		String pages=request.getParameter("page");
		String limit=request.getParameter("limit");
		String selSql="select * from TBL_BDPP_BALANCE where IS_DEL!=1 order by ID desc";
		FenYe fy=new FenYe(selSql,null,Integer.parseInt(StringUtils.isBlank(limit)?"10":limit),Integer.parseInt(pages));
		out.println( fy.getNextPageJson());
	}else if("delBalance".equals(method)){
		String ID=request.getParameter("ID");
		String delSql="update TBL_BDPP_BALANCE set IS_DEL=1,UPDATE_TIME=sysdate where ID=? and IS_DEL=0";
		boolean ret=maz.execute(delSql, new String[]{ID});
		out.println("{\"ret\":"+ret+"}");
	}else if("selInvestor".equals(method)){
		String pages=request.getParameter("page");
		String limit=request.getParameter("limit");
		String selSql="select * from TBL_BDPP_INVESTOR where IS_DEL!=1 and market_cd=? order by ID desc";
		FenYe fy=new FenYe(selSql,new String[]{MarkEnum.MARKCODE.getValue()},Integer.parseInt(StringUtils.isBlank(limit)?"10":limit),Integer.parseInt(pages));
		out.println( fy.getNextPageJson());
	}else if("delInvestor".equals(method)){
		String ID=request.getParameter("ID");
		String delSql="update TBL_BDPP_INVESTOR set IS_DEL=1,UPDATE_TIME=sysdate where ID=? and IS_DEL=0";
		boolean ret=maz.execute(delSql, new String[]{ID});
		out.println("{\"ret\":"+ret+"}");
	}else if("selFlow".equals(method)){
		String pages=request.getParameter("page");
		String limit=request.getParameter("limit");
		String selSql="select f.*,i.INV_NAME from TBL_BDPP_TRANS_FLOW f left join TBL_BDPP_INVESTOR i on f.MARKET_CD = i.MARKET_CD and f.SEAT_NO = i.SEAT_NO where f.IS_DEL != 1 order by f.ID desc";
		FenYe fy=new FenYe(selSql,null,Integer.parseInt(StringUtils.isBlank(limit)?"10":limit),Integer.parseInt(pages));
		out.println( fy.getNextPageJson());
	}else if("delFlow".equals(method)){
		String ID=request.getParameter("ID");
		String delSql="update TBL_BDPP_TRANS_FLOW set IS_DEL=1,UPDATE_TIME=sysdate where ID=? and IS_DEL=0";
		boolean ret=maz.execute(delSql, new String[]{ID});
		out.println("{\"ret\":"+ret+"}");
	}else if("updInv".equals(method)){
		String ID=request.getParameter("ID");
		String SYS_ACCT_NO=request.getParameter("SYS_ACCT_NO");
		String STATUS=request.getParameter("STATUS");
		String updSql="update TBL_BDPP_INVESTOR set SYS_ACCT_NO=?,STATUS=?,UPDATE_TIME=sysdate where ID=?";
		boolean ret=maz.execute(updSql, new String[]{SYS_ACCT_NO,STATUS,ID});
		if(ret){
			String selSql="select * from TBL_BDPP_INVESTOR where IS_DEL!=1 and ID=?";
			JSONArray arr=maz.executeQueryToJSON(selSql,new String[]{ID});
			if(arr.size()>0){
				out.println("{\"ret\":"+ret+",\"obj\":"+arr.getJSONObject(0)+"}");
				return;
			}
		}
		out.println("{\"ret\":"+ret+"}");
	}else if("updFlow".equals(method)){
		String ID=request.getParameter("ID");
		String STATUS=request.getParameter("STATUS");
		String updSql="update TBL_BDPP_TRANS_FLOW set STATUS=?,UPDATE_TIME=sysdate where ID=?";
		boolean ret=maz.execute(updSql, new String[]{STATUS,ID});
		if(ret){
			String selSql="select * from TBL_BDPP_TRANS_FLOW where IS_DEL!=1 and ID=?";
			JSONArray arr=maz.executeQueryToJSON(selSql,new String[]{ID});
			if(arr.size()>0){
				out.println("{\"ret\":"+ret+",\"obj\":"+arr.getJSONObject(0)+"}");
				return;
			}
		}
		out.println("{\"ret\":"+ret+"}");
	}
	
%>
