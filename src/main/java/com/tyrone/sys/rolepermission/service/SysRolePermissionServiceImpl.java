package com.tyrone.sys.rolepermission.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyrone.baseframework.base.service.BaseServiceImpl;
import com.tyrone.sys.rolepermission.dao.SysRolePermissionDao;
import com.tyrone.sys.rolepermission.vo.SysRolePermissionModel;
import com.tyrone.sys.rolepermission.vo.SysRolePermissionQueryModel;

@Service("sysRolePermissionService")
public class SysRolePermissionServiceImpl extends BaseServiceImpl<SysRolePermissionModel, SysRolePermissionQueryModel> implements SysRolePermissionService{
	
	private SysRolePermissionDao sysRolePermissionDao = null;

	@Autowired
	public void setSysRolePermissionDao(SysRolePermissionDao sysRolePermissionDao) {
		this.sysRolePermissionDao = sysRolePermissionDao;
		super.setDao(sysRolePermissionDao);
	}

}
