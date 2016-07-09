package com.tyrone.baseframework.jobmgr.dao;

import java.util.List;

import com.tyrone.baseframework.jobmgr.vo.QuartzTriggerModel;


public abstract interface QuartzDao
{
  public abstract List<QuartzTriggerModel> getTriggers(int paramInt1, int paramInt2);
  
  public abstract int getTriggersCount();
}
