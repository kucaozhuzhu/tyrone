package com.tyrone.sys.menu.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tyrone.baseframework.base.web.BaseController;
import com.tyrone.sys.menu.service.SysMenuService;
import com.tyrone.sys.menu.vo.SysMenuModel;
import com.tyrone.sys.menu.vo.SysMenuQueryModel;
@Controller
@RequestMapping("/sysback/sysMenu")
public class SysMenuController extends BaseController<SysMenuModel, SysMenuQueryModel>{
	
	private SysMenuService sysMenuService;
	
	@Autowired
	public void setSysMenuService(SysMenuService sysMenuService) {
		this.sysMenuService = sysMenuService;
		super.setBs(sysMenuService);
	}

	public SysMenuController() {
		super("sys/menu", "Menu", SysMenuController.class);
	}


}
