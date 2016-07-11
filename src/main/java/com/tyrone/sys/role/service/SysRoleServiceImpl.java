package com.tyrone.sys.role.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyrone.baseframework.base.service.BaseServiceImpl;
import com.tyrone.sys.role.dao.SysRoleDao;
import com.tyrone.sys.role.vo.SysRoleModel;
import com.tyrone.sys.role.vo.SysRoleQueryModel;

@Service("sysRoleService")
public class SysRoleServiceImpl extends BaseServiceImpl<SysRoleModel, SysRoleQueryModel> implements SysRoleService{
	
	private SysRoleDao sysRoleDao = null;

	@Autowired
	public void setSysRoleDao(SysRoleDao sysRoleDao) {
		this.sysRoleDao = sysRoleDao;
		super.setDao(sysRoleDao);
	}

}
