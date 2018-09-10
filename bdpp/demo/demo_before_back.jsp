<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
System.out.println("前台........。。。。。。。。。。。。。。。。");
System.out.println("***********************************************");
Map<String,String[]> map = request.getParameterMap();

for(Entry<String,String[]> en:map.entrySet()){
	System.out.println(en.getKey()+":"+en.getValue()[0]);
}

%>