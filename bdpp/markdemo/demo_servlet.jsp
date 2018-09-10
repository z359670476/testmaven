<%@page import="org.apache.commons.lang.time.DateFormatUtils"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.util.CacheManage"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.enums.MarkEnum"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.dao.FenYe"%>
<%@page import="com.dao.Mazeo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String method = request.getParameter("method");
Mazeo maz=new Mazeo();
if("selFlow".equals(method)){
	String pages=request.getParameter("page");
	String limit=request.getParameter("limit");
	String selSql="select f.*,i.INV_NAME from TBL_BDPP_TRANS_FLOW f left join TBL_BDPP_INVESTOR i on f.MARKET_CD = i.MARKET_CD and f.SEAT_NO = i.SEAT_NO where f.MARKET_CD=?  and f.IS_DEL != 1 order by f.ID desc ";
	FenYe fy=new FenYe(selSql,new String[]{MarkEnum.MARKCODE.getValue()},Integer.parseInt(StringUtils.isBlank(limit)?"10":limit),Integer.parseInt(pages));
	out.println( fy.getNextPageJson());
}
else if("eBanksBack".equals(method)){
	String pages=request.getParameter("page");
	String limit=request.getParameter("limit");
	String selSql="select * from TBL_BDPP_EBANKS_BACK ";
	FenYe fy=new FenYe(selSql,new String[]{},Integer.parseInt(StringUtils.isBlank(limit)?"10":limit),Integer.parseInt(pages));
	out.println( fy.getNextPageJson());
}
else if("basic".equals(method)){
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
	JSONArray arr= null;
	if(!CacheManage.hasKey("markInfo")){
		CacheManage. setMartCache();
	}
	arr=(JSONArray)CacheManage.get("markInfo");
	if( arr.size()>0&&!StringUtils.isBlank(arr.getJSONObject(0).getString("SIGN_TIME")))
	if(!(format.format(new Date())).equals(arr.getJSONObject(0).getString("SIGN_TIME").split(" ")[0])){
		String updSql = "update TBL_BDPP_MARKET set MARK_STATUS=0,CLEARING_STATUS=0";
		if(maz.execute(updSql, new String[] {}))
			CacheManage. setMartCache();
	}
	out.println(arr);
}else if("updRuleDemo".equals(method)){
	String value=request.getParameter("value");
	String updSql = "update TBL_BDPP_MARKET set RULE_DEMO=? where MARKET_CD=? and RULE_DEMO!=?";
	boolean ret= maz.execute(updSql, new String[]{value,MarkEnum.MARKCODE.getValue(),value});
	if(ret)CacheManage. setMartCache();
	JSONObject obj=new JSONObject();
	obj.put("ret", ret);
	out.println(obj);
}else if("isCRJ".equals(method)){
	JSONArray  arr=(JSONArray)CacheManage.get("markInfo");
	if("0".equals( arr.getJSONObject(0).getString("RULE_DEMO")) ){
		out.println("{\"ret\":"+true+"}");
		return;
	}
	if("1".equals( arr.getJSONObject(0).getString("MARK_STATUS"))){
		out.println("{\"ret\":"+!Calendar.getInstance().after (CacheManage.get("mustSignOut"))+",\"msg\":\"普通模式已过强制签退时间\"}");
		return;
	}
	out.println("{\"ret\":"+false+",\"msg\":\"普通模式未签到\"}");
}


%>
