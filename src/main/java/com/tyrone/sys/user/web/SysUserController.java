package com.tyrone.sys.user.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tyrone.baseframework.base.web.BaseController;
import com.tyrone.sys.user.service.SysUserService;
import com.tyrone.sys.user.vo.SysUserModel;
import com.tyrone.sys.user.vo.SysUserQueryModel;
@Controller
@RequestMapping("/sysback/sysUser")
public class SysUserController extends BaseController<SysUserModel, SysUserQueryModel>{
	
	private SysUserService sysUserService;
	
	@Autowired
	public void setSysUserService(SysUserService sysUserService) {
		this.sysUserService = sysUserService;
		super.setBs(sysUserService);
	}

	public SysUserController() {
		super("sys/user", "User", SysUserController.class);
	}


}
