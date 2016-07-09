package com.tyrone.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyrone.baseframework.base.service.BaseServiceImpl;
import com.tyrone.sys.dao.SysUserDao;
import com.tyrone.sys.vo.SysUserModel;
import com.tyrone.sys.vo.SysUserQueryModel;

@Service("sysUserService")
public class SysUserServiceImpl extends BaseServiceImpl<SysUserModel, SysUserQueryModel> implements SysUserService{
	
	private SysUserDao sysUserDao = null;

	@Autowired
	public void setSysUserDao(SysUserDao sysUserDao) {
		this.sysUserDao = sysUserDao;
		super.setDao(sysUserDao);
	}

}
