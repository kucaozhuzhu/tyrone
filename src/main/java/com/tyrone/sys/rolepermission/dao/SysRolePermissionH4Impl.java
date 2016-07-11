package com.tyrone.sys.rolepermission.dao;

import org.springframework.stereotype.Repository;

import com.tyrone.baseframework.base.dao.BaseH4Impl;
import com.tyrone.sys.rolepermission.vo.SysRolePermissionModel;
import com.tyrone.sys.rolepermission.vo.SysRolePermissionQueryModel;

@Repository("sysRolePermissionDao")
public class SysRolePermissionH4Impl extends BaseH4Impl<SysRolePermissionModel, SysRolePermissionQueryModel> implements SysRolePermissionDao {


}
