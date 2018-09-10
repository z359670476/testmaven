<%@page import="com.util.ApacheHttpClientUtil"%>
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
	respMap.put(en.getKey(), en.getValue()[0]);
}

String url="";
if("10005".equals(request.getParameter ("busiCode"))){
	url="http://101.231.114.246:8080/interface/market/backQuery.do";
}else if("10007".equals(request.getParameter("busiCode"))){
	url="http://101.231.114.246:8080/interface/market/comB2BQuery.do";
}else if ("10010".equals(request.getParameter("busiCode"))){
	url="http://101.231.114.246:8080/interface/market/unBindCard.do";
}

PublicKeyUtil keyUtil=new PublicKeyUtil();
respMap= keyUtil.signByRSA(respMap);
String responseText = ApacheHttpClientUtil.HttpPostMap(url, respMap,"utf-8");

System.out.println("返回报文为："+responseText);

// System.out.println(respMap.get("signature"));
// System.out.println("**************");
// keyUtil.validateByRSA(respMap);
out.print("{\"signature\":\""+respMap.get("signature")+"\",\"responseText\":\""+responseText+"\",\"requestText\":\""+getUrlParamsByMap(respMap)+"\"}" );

%>
<%!
public String getUrlParamsByMap(Map<String, String> map) {  
    if (map == null) {  
        return "";  
    }  
    StringBuffer sb = new StringBuffer();  
    for (Map.Entry<String, String> entry : map.entrySet()) {  
        sb.append(entry.getKey() + "=" + entry.getValue());  
        sb.append("&");  
    }  
    String s = sb.toString();  
    if (s.endsWith("&")) {  
        s = org.apache.commons.lang.StringUtils.substringBeforeLast(s, "&");  
    }  
    return s;  
}
%>