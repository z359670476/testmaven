package com.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.commons.lang.time.DateFormatUtils;

import com.dao.Mazeo;
import com.enums.MarkEnum;

import net.sf.json.JSONArray;
import sun.security.util.Cache;

public class CacheManage {
    //第一个参数表示cache对象中允许添加的键值对数量，第二个参数表示缓存的时间，单位是秒
    @SuppressWarnings("rawtypes")
	private static Cache cache = Cache.newHardMemoryCache(0,3600 * 24 * 7);

    public static Object get(String key){
        return cache.get(key);
    }
    public static boolean hasKey(String key){
    	return cache.get(key)!=null;
    }
    @SuppressWarnings("unchecked")
	public static void set(String key,Object obj){
        cache.put(key, obj);
    }
    
    public static void setMartCache(){
    	Mazeo maz=new Mazeo();
    	String selSql="select * from TBL_BDPP_MARKET where MARKET_CD=?";
    	JSONArray arr=maz.executeQueryToJSON(selSql, new String[]{MarkEnum.MARKCODE.getValue()});
    	CacheManage.set("markInfo", arr);
    	try{
    		String time= arr.getJSONObject(0).getString("MUSTSIGNOUT_TIME");
    		String nowTime=DateFormatUtils.format(Calendar.getInstance().getTime(), "yyyy-MM-dd")+" "+time;;
    		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		Calendar calendar = Calendar.getInstance();
    		calendar.setTime(sdf.parse(nowTime));
    		CacheManage.set("mustSignOut", calendar);
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
    

}