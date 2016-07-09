package com.tyrone.baseframework.jobmgr.dao;

 
 import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.tyrone.baseframework.jobmgr.service.Constant;
import com.tyrone.baseframework.jobmgr.vo.QuartzTriggerModel;
 
 @Repository
 public class JdbcImpl implements QuartzDao
 {
   private DataSource dataSource;
   
   public JdbcImpl() {}
   
   @org.springframework.beans.factory.annotation.Autowired
   public void setDataSource(@Qualifier("dataSource") DataSource dataSource)
   {
     this.dataSource = dataSource;
   }
   
   private JdbcTemplate getJdbcTemplate() {
     return new JdbcTemplate(this.dataSource);
   }
   
 
 
 
 
   public List<QuartzTriggerModel> getTriggers(int start, int pageShow)
   {
     List<QuartzTriggerModel> retList = new ArrayList<QuartzTriggerModel>();
     List<Map<String, Object>> db = getJdbcTemplate().queryForList("select * from QRTZ_TRIGGERS order by start_time limit " + start + "," + pageShow);
     long val = 0L;
     String temp = null;
     for (Map<String, Object> map : db) {
       QuartzTriggerModel qtm = new QuartzTriggerModel();
       
       temp = MapUtils.getString(map, "trigger_name");
       
 
 
       qtm.setTrigger_name(temp);
       
 
       val = MapUtils.getLongValue(map, "next_fire_time");
       if (val > 0L) {
         qtm.setNext_fire_timeStr(DateFormatUtils.format(val, "yyyy-MM-dd HH:mm:ss"));
       }
       
 
       val = MapUtils.getLongValue(map, "prev_fire_time");
       if (val > 0L) {
         qtm.setPrev_fire_timeStr(DateFormatUtils.format(val, "yyyy-MM-dd HH:mm:ss"));
       }
       
 
       val = MapUtils.getLongValue(map, "start_time");
       if (val > 0L) {
         qtm.setStart_timeStr(DateFormatUtils.format(val, "yyyy-MM-dd HH:mm:ss"));
       }
       
 
       val = MapUtils.getLongValue(map, "end_time");
       if (val > 0L) {
         qtm.setEnd_timeStr(DateFormatUtils.format(val, "yyyy-MM-dd HH:mm:ss"));
       }
       
 
       qtm.setStatus((String)Constant.status.get(MapUtils.getString(map, "trigger_state")));
       
 
       qtm.setTrigger_group(MapUtils.getString(map, "trigger_group"));
       
       retList.add(qtm);
     }
     
     return retList;
   }
   
   public int getTriggersCount() {
     return getJdbcTemplate().queryForInt("select count(*) from QRTZ_TRIGGERS ");
   }
 }


