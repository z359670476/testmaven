package com.util;

import java.util.Date;
import java.util.Random;

import org.apache.commons.lang.time.DateFormatUtils;

public class BDDateUtil {
	
	public static String getCurrentDateyyyyMMdd(){
		return DateFormatUtils.format(new Date(), "yyyyMMdd");
	}
	
	public static String getCurrentDateTimeHHmmss(){
		return DateFormatUtils.format(new Date(), "HHmmss");
	}
	
	public static String getCurrentDateFtSeq(){
		Random r=new Random();
		int sum=r.nextInt(1000000);
		return DateFormatUtils.format(new Date(), "yyyyMMddHHmmss")+""+sum;
	}
	
}
