package com.tyrone.baseframework.jobmgr.vo;

 import java.util.Map;

public class JobDetailModel { private String className;
   private String jobName;
   private String groupName;
  
   public JobDetailModel() {}
   private Map<String, Object> dataMap = new java.util.HashMap<String, Object>();
  
  public String getClassName() { return this.className; }
  
  public void setClassName(String className) {
    this.className = className;
   }
  
   public String getJobName() { return this.jobName; }
   
   public void setJobName(String jobName) {
    this.jobName = jobName;
   }
   
  public String getGroupName() { return this.groupName; }
  
   public void setGroupName(String groupName) {
     this.groupName = groupName;
  }
   
  public Map<String, Object> getDataMap() { return this.dataMap; }
  
   public void setDataMap(Map<String, Object> dataMap) {
    this.dataMap = dataMap;
  }
  
   public String toString() {
     return "JobDetailModel [className=" + this.className + ", jobName=" + this.jobName + ", groupName=" + this.groupName + ", dataMap=" + this.dataMap + "]";
   }
 }

