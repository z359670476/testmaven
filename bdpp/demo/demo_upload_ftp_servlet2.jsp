<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="com.demo.FTPdemo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String makeId="",date="",type="",stakeNum="";  
  
DiskFileItemFactory factory = new DiskFileItemFactory();  
//最大缓存  
factory.setSizeThreshold(5*1024);  
ServletFileUpload upload = new ServletFileUpload(factory);  
List<FileItem> items = upload.parseRequest(request);  
InputStream in=null;
for (FileItem item : items) {  
    if(!item.isFormField()){  
        String fileName = item.getName();  
        System.out.println(fileName);
        String fileEnd = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();  
        in= item.getInputStream();
        System.out.println(in);
    }else{
//     	System.out.println(item.getFieldName()+":"+item.getString("utf-8"));
    	if("makeId".equals(item.getFieldName())){
    		makeId=item.getString("utf-8");
    	}else if("type".equals(item.getFieldName())){
    		type=item.getString("utf-8");
    	}else if("date".equals(item.getFieldName())){
    		date=item.getString("utf-8");
    	}else if("stakeNum".equals(item.getFieldName())){
    		stakeNum=item.getString("utf-8");
    	}
    }
} 
FTPdemo ftp=new FTPdemo( makeId, makeId, makeId, date, type);
ftp.uploadFile(in, stakeNum);
out.println("{\"code\":0,\"msg\":\"成功！\"}");
  


%>