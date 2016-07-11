package com.tyrone.sys.permission.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tyrone.baseframework.base.web.BaseController;
import com.tyrone.sys.permission.service.SysPermissionService;
import com.tyrone.sys.permission.vo.SysPermissionModel;
import com.tyrone.sys.permission.vo.SysPermissionQueryModel;
@Controller
@RequestMapping("/sysback/sysPermission")
public class SysPermissionController extends BaseController<SysPermissionModel, SysPermissionQueryModel>{
	
	private SysPermissionService sysPermissionService;
	
	@Autowired
	public void setSysPermissionService(SysPermissionService sysPermissionService) {
		this.sysPermissionService = sysPermissionService;
		super.setBs(sysPermissionService);
	}

	public SysPermissionController() {
		super("sys/permission", "Permission", SysPermissionController.class);
	}


}
