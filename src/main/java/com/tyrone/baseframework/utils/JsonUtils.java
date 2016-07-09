package com.tyrone.baseframework.utils;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;


public class JsonUtils {
	private static Logger log = Logger.getLogger("error_logger");
    public static String toJson(Object o){  
        try {  
            return JSON.toJSONString(o);  
        } catch (Exception e) {  
        	log.error("error",e);
            e.printStackTrace();  
        }  
        return "";  
    } 
    public static Object json2Model(String json,Class cls){
    	return JSON.parseObject(json,cls);  	
    }
}
