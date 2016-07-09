/** 
 * Project Name:tyrone 
 * File Name:StringUtil.java 
 * Package Name:com.tyrone.baseframework.utils 
 * Date:2016-7-6下午7:10:03 
 * Copyright (c) 2016, chenzhou1025@126.com All Rights Reserved. 
 * 
*/  
  
package com.tyrone.baseframework.utils;  
/** 
 * ClassName:StringUtil <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason:   TODO ADD REASON. <br/> 
 * Date:     2016-7-6 下午7:10:03 <br/> 
 * @author   tanyan 
 * @version   
 * @see       
 */
public class StringUtil {
    
    public static boolean isEmpty(String msg){
        if(msg!=null && !"".equals(msg)){
            return true;
        }
        return false;
    }
}
  