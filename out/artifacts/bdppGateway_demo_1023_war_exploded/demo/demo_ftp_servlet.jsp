<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@page import="com.demo.FTPdemo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String action = request.getParameter("action");
Map<String,String[]> map = request.getParameterMap();

for(Entry<String,String[]> en:map.entrySet()){
	System.out.println(en.getKey()+":"+en.getValue()[0]);
}
if("isexis".equals(action)){
	String urld= Thread.currentThread().getContextClassLoader().getResource("/").getPath().replace("classes/","upload");
	String fileName=request.getParameter("name") ;//"B_100019_DTL01_20171031_0001.txt.gz";
	File file = new File(urld+File.separator+fileName);  
    /* 如果文件存在 */  
    if (file.exists()) {
    	out.println("文件存在");
    }else{
    	out.println("文件不存在");
    }
}else if("down".equals(action)){
	String makeId = request.getParameter("makeId");
	String date = request.getParameter("date");
	String type = request.getParameter("type");
	FTPdemo ftp=new FTPdemo( makeId, makeId, makeId, date, type);
	String urld= Thread.currentThread().getContextClassLoader().getResource("/").getPath().replace("classes/","upload");
	System.out.println(urld);
	ftp.downFile(urld);
	String fileName="B_"+makeId+"_"+type+"_"+date+"_0001.txt.gz";
	out.println("{\"code\":0,\"msg\":\"成功！\",\"name\":\""+fileName+"\"}");
}else if("downs".equals(action)){
	String urld= Thread.currentThread().getContextClassLoader().getResource("/").getPath().replace("classes/","upload");
	String fileName=request.getParameter("name") ;//"B_100019_DTL01_20171031_0001.txt.gz";
	File file = new File(urld+File.separator+fileName);  
    /* 如果文件存在 */  
    if (file.exists()) {  
        String disName = URLEncoder.encode( fileName, "UTF-8");  
        response.reset();  
        response.setContentType("application/x-msdownload");  
        response.addHeader("Content-Disposition",  
                "attachment; filename=\"" + disName + "\"");  
        int fileLength = (int) file.length();  
        response.setContentLength(fileLength);  
        /* 如果文件长度大于0 */  
        if (fileLength != 0) {  
            /* 创建输入流 */  
            InputStream inStream = new FileInputStream(file);  
            byte[] buf = new byte[4096];  
            /* 创建输出流 */  
            ServletOutputStream servletOS = response.getOutputStream();  
            int readLength;  
            while (((readLength = inStream.read(buf)) != -1)) {  
                servletOS.write(buf, 0, readLength);  
            }  
            inStream.close();  
            servletOS.flush();  
            servletOS.close();  
        }  
    }  
    out.clear();
    out = pageContext.pushBody();
}else if("upload".equals(action)){
	String makeId = request.getParameter("makeId");
	String date = request.getParameter("date");
	String type = request.getParameter("type");
	String file = request.getParameter("file");
	String stakeNum = request.getParameter("stakeNum");
	
	File f=new File(file);
	System.out.println(f.exists());
	File f2=new File("D:"+File.separator+"ftp"+File.separator+"F_100019_STL01_20170615_0001.txt.gz");
	System.out.println(f2.exists());
	
// 	FTPdemo ftp=new FTPdemo( makeId, makeId, makeId, date, type);
// 	ftp.uploadFile(file, stakeNum);
// 	ftp.uploadFile("D:"+File.separator+"ftp"+File.separator+"F_100019_STL01_20170615_0001.txt.gz", stakeNum);
	out.println("{\"code\":0,\"msg\":\"成功！\"}");
}


%>