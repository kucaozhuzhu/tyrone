package com.tyrone.sys.menu.vo;

import com.tyrone.baseframework.base.vo.BaseModel;

public class SysMenuModel extends BaseModel{

	private static final long serialVersionUID = 1L;

	private String name;
	private String  path;
	private Integer sort;
	private String parentId;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
}
