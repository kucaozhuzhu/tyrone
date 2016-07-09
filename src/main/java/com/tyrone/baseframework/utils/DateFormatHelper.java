 package com.tyrone.baseframework.utils;
 
 import java.text.DateFormat;
 import java.text.SimpleDateFormat;
 import java.util.Calendar;
 import java.util.Date;
 
 
 
 
 
 
 public class DateFormatHelper
 {
   public static final String FORMAT_TIME_STR = "yyyy-MM-dd HH:mm:ss";
   public static final String FORMAT_DATE_STR = "yyyy-MM-dd";
   
   private DateFormatHelper() {}
   
   public static String getTimeStr(String formatStr, Date d)
   {
     DateFormat df = new SimpleDateFormat(formatStr);
     
     return df.format(d);
   }
   
   public static String getTimeStr(Date d) { return getTimeStr("yyyy-MM-dd HH:mm:ss", d); }
   
 
 
 
 
   public static String getNowTimeStr(String formatStr)
   {
     DateFormat df = new SimpleDateFormat(formatStr);
     
     return df.format(new Date());
   }
   
 
 
   public static String getNowTimeStr()
   {
     return getNowTimeStr("yyyy-MM-dd HH:mm:ss");
   }
   
 
 
   public static Date getDateBefore(Date d, int day)
   {
     Calendar now = Calendar.getInstance();
     now.setTime(d);
     now.set(5, now.get(5) - day);
     return now.getTime();
   }
   
 
 
   public static Date getDateAfter(Date d, int day)
   {
     Calendar now = Calendar.getInstance();
     now.setTime(d);
     now.set(5, now.get(5) + day);
     return now.getTime();
   }
   
   public static Date toDate(String sDate) {
     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     Date dt = null;
     try {
       dt = formatter.parse(sDate);
     } catch (Exception e) {
       e.printStackTrace();
       dt = null;
     }
     return dt;
   }
 }

/* Location:           D:\java\mavenresp\b2b2c\com\aebiz\baseframework\0.0.1\baseframework-0.0.1.jar
 * Qualified Name:     com.aebiz.b2b2c.baseframework.utils.DateFormatHelper
 * Java Class Version: 5 (49.0)
 * JD-Core Version:    0.7.0.1
 */