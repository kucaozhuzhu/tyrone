package com.tyrone.sys.userrole.dao;

import org.springframework.stereotype.Repository;

import com.tyrone.baseframework.base.dao.BaseH4Impl;
import com.tyrone.sys.userrole.vo.SysUserRoleModel;
import com.tyrone.sys.userrole.vo.SysUserRoleQueryModel;

@Repository("sysUserRoleDao")
public class SysUserRoleH4Impl extends BaseH4Impl<SysUserRoleModel, SysUserRoleQueryModel> implements SysUserRoleDao {


}
