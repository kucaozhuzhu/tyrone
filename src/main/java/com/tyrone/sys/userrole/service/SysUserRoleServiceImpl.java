package com.tyrone.sys.userrole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyrone.baseframework.base.service.BaseServiceImpl;
import com.tyrone.sys.userrole.dao.SysUserRoleDao;
import com.tyrone.sys.userrole.vo.SysUserRoleModel;
import com.tyrone.sys.userrole.vo.SysUserRoleQueryModel;

@Service("sysUserRoleService")
public class SysUserRoleServiceImpl extends BaseServiceImpl<SysUserRoleModel, SysUserRoleQueryModel> implements SysUserRoleService{
	
	private SysUserRoleDao sysUserRoleDao = null;

	@Autowired
	public void setSysUserRoleDao(SysUserRoleDao sysUserRoleDao) {
		this.sysUserRoleDao = sysUserRoleDao;
		super.setDao(sysUserRoleDao);
	}

}
