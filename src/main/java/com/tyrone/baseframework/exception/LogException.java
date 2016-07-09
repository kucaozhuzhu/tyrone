/** 
 * Project Name:tyrone 
 * File Name:LogException.java 
 * Package Name:com.tyrone.baseframework.exception 
 * Date:2016-7-6下午7:20:18 
 * Copyright (c) 2016, chenzhou1025@126.com All Rights Reserved. 
 * 
*/  
  
package com.tyrone.baseframework.exception;  


/** 
 * ClassName:LogException <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason:   TODO ADD REASON. <br/> 
 * Date:     2016-7-6 下午7:20:18 <br/> 
 * @author   tanyan 
 * @version   
 * @see       
 */
public class LogException extends RuntimeException {
    /**
     * serialVersionUID:TODO(用一句话描述这个变量表示什么). 
     */
    private static final long serialVersionUID = 1L;
    private String msg;
    private String logInfo;
    private Throwable originException;

    public LogException(String msgId) {
        this(msgId, null);
    }

    public LogException(String msgId, Throwable originException) {
        this(msgId, "", originException);
    }

    public LogException(String msg, String logInfo, Throwable originException) {
        this.msg = msg;
        this.logInfo = logInfo;
        this.originException = originException;
    }

    public Throwable getOriginException() {
        return this.originException;
    }

    public String getLogInfo() {
        return this.logInfo;
    }

    public String getMessage() {
        return msg;
    }
}
