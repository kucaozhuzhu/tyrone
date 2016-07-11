package com.tyrone.sys.role.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tyrone.baseframework.base.web.BaseController;
import com.tyrone.sys.role.service.SysRoleService;
import com.tyrone.sys.role.vo.SysRoleModel;
import com.tyrone.sys.role.vo.SysRoleQueryModel;
@Controller
@RequestMapping("/sysback/sysRole")
public class SysRoleController extends BaseController<SysRoleModel, SysRoleQueryModel>{
	
	private SysRoleService sysRoleService;
	
	@Autowired
	public void setSysRoleService(SysRoleService sysRoleService) {
		this.sysRoleService = sysRoleService;
		super.setBs(sysRoleService);
	}

	public SysRoleController() {
		super("sys/role", "Role", SysRoleController.class);
	}


}
