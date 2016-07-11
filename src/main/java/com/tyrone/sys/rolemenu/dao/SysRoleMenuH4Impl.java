package com.tyrone.sys.rolemenu.dao;

import org.springframework.stereotype.Repository;

import com.tyrone.baseframework.base.dao.BaseH4Impl;
import com.tyrone.sys.rolemenu.vo.SysRoleMenuModel;
import com.tyrone.sys.rolemenu.vo.SysRoleMenuQueryModel;

@Repository("sysRoleMenuDao")
public class SysRoleMenuH4Impl extends BaseH4Impl<SysRoleMenuModel, SysRoleMenuQueryModel> implements SysRoleMenuDao {


}
