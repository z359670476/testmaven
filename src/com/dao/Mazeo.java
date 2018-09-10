package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * dao层与数据库交互工具类
 * @author like
 *
 */
public class Mazeo{
	public Connection con=null;
	public PreparedStatement pstmt=null;
	public ResultSet rSet=null;
	
	
	/**
	 * 创建数据源链接
	 * @return
	 */
	private  Connection creteConnection() {
		ReadXml rdxml = new ReadXml(getDirPath()+"conn.xml");
		Connection con=null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		
			con = DriverManager.getConnection(rdxml.getSConnStr(),rdxml.getUsername(),rdxml.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return con;
	}
	
	/**
	 * 查询方法
	 * @param sql sql查询语句
	 * @param param sql中替换占位符字段数组
	 * @return
	 */
	public ArrayList<String[]> executeQuery(String sql,String[] param) {
			ArrayList<String[]> list=null;
			try {
			
				con=creteConnection();
				pstmt=(PreparedStatement) con.prepareStatement(sql);
				if (param!=null) {
					for (int i=0;i<param.length;i++) {
						pstmt.setObject(i+1, StringUtils.isBlank(param[i])?null:param[i]);
					}
				}
				rSet=pstmt.executeQuery();
				list = new ArrayList<String[]>();
				while (rSet.next()) {
					String str[]=new String[rSet.getMetaData().getColumnCount()];
					for(int i=0;i<rSet.getMetaData().getColumnCount();i++){
						str[i]=rSet.getString(i+1);
					}
					list.add(str);
				}
				closeAll();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return list;
	}
	
	
	/**
	 * 查询方法返回JSON格式
	 * @param sql sql执行语句
	 * @param param  sql中替换占位符字段数组
	 * @return
	 */
	public JSONArray executeQueryToJSON(String sql,String[] param) {
		JSONArray jArray = new JSONArray();
		try {
			con=creteConnection();
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			if (param!=null) {
				for (int i=0;i<param.length;i++) {
					pstmt.setObject(i+1, StringUtils.isBlank(param[i])?null:param[i]);
				}
			}
			rSet=pstmt.executeQuery();
			ResultSetMetaData rmd = rSet.getMetaData();
			int count = rmd.getColumnCount();
			String[] clumName=new String[count];
			for(int i=0;i<count;i++){
				clumName[i]=rmd.getColumnLabel(i+1);
			}
			JSONObject jObject = new JSONObject();
			while (rSet.next()) {
				for(int i=0;i<count;i++){
					jObject.put(clumName[i], rSet.getString(clumName[i])==null?"":rSet.getString(clumName[i]));
				}
				jArray.add(jObject);
				jObject.clear();
			}
			closeAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return jArray;
	}
	
	
	
	/**
	 * 修改插入数据执行的方法
	 * @param sql sql执行语句
	 * @param param sql中替换占位符字段数组
	 * @return
	 */
	public boolean execute(String sql,Object param[]){
		 int rows=0;
		try {
			con=creteConnection();
			 pstmt=(PreparedStatement) con.prepareStatement(sql);
			 if(param!=null){
				 for(int i=0;i<param.length;i++){
					 pstmt.setObject(i+1, param[i]);
				 }
			 }
			 rows = pstmt.executeUpdate();
			 closeAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return rows>0?true:false;	 
	}
	
	
	
	/**
	 * 关闭数据源
	 */
	public   void closeAll(){
		 try {
			if(rSet!=null){
				rSet.close();rSet=null;
			 }
			
			if(pstmt!=null){
				pstmt.close();pstmt=null;
			 }
			
			if(con!=null&&!con.isClosed()){
				con.close();con=null;
			 }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取 根目录
	 * @return
	 */
	private static String getDirPath() {
		String dirpath="";
		try {
			dirpath = Thread.currentThread().getContextClassLoader().getResource("/").getPath().replace("classes/","");
		} catch (Exception e1) {
			dirpath = System.getProperty("user.dir")+"/bdpp/WEB-INF/";
		} 
		return dirpath;
	}
	
}
