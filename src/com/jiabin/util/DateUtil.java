package com.jiabin.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

	public static String formatDate(Date date,String format){
		String result="";
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		if(date!=null){
			result=sdf.format(date);
		}
		return result;
	}
	
	
	public static Date formatString(String str,String format) throws Exception{
		if(StringUtil.isEmpty(str)){
			return null;
		}
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		return sdf.parse(str);
	}
	
	public static String getCurrentDateStr()throws Exception{
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		return sdf.format(date);
	}
	
	public static String getCurrentQuarter(){
		Calendar calendar=Calendar.getInstance();
		//calendar.setTime(new Date());
		String year=calendar.get(Calendar.YEAR)+"";
		String quarter="";
		switch (calendar.get(Calendar.MONTH)) {
			case 0:
			case 1:
			case 2:quarter="1";break;
			case 3:
			case 4:
			case 5:quarter="2";break;
			case 6:
			case 7:
			case 8:quarter="3";break;
			case 9:
			case 10:
			case 11:quarter="4";break;
			default:
				break;
		}
		return year+"-"+quarter;
	}
	
	public static boolean isRun(){
		Calendar calendar=Calendar.getInstance();
		Integer year=calendar.get(Calendar.YEAR);
		return ((year%4==0)&&(year%100)!=0)||year%400==0;
	}
}
