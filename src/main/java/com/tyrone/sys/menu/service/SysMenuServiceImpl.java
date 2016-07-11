package com.tyrone.sys.menu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyrone.baseframework.base.service.BaseServiceImpl;
import com.tyrone.sys.menu.dao.SysMenuDao;
import com.tyrone.sys.menu.vo.SysMenuModel;
import com.tyrone.sys.menu.vo.SysMenuQueryModel;

@Service("sysMenuService")
public class SysMenuServiceImpl extends BaseServiceImpl<SysMenuModel, SysMenuQueryModel> implements SysMenuService{
	
	private SysMenuDao sysMenuDao = null;

	@Autowired
	public void setSysMenuDao(SysMenuDao sysMenuDao) {
		this.sysMenuDao = sysMenuDao;
		super.setDao(sysMenuDao);
	}

}
