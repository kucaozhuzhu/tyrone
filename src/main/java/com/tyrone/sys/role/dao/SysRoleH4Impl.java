package com.tyrone.sys.role.dao;

import org.springframework.stereotype.Repository;

import com.tyrone.baseframework.base.dao.BaseH4Impl;
import com.tyrone.sys.role.vo.SysRoleModel;
import com.tyrone.sys.role.vo.SysRoleQueryModel;

@Repository("sysRoleDao")
public class SysRoleH4Impl extends BaseH4Impl<SysRoleModel, SysRoleQueryModel> implements SysRoleDao {


}
