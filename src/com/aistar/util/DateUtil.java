package com.aistar.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 该类时日期工具类，提供了字符串与日期的相互转换，获得日期的年份 月份 日期 小时 分钟 秒等功能
 */
public class DateUtil {
    /**
     * 日期的格式，精确到年月日 时分秒
     */
    public static final String DATE_TIME_PATTERN="yyyy/MM/dd hh:mm:ss";
    /**
     * 日期的格式，精确到年月日
     */
    public static final String DATE_PATTERN="yyyy/MM/dd";
    /**
     * 日期的格式，精确到时分秒
     */
    public static final String TIME_PATTERN="hh:mm:ss";



    /**
     * 字符串转换成日期对象 （日期解析）
     * @param dateStr  字符串表示的日期
     * @return  返回解析后的日期对象
     */
    public static Date stringToDate(String dateStr,String pattern){
        DateFormat df=new SimpleDateFormat(pattern);
        Date date=null;
        try {
            date=df.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 日期转换成字符串对象 （日期格式化）
     * @param date  要格式化的日期
     * @return  返回字符串表示的日期
     */
    public static String  dateToString(Date date,String pattern){
       DateFormat df= new SimpleDateFormat(pattern);
       String dateStr=df.format(date);
        return dateStr;
    }

    /**
     * 获得对应日期的年份
     * @param date 指定日期
     * @return  返回年
     */
    public static int  getYear(Date date){
        // date -- calendar -- get
        Calendar calendar=Calendar.getInstance();
        calendar.setTime(date); //calendar 指定日期的日历对象
        return calendar.get(Calendar.YEAR);
        // return 0;
    }

    /**
     * 获得对应日期的月份
     * @param date 指定日期
     * @return 返回月份
     */
    public static int getMonth(Date date){
        Calendar calendar1=Calendar.getInstance();
        calendar1.setTime(date);
        return calendar1.get(Calendar.MONTH)+1;
        // return 0;
    }

    /**
     * 返回当前日期的天
     * @param date 指定日期
     * @return 返回当前的天
     */
    public static int getDay(Date date){
        Calendar calendar=Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.DAY_OF_MONTH);
    }




    /**
     * 返回对应日期的小时
     * @param date 指定日期
     * @return 返回小时
     */
    public static int getHour(Date date){
        Calendar calendar=Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.HOUR_OF_DAY);
    }

    /**
     * 返回对应日期的分钟
     * @param date  指定日期
     * @return 返回的分钟
     */
    public static int getMinute(Date date){
        Calendar calendar=Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.MINUTE);
    }

    /**
     * 获得对应日期的秒
     * @param date  指定日期
     * @return  返回秒
     */
    public static int getSecond(Date date){
        Calendar calendar =    Calendar.getInstance();
        calendar.setTime(date);
        return  calendar.get(Calendar.SECOND);
    }



}
