package com.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.HttpClientUtils;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

/* 
 * 利用HttpClient进行post请求的工具类 
 */
@SuppressWarnings("deprecation")
public class ApacheHttpClientUtil {
	/**
	 * HttpClient post 请求的方法
	 * @param url 请求地址
	 * @param data 推送字符串
	 * @return String 返回值
	 */
	public static String HttpPostSting(String url, String data) {
		String returnValue = "这是默认返回值，接口调用失败";
		HttpClient httpClient = null;  
		ResponseHandler<String> responseHandler = new BasicResponseHandler();
		try {
			// 第一步：创建HttpClient对象
			httpClient = HttpClients.createDefault();

			// 第二步：创建httpPost对象
			HttpPost httpPost = new HttpPost(url);

			// 第三步：给httpPost设置参数
			StringEntity requestEntity = new StringEntity(data, "utf-8");
			requestEntity.setContentEncoding("UTF-8");
			httpPost.setHeader("Content-type", "application/x-www-form-urlencoded");
			httpPost.setEntity(requestEntity);

			// 第四步：发送HttpPost请求，获取返回值
			returnValue = httpClient.execute(httpPost, responseHandler); // 调接口获取返回值时，必须用此方法
			// CloseableHttpResponse httpResonse = httpClient.execute(httpPost);
			// int statusCode = httpResonse.getStatusLine().getStatusCode();
			// if(statusCode!=200)
			// {
			// System.out.println("请求发送失败，失败的返回参数为："+httpResonse.getStatusLine());
			// returnValue = httpResonse.getStatusLine().toString();
			// }
			//

		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			HttpClientUtils.closeQuietly(httpClient);
		}
		// 第五步：处理返回值
		return returnValue;
	}
	
	/**
	 * HttpClient post 请求的方法
	 * @param url 请求地址
	 * @param map 推送参数
	 * @param charset 推送参数编码格式
	 * @return String 返回值
	 */
	 public static String HttpPostMap(String url,Map<String,String> map,String charset){  
	        HttpClient httpClient = null;  
	        HttpPost httpPost = null;  
	        String result = null;
	        try{
	        	httpClient =  HttpClients.createDefault();
	            httpPost = new HttpPost(url);  
	            //设置参数  
	            List<NameValuePair> list = new ArrayList<NameValuePair>();  
	            Iterator iterator = map.entrySet().iterator();  
	            while(iterator.hasNext()){
	                Entry<String,String> elem = (Entry<String, String>) iterator.next();  
	                list.add(new BasicNameValuePair(elem.getKey(),elem.getValue()));  
	            }
	            if(list.size() > 0){  
	                UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list,charset);  
	                httpPost.setEntity(entity);  
	                HttpResponse response = httpClient.execute(httpPost);  
		            if(response != null){  
		                HttpEntity resEntity = response.getEntity();  
		                if(resEntity != null){  
		                    result = EntityUtils.toString(resEntity,charset);  
		                }  
		            }  
	            }  
	           
	        }catch(Exception ex){  
	            ex.printStackTrace();  
	        }  
	        return result;  
	    }  
	
	
}
