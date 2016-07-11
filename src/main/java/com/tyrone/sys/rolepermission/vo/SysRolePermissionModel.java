package com.tyrone.sys.rolepermission.vo;

import com.tyrone.baseframework.base.vo.BaseModel;

public class SysRolePermissionModel extends BaseModel{

	private static final long serialVersionUID = 1L;

	private String roleId;
	private String permissionId;
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(String permissionId) {
		this.permissionId = permissionId;
	}
	
}
