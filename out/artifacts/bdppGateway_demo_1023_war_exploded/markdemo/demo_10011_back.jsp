<%--
  Created by IntelliJ IDEA.
  User: 不才
  Date: 2018/9/6
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="com.dao.Mazeo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    System.out.println("网银入金后台........");
    System.out.println("========================================");
    Map<String,String[]> map = request.getParameterMap();

    for(Entry<String,String[]> en:map.entrySet()){
        System.out.println(en.getKey()+":"+en.getValue()[0]);
    }
    Mazeo maz = new Mazeo();
    String transTime = map.get("transTime")[0];
    String seatNo = map.get("seatNo")[0];
    String serialNo = map.get("serialNo")[0];
    String transAmt = map.get("transAmt")[0];
    String respCode = map.get("respCode")[0];
    String respMsg = map.get("respMsg")[0];
/*
    String transTime = "20170614";
    String seatNo = "100065";
    String serialNo = "10006500";
    String transAmt = "100065";
    String respCode = "1000";
    String respMsg = "100065";
*/
    String addSql = "INSERT INTO TBL_BDPP_EBANKS_BACK (ID,TRANS_TIME,SEAT_NO,SERIAL_NO,TRANS_AMT,RESP_CODE,RESP_MSG) VALUES (SEQ_TBL_BDPP_EBANKS_BACK.NEXTVAL,?,?,?,?,?,?) ";
    String[] param = new String[]{transTime, seatNo, serialNo, transAmt, respCode, respMsg};
    Boolean f = maz.execute(addSql, param);
    if (f) {
        System.out.println(seatNo + "网银入金后台存入数据成功.....");
    } else {
        System.out.println(seatNo + "网银入金后台存入数据成功.....");
    }


%>
