package com.tyrone.sys.userrole.vo;

import com.tyrone.baseframework.base.vo.BaseModel;

public class SysUserRoleModel extends BaseModel{

	private static final long serialVersionUID = 1L;

	private String userId;
	private String roleId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
}
