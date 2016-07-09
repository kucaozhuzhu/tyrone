package com.tyrone.baseframework.jobmgr.service;

import java.util.List;

import org.quartz.CronExpression;

import com.tyrone.baseframework.jobmgr.vo.JobDetailModel;
import com.tyrone.baseframework.jobmgr.vo.QuartzTriggerModel;
import com.tyrone.baseframework.jobmgr.vo.TriggerModel;


/**
 *	任务调度的服务接口
 */
public interface JobsMgrService {
	/**
	 * 获取触发器列表
	 * @return
	 */
	public List<QuartzTriggerModel> getTriggers(int start,int pageShow);
	/**
	 * 得到总的记录数
	 * @return
	 */
	public int getTriggersCount();
	/**
	 * 根据 Quartz Cron Expression 调度任务
	 * @param jdm 封装Job数据的model
	 * @param triggerName  Quartz CronTrigger名称
	 * @param triggerGroup Quartz CronTrigger组
	 * @param cronExpression   Quartz Cron 表达式，如 "0/10 * * ? * * *"等
	 */
	public void schedule(JobDetailModel jdm,String triggerName, String triggerGroup, String cronExpression);
	/**
	 * 根据 Quartz Cron Expression 调度任务
	 * @param jdm 封装Job数据的model
	 * @param triggerName  Quartz CronTrigger名称
	 * @param triggerGroup Quartz CronTrigger组
	 * @param cronExpression   Quartz CronExpression
	 */
	public void schedule(JobDetailModel jdm,String triggerName, String triggerGroup, CronExpression cronExpression);

	/**
	 * 在startTime时执行调度，endTime结束执行调度，重复执行repeatCount次，每隔repeatInterval秒执行一次
	 * @param jdm 封装Job数据的model
	 * @param tm  封装trigger数据的model
	 */
	public void schedule(JobDetailModel jdm,TriggerModel tm);

	/**
	 * 暂停触发器运行
	 * @param triggerName    触发器名称
	 * @param group          触发器组
	 */
	public void pauseTrigger(String triggerName, String group);

	/**
	 * 恢复触发器运行
	 * @param triggerName    触发器名称
	 * @param group          触发器组
	 */
	public void resumeTrigger(String triggerName, String group);
	/**
	 * 删除触发器
	 * @param triggerName    触发器名称
	 * @param group          触发器组
	 * @return
	 */
	public boolean removeTrigdger(String triggerName, String group);
	/**
	 * 立即运行一次
	 * @param triggerName    触发器名称
	 * @param group          触发器组
	 * @return
	 */
	public void triggerJob(String triggerName, String group);
}
