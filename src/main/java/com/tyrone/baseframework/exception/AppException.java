package com.tyrone.baseframework.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 
 * ClassName: AppException <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2016-7-6 下午12:57:38 <br/> 
 * 
 * @author tanyan 
 * @version
 */
public class AppException extends LogException
 {
   public static final String PAGE_ERR_MSG = "PageErrorMsg";
   public static final String ERR_MSG_COMMON_PAGE = "error/ErrorPage";
   private String compId;
   private String showMsgPage;
   
   public AppException(String msg, String compId, String showMsgPage)
   {
     super(msg, null);
     this.compId = compId;
     this.showMsgPage = showMsgPage;
   }
   
   public AppException(String msg, String showMsgPage) { this(msg, "PageErrorMsg", showMsgPage); }
   
   public AppException(String msgId) {
     this(msgId, "PageErrorMsg", "error/ErrorPage");
   }
   
   public String getCompId() {
     return this.compId;
   }
   
   public String getShowMsgPage() { return this.showMsgPage; }
   
   private static Logger log = LoggerFactory.getLogger(AppException.class);
 }  

