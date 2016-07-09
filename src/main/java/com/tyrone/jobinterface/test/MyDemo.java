package com.tyrone.jobinterface.test;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
/**
 *
 * @author Administrator
 *
 */
public class MyDemo implements Job{

	@Override
	public void execute(JobExecutionContext context)
			throws JobExecutionException {
		System.out.println("-----------");
	}


}
