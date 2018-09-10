package com.dao;

import java.util.ArrayList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class FenYe {

	private int totalRow; // 总记录数
	private int totalPage; // 总页数
	private int pageNow = 1; // 当前页码，从1计起
	private int pageSize; // 每页记录数
	private Mazeo dbOper;
	private String sql; // 查询语句
	private String[] pType;
	private String[] pArray;

	public FenYe(String sql, String[] pArray, int pageSize) {
		this.setSql(sql);
		this.setPType(pType);
		this.setPArray(pArray);
		this.setPageSize(pageSize);
		dbOper = new Mazeo();
		String totalSql = "select count(1) from (" + sql + ") fenyeTable";
		ArrayList<String[]> tmpList = dbOper.executeQuery(totalSql,  pArray);
		if(tmpList!=null&&tmpList.size()>0){
			this.setTotalRow(Integer.parseInt((tmpList.get(0))[0])); // 设置总行数
		}else{
			System.out.println(sql);
			System.out.println("sql查不到数据或系统异常");
		}
		this.setTotalPage(); // 计算总页数

	}
	
	public FenYe(String sql, String[] pArray, int pageSize ,int pageNow) {
		this.setSql(sql);
		this.setPType(pType);
		this.setPArray(pArray);
		this.setPageSize(pageSize);
		this.setPageNow(pageNow);
		dbOper = new Mazeo();
		String totalSql = "select count(1) from (" + sql + ") fenyeTable";
		ArrayList<String[]> tmpList = dbOper.executeQuery(totalSql,  pArray);
		if(tmpList!=null&&tmpList.size()>0){
			this.setTotalRow(Integer.parseInt((tmpList.get(0))[0])); // 设置总行数
		}else{
			System.out.println(sql);
			System.out.println("sql查不到数据或系统异常");
		}
		this.setTotalPage(); // 计算总页数
		
	}

	/**
	 * 取得下一页内容
	 * 
	 * 
	 * @return 下页内容的列表
	 */
	public ArrayList<String[]> getNextPage() {

		if (pageNow > totalPage)
			return null;
		int startIndex = (pageNow - 1) * pageSize + 1;
		int endIndex = 0;
		if (pageNow == totalPage)
			endIndex = totalRow;
		else
			endIndex = pageNow * pageSize;
		StringBuffer fenyeSql = new StringBuffer(" SELECT * FROM ( ");
		fenyeSql.append(" SELECT temp.* ,ROWNUM num FROM ( ");
		fenyeSql.append(sql);
		fenyeSql.append("  ) temp where ROWNUM <= " + endIndex);
		fenyeSql.append(" ) WHERE  num >= " + startIndex);
//		StringBuffer fenyeSql = new StringBuffer(" SELECT * FROM ( ");
//		fenyeSql.append(sql);
//		fenyeSql.append(")fenyeTable limit "+startIndex--+","+pageSize);
		ArrayList<String[]> list = dbOper.executeQuery(fenyeSql.toString(), pArray);
		pageNow++;
		return list;
	}
	
	/**
	 * 取得下一页内容
	 *  totalRow：  总条数；
	 *	totalPage： 总页数；
	 *	pageNow： 当前页码；
	 *	pageSize： 每页显示条数；
	 * @return 下页内容的JsonObject
	 */
	public JSONObject getNextPageJson() {
		JSONObject jObject=new JSONObject();
		if (pageNow > totalPage){
			jObject.put("page", "[]");
		}
		int startIndex = (pageNow - 1) * pageSize + 1;
		int endIndex = 0;
		if (pageNow == totalPage)
			endIndex = totalRow;
		else
			endIndex = pageNow * pageSize;
		StringBuffer fenyeSql = new StringBuffer(" SELECT * FROM ( ");
		fenyeSql.append(" SELECT temp.* ,ROWNUM num FROM ( ");
		fenyeSql.append(sql);
		fenyeSql.append("  ) temp where ROWNUM <= " + endIndex);
		fenyeSql.append(" ) WHERE  num >= " + startIndex);
//		StringBuffer fenyeSql = new StringBuffer(" SELECT * FROM ( ");
//		fenyeSql.append(sql);
//		fenyeSql.append(")fenyeTable  limit "+(startIndex-1)+","+pageSize);
		JSONArray jArray = dbOper.executeQueryToJSON(fenyeSql.toString(), pArray);
		pageNow++;
		jObject.put("code", 0);
		jObject.put("msg", "成功");
		jObject.put("count", totalRow);
		jObject.put("data", jArray);
//		jObject.put("totalPage", totalPage);
//		jObject.put("pageNow", pageNow);
//		jObject.put("pageSize", pageSize);
		return jObject;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage() {

		if (totalRow % pageSize == 0)
			totalPage = totalRow / pageSize;
		else
			totalPage = totalRow / pageSize + 1;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public String[] getPType() {
		return pType;
	}

	public void setPType(String[] pType) {
		this.pType = pType;
	}

	public String[] getPArray() {
		return pArray;
	}

	public void setPArray(String[] pArray) {
		this.pArray = pArray;
	}

	public boolean hasNext() {
		return totalPage-pageNow+1>0;
	}
}
