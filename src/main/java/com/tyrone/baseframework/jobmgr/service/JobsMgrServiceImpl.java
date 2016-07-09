package com.tyrone.baseframework.jobmgr.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.quartz.CronExpression;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerKey;
import org.quartz.impl.triggers.CronTriggerImpl;
import org.quartz.impl.triggers.SimpleTriggerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyrone.baseframework.jobmgr.dao.QuartzDao;
import com.tyrone.baseframework.jobmgr.vo.JobDetailModel;
import com.tyrone.baseframework.jobmgr.vo.QuartzTriggerModel;
import com.tyrone.baseframework.jobmgr.vo.TriggerModel;


@Service("schedulerService")
public class JobsMgrServiceImpl implements JobsMgrService {
	@Autowired
	private Scheduler scheduler;
	@Autowired
	private QuartzDao quartzDao;
	private static Logger log = Logger.getLogger("error_logger");
//	@PostConstruct
//	public void postConstruct(){
//		
//		try {
//			scheduler.start();
//		} catch (SchedulerException e) {
//			e.printStackTrace();
//		}
//	}	
	public int getTriggersCount(){
		return quartzDao.getTriggersCount();
	}
	public List<QuartzTriggerModel> getTriggers(int start, int pageShow) {
		return quartzDao.getTriggers(start, pageShow);
	}
	public void schedule(JobDetailModel jdm,String triggerName, String triggerGroup, String cronExpression) {
		try {
			schedule(jdm,triggerName, triggerGroup, new CronExpression(cronExpression));
		} catch (Exception e) {
			log.error("error",e);
			e.printStackTrace();
		}
	}
	public void schedule(JobDetailModel jdm,String triggerName, String triggerGroup, CronExpression cronExpression) {
//		if (isValidExpression(cronExpression)) {
			//创建jobDetail
			JobDetail jobDetail = this.createJobDetail(jdm);
			
			if (triggerName == null || triggerName.trim().equals("")) {
				triggerName = UUID.randomUUID().toString();
			}

			CronTriggerImpl trigger = new CronTriggerImpl();
			trigger.setCronExpression(cronExpression);

			TriggerKey triggerKey = new TriggerKey(triggerName, triggerGroup);

			trigger.setJobKey(jobDetail.getKey());
			trigger.setKey(triggerKey);

			try {
				scheduler.addJob(jobDetail, true);
				if (scheduler.checkExists(triggerKey)) {
					scheduler.rescheduleJob(triggerKey, trigger);
				} else {
					scheduler.scheduleJob(trigger);
				}
			} catch (SchedulerException e) {
				log.error("error",e);
				throw new IllegalArgumentException(e);
			}
//		}
	}
	
	public void schedule(JobDetailModel jdm,TriggerModel tm) {
		if (this.isValidExpression(tm.getStartTime())) {

			//创建jobDetail
			JobDetail jobDetail = this.createJobDetail(jdm);
			
			if (tm.getTriggerName() == null || tm.getTriggerName().trim().equals("")) {
				tm.setTriggerName(UUID.randomUUID().toString());
			}

			TriggerKey triggerKey = new TriggerKey(tm.getTriggerName(), tm.getTriggerGroupName());

			SimpleTriggerImpl trigger = new SimpleTriggerImpl();
			trigger.setKey(triggerKey);
			trigger.setJobKey(jobDetail.getKey());

			trigger.setStartTime(tm.getStartTime());
			trigger.setEndTime(tm.getEndTime());
			trigger.setRepeatCount(tm.getRepeatCount());
			trigger.setRepeatInterval(tm.getRepeatInterval());

			try {
				scheduler.addJob(jobDetail, true);
				if (scheduler.checkExists(triggerKey)) {
					scheduler.rescheduleJob(triggerKey, trigger);
				} else {
					scheduler.scheduleJob(trigger);
				}
			} catch (SchedulerException e) {
				log.error("error",e);
				throw new IllegalArgumentException(e);
			}
		}
	}
	


	
	public void pauseTrigger(String triggerName, String group) {
		try {
			scheduler.pauseTrigger(new TriggerKey(triggerName, group));
		} catch (SchedulerException e) {
			log.error("error",e);
			throw new RuntimeException(e);
		}
	}
	public void resumeTrigger(String triggerName, String group) {
		try {
			TriggerKey tk = new TriggerKey(triggerName, group);
			//Trigger t = scheduler.getTrigger(tk);
			
			scheduler.resumeTrigger(tk);
		} catch (SchedulerException e) {
			log.error("error",e);
			throw new RuntimeException(e);
		}
	}
	public boolean removeTrigdger(String triggerName, String group) {
		TriggerKey triggerKey = new TriggerKey(triggerName, group);
		try {
			scheduler.pauseTrigger(triggerKey);
			return scheduler.unscheduleJob(triggerKey);
		} catch (SchedulerException e) {
			log.error("error",e);
			throw new RuntimeException(e);
		}
	}

	/**
	 * 立即运行一次
	 * @param triggerName    触发器名称
	 * @param group          触发器组
	 * @return
	 */
	public void triggerJob(String triggerName, String group){
		try {
			TriggerKey tk = new TriggerKey(triggerName, group);
			Trigger t = scheduler.getTrigger(tk);
			 scheduler.triggerJob(t.getJobKey());
		} catch (SchedulerException e) {
			log.error("error",e);
			throw new RuntimeException(e);
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private JobDetail createJobDetail(JobDetailModel jdm){
		JobDetail myJob = null;
		try{
			//先查找一下
			Class cls = Class.forName(jdm.getClassName());
			myJob = JobBuilder.newJob(cls)
				.withIdentity(jdm.getJobName(), jdm.getGroupName()).storeDurably().build();
		}catch(Exception err){
			log.error("error",err);
			err.printStackTrace();
		}
		return myJob;
	}
//	private boolean isValidExpression(final CronExpression cronExpression) {
//
//		CronTriggerImpl trigger = new CronTriggerImpl();
//		trigger.setCronExpression(cronExpression);
//
//		Date date = trigger.computeFirstFireTime(null);
//
//		return date != null && date.after(new Date());
//	}

	private boolean isValidExpression(final Date startTime) {

		SimpleTriggerImpl trigger = new SimpleTriggerImpl();
		trigger.setStartTime(startTime);

		Date date = trigger.computeFirstFireTime(null);

		return date != null && date.after(new Date());
	}
	///////////////////////
//	public void schedule(Map<String, Object> map) {
//
//		// 设置名称
//		String name = MapUtils.getString(map, Constant.TRIGGERNAME);
//		if (StringUtils.isEmpty(StringUtils.trim(name))) {
//			name = UUID.randomUUID().toString();
//		} else {
//			// 在名称后添加UUID，保证名称的唯一性
//			name += "&" + UUID.randomUUID().toString();
//		}
//
//		// 设置Trigger分组
//		String group = MapUtils.getString(map, Constant.TRIGGERGROUP);
//		if (StringUtils.isEmpty(group)) {
//			group = Scheduler.DEFAULT_GROUP;
//		}
//
//		TriggerKey triggerKey = new TriggerKey(name, group);
//
//		// 实例化SimpleTrigger
//		SimpleTriggerImpl trigger = new SimpleTriggerImpl();
//
//		trigger.setJobName(jobDetail.getKey().getName());
//		trigger.setKey(triggerKey);
//		trigger.setRepeatInterval(1000L);
//
//		// 设置开始时间
//		String temp = MapUtils.getString(map, Constant.STARTTIME);
//		if (StringUtils.isNotEmpty(temp)) {
//			try {
//				trigger.setStartTime(DateUtils.parseDate(temp, new String[] { "yyyy-MM-dd HH:mm" }));
//			} catch (ParseException e) {
//				throw new IllegalArgumentException(e);
//			}
//		}
//
//		// 设置结束时间
//		temp = MapUtils.getString(map, Constant.ENDTIME);
//		if (StringUtils.isNotEmpty(temp)) {
//			try {
//				trigger.setEndTime(DateUtils.parseDate(temp, new String[] { "yyyy-MM-dd HH:mm" }));
//			} catch (ParseException e) {
//				throw new IllegalArgumentException(e);
//			}
//		}
//
//		// 设置执行次数
//		temp = MapUtils.getString(map, Constant.REPEATCOUNT);
//		if (StringUtils.isNotEmpty(temp) && NumberUtils.toInt(temp) > 0) {
//			trigger.setRepeatCount(NumberUtils.toInt(temp));
//		}
//
//		// 设置执行时间间隔
//		temp = MapUtils.getString(map, Constant.REPEATINTERVEL);
//		if (StringUtils.isNotEmpty(temp) && NumberUtils.toLong(temp) > 0) {
//			trigger.setRepeatInterval(NumberUtils.toLong(temp) * 1000);
//		}
//
//		try {
//			scheduler.addJob(jobDetail, true);
//			if (scheduler.checkExists(triggerKey)) {
//				scheduler.rescheduleJob(triggerKey, trigger);
//			} else {
//				scheduler.scheduleJob(trigger);
//			}
//		} catch (SchedulerException e) {
//			throw new IllegalArgumentException(e);
//		}
//	}
}
