package com.tyrone.baseframework.jobmgr.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tyrone.baseframework.jobmgr.service.JobsMgrService;
import com.tyrone.baseframework.jobmgr.vo.JobDetailModel;
import com.tyrone.baseframework.jobmgr.vo.TriggerModel;
import com.tyrone.baseframework.jobmgr.web.vo.JobsMgrWebModel;

@Controller
@RequestMapping("/jobsmgr")
public class JobsMgrController {
	@Autowired
	private JobsMgrService jobsService;

	
	/**
	 * 添加Simple Trigger
	 */
	@RequestMapping(value="/addTrigger")
	public String addTrigger(JobDetailModel jdm,TriggerModel tm, HttpServletRequest request,HttpServletResponse response){
		jobsService.schedule(jdm, tm);
		return "success";
	}
	
	@RequestMapping(value="/toAddTrigger")
	public String toAddTrigger(JobDetailModel jdm,TriggerModel tm, HttpServletRequest request,HttpServletResponse response){
		return "jobsmgr/triggersAdd";
	}
	
	/**
	 * 根据Cron表达式添加Cron Trigger，
	 */
	@RequestMapping(value="/addTriggerByCronExpression")
	public String addTriggerByCronExpression(JobDetailModel jdm,String triggerName,String triggerGroup,String cronExpression,HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		jobsService.schedule(jdm, triggerName, triggerGroup, cronExpression);
		
		return "success";
	}

	/**
	 * 取得所有Trigger
	 */
	@RequestMapping(value="/getTriggers")
	public String getTriggers(@ModelAttribute("wm") JobsMgrWebModel wm,HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		
		wm.setTotalNum(jobsService.getTriggersCount());
		
		wm.setRows(jobsService.getTriggers(wm.getFromNum(),1000));
		
		
		
		return "jobsmgr/triggersList";
	}

	/**
	 * 根据名称和组名暂停Tigger运行
	 */
	@RequestMapping(value="/pauseTrigger")
	public String pauseTrigger(String triggerName,String groupName,HttpServletRequest request, HttpServletResponse response) throws IOException {
		jobsService.pauseTrigger(triggerName, groupName);
		return "success";
	}

	/**
	 * 根据名称和组名恢复Tigger运行
	 */
	@RequestMapping(value="/resumeTrigger")
	public String resumeTrigger(String triggerName,String groupName,HttpServletRequest request, HttpServletResponse response) throws IOException {
		jobsService.resumeTrigger(triggerName, groupName);
		return "success";
	}

	/**
	 * 根据名称和组名删除Tigger
	 */
	@RequestMapping(value="/removeTrigdger")
	public String removeTrigdger(String triggerName,String groupName,HttpServletRequest request, HttpServletResponse response) throws IOException {
		jobsService.removeTrigdger(triggerName, groupName);
		return "success";
	}
	/**
	 * 立即运行Tigger
	 */
	@RequestMapping(value="/triggerJob")
	public String triggerJob(String triggerName,String groupName,HttpServletRequest request, HttpServletResponse response) throws IOException {
		jobsService.triggerJob(triggerName, groupName);
		return "success";
	}
}