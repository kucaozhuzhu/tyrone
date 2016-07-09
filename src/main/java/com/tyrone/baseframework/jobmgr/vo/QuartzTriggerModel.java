package com.tyrone.baseframework.jobmgr.vo;


 
 public class QuartzTriggerModel {
   private String sched_name = "";
   private String trigger_name = "";
   private String trigger_group = "";
   private String job_name = "";
   private String job_group = "";
   private String description = "";
   private Long next_fire_time;
   private String next_fire_timeStr;
   private Long prev_fire_time;
   private String prev_fire_timeStr;
   private Integer priority = Integer.valueOf(0);
   private String trigger_state = "";
   private String trigger_type = "";
   private Long start_time;
   private String start_timeStr;
   private Long end_time;
   private String end_timeStr;
   private String calendar_name = "";
   private Integer misfire_instr;
   private String status;
   
   public QuartzTriggerModel() {}
   
   public String getStatus() { return this.status; }
   
   public void setStatus(String status) {
     this.status = status;
   }
   
   public String getNext_fire_timeStr() { return this.next_fire_timeStr; }
   
   public void setNext_fire_timeStr(String next_fire_timeStr) {
     this.next_fire_timeStr = next_fire_timeStr;
   }
   
   public String getPrev_fire_timeStr() { return this.prev_fire_timeStr; }
   
   public void setPrev_fire_timeStr(String prev_fire_timeStr) {
     this.prev_fire_timeStr = prev_fire_timeStr;
   }
   
   public String getStart_timeStr() { return this.start_timeStr; }
   
   public void setStart_timeStr(String start_timeStr) {
     this.start_timeStr = start_timeStr;
   }
   
   public String getEnd_timeStr() { return this.end_timeStr; }
   
   public void setEnd_timeStr(String end_timeStr) {
     this.end_timeStr = end_timeStr;
   }
   
   public String getSched_name() { return this.sched_name; }
   
   public void setSched_name(String sched_name) {
     this.sched_name = sched_name;
   }
   
   public String getTrigger_name() { return this.trigger_name; }
   
   public void setTrigger_name(String trigger_name) {
     this.trigger_name = trigger_name;
   }
   
   public String getTrigger_group() { return this.trigger_group; }
   
   public void setTrigger_group(String trigger_group) {
     this.trigger_group = trigger_group;
   }
   
   public String getJob_name() { return this.job_name; }
   
   public void setJob_name(String job_name) {
     this.job_name = job_name;
   }
   
   public String getJob_group() { return this.job_group; }
   
   public void setJob_group(String job_group) {
     this.job_group = job_group;
   }
   
   public String getDescription() { return this.description; }
   
   public void setDescription(String description) {
     this.description = description;
   }
   
   public Long getNext_fire_time() { return this.next_fire_time; }
   
   public void setNext_fire_time(Long next_fire_time) {
     this.next_fire_time = next_fire_time;
   }
   
   public Long getPrev_fire_time() { return this.prev_fire_time; }
   
   public void setPrev_fire_time(Long prev_fire_time) {
     this.prev_fire_time = prev_fire_time;
   }
   
   public Integer getPriority() { return this.priority; }
   
   public void setPriority(Integer priority) {
     this.priority = priority;
   }
   
   public String getTrigger_state() { return this.trigger_state; }
   
   public void setTrigger_state(String trigger_state) {
     this.trigger_state = trigger_state;
   }
   
   public String getTrigger_type() { return this.trigger_type; }
   
   public void setTrigger_type(String trigger_type) {
     this.trigger_type = trigger_type;
   }
   
   public Long getStart_time() { return this.start_time; }
   
   public void setStart_time(Long start_time) {
     this.start_time = start_time;
   }
   
   public Long getEnd_time() { return this.end_time; }
   
   public void setEnd_time(Long end_time) {
     this.end_time = end_time;
   }
   
   public String getCalendar_name() { return this.calendar_name; }
   
   public void setCalendar_name(String calendar_name) {
     this.calendar_name = calendar_name;
   }
   
   public Integer getMisfire_instr() { return this.misfire_instr; }
   
   public void setMisfire_instr(Integer misfire_instr) {
     this.misfire_instr = misfire_instr;
   }
   
   public String toString() {
     return "QuartzTriggerModel [sched_name=" + this.sched_name + ", trigger_name=" + this.trigger_name + ", trigger_group=" + this.trigger_group + ", job_name=" + this.job_name + ", job_group=" + this.job_group + ", description=" + this.description + ", next_fire_time=" + this.next_fire_time + ", prev_fire_time=" + this.prev_fire_time + ", priority=" + this.priority + ", trigger_state=" + this.trigger_state + ", trigger_type=" + this.trigger_type + ", start_time=" + this.start_time + ", end_time=" + this.end_time + ", calendar_name=" + this.calendar_name + ", misfire_instr=" + this.misfire_instr + "]";
   }
 }

/* Location:           D:\java\mavenresp\b2b2c\com\aebiz\baseframework\0.0.1\baseframework-0.0.1.jar
 * Qualified Name:     com.aebiz.b2b2c.baseframework.jobsmgr.vo.QuartzTriggerModel
 * Java Class Version: 5 (49.0)
 * JD-Core Version:    0.7.0.1
 */