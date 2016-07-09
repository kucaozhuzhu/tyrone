 package com.tyrone.baseframework.jobmgr.vo;
 
 import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.tyrone.baseframework.utils.DateFormatHelper;
 
 public class TriggerModel
 {
   private String triggerName;
   private String triggerGroupName;
   private Date startTime;
   private Date endTime;
   private int repeatCount;
   private long repeatInterval;
   private Map<String, Object> dataMap = new HashMap<String, Object>();
   
   private String startTimeStr;
   private String endTimeStr;
   
   public TriggerModel() {}
   
   public String getStartTimeStr() { return this.startTimeStr; }
   
   public void setStartTimeStr(String startTimeStr) {
     this.startTimeStr = startTimeStr;
     if ((this.startTimeStr != null) && (this.startTimeStr.trim().length() > 0)) {
       setStartTime(DateFormatHelper.toDate(this.startTimeStr));
     }
   }
   
   public String getEndTimeStr() { return this.endTimeStr; }
   
   public void setEndTimeStr(String endTimeStr) {
     this.endTimeStr = endTimeStr;
     if ((this.endTimeStr != null) && (this.endTimeStr.trim().length() > 0))
       setEndTime(DateFormatHelper.toDate(this.endTimeStr));
   }
   
   public String getTriggerName() {
     return this.triggerName;
   }
   
   public void setTriggerName(String triggerName) { this.triggerName = triggerName; }
   
   public String getTriggerGroupName() {
     return this.triggerGroupName;
   }
   
   public void setTriggerGroupName(String triggerGroupName) { this.triggerGroupName = triggerGroupName; }
   
   public Date getStartTime() {
     return this.startTime;
   }
   
   public void setStartTime(Date startTime) { this.startTime = startTime; }
   
   public Date getEndTime() {
     return this.endTime;
   }
   
   public void setEndTime(Date endTime) { this.endTime = endTime; }
   
   public int getRepeatCount() {
     return this.repeatCount;
   }
   
   public void setRepeatCount(int repeatCount) { this.repeatCount = repeatCount; }
   
   public long getRepeatInterval() {
     return this.repeatInterval;
   }
   
   public void setRepeatInterval(long repeatInterval) { this.repeatInterval = repeatInterval; }
   
   public Map<String, Object> getDataMap() {
     return this.dataMap;
   }
   
   public void setDataMap(Map<String, Object> dataMap) { this.dataMap = dataMap; }
   
   public String toString()
   {
     return "TriggerModel [triggerName=" + this.triggerName + ", triggerGroupName=" + this.triggerGroupName + ", startTime=" + this.startTime + ", endTime=" + this.endTime + ", repeatCount=" + this.repeatCount + ", repeatInterval=" + this.repeatInterval + ", dataMap=" + this.dataMap + "]";
   }
 }
