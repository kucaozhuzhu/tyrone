package com.tyrone.sys.rolemenu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyrone.baseframework.base.service.BaseServiceImpl;
import com.tyrone.sys.rolemenu.dao.SysRoleMenuDao;
import com.tyrone.sys.rolemenu.vo.SysRoleMenuModel;
import com.tyrone.sys.rolemenu.vo.SysRoleMenuQueryModel;

@Service("sysRoleMenuService")
public class SysRoleMenuServiceImpl extends BaseServiceImpl<SysRoleMenuModel, SysRoleMenuQueryModel> implements SysRoleMenuService{
	
	private SysRoleMenuDao sysRoleMenuDao = null;

	@Autowired
	public void setSysRoleMenuDao(SysRoleMenuDao sysRoleMenuDao) {
		this.sysRoleMenuDao = sysRoleMenuDao;
		super.setDao(sysRoleMenuDao);
	}

}
