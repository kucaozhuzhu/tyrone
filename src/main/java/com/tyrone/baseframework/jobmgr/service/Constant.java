package com.tyrone.baseframework.jobmgr.service;

import java.util.HashMap;
import java.util.Map;

public class Constant {
	public static final Map<String,String> status = new HashMap<String,String>();
	static{
		status.put("ACQUIRED", "运行中");
		status.put("PAUSED", "暂停中");
		status.put("WAITING", "等待中");	
		status.put("ERROR", "错误");	
	}
}
