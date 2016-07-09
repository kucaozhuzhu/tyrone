package com.tyrone.baseframework.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;


/**
 * 系统后台提供给shiro框架使用的自定义Realm
 * 
 * @author cc
 * 
 */
public class SysBackRealm extends AuthorizingRealm {
	
	
	
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 通过用户名去获得用户的所有资源，并把资源存入info中
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

		return info;
	}

	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		// token中储存着输入的用户名和密码
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String userName=upToken.getUsername();
		//根据用户名查询出密码
		String password="";
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(
				userName, password, getName());
		return info;

			
	}


}
