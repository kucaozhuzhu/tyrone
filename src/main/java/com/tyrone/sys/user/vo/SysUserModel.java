package com.tyrone.sys.user.vo;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.tyrone.baseframework.base.vo.BaseModel;
@Entity
@Table(name="sys_user")
public class SysUserModel extends BaseModel{
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String password;
	private Integer age;
	private String phone;
	private String email;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
