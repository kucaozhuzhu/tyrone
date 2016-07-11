package com.tyrone.sys.permission.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyrone.baseframework.base.service.BaseServiceImpl;
import com.tyrone.sys.permission.dao.SysPermissionDao;
import com.tyrone.sys.permission.vo.SysPermissionModel;
import com.tyrone.sys.permission.vo.SysPermissionQueryModel;

@Service("sysPermissionService")
public class SysPermissionServiceImpl extends BaseServiceImpl<SysPermissionModel, SysPermissionQueryModel> implements SysPermissionService{
	
	private SysPermissionDao sysPermissionDao = null;

	@Autowired
	public void setSysPermissionDao(SysPermissionDao sysPermissionDao) {
		this.sysPermissionDao = sysPermissionDao;
		super.setDao(sysPermissionDao);
	}

}
