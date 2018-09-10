package com.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
/**
 * socket客户端工具类
 * @author like
 */
public class SockedClientUtil {
	/**
	 * 连接socket服务器返回数据接口方法
	 * @param host IP
	 * @param port 端口号
	 * @param xmlString 推送数据字符串
	 * @return String 返回数据字符串
	 * @throws IOException
	 */
	public String ConnectScoket(String host,int port,String xmlString ) throws IOException{
		Socket socket = new Socket(host, port);
		socket.setSoTimeout(90000);
		//流 输出流字符流
		OutputStream outs=socket.getOutputStream();
		System.out.println("发送的数据="+xmlString);
		outs.write(xmlString.getBytes("utf-8")); 
		outs.flush();
		//接收服务器返回数据
		InputStream ins=socket.getInputStream();
		BufferedReader reader=new BufferedReader(new InputStreamReader(ins));
	    String s=reader.readLine();
	    System.out.println("接到服务器回复："+new String(s.getBytes(), "UTF-8"));
	    socket.close();
	    return s;
	}

}
