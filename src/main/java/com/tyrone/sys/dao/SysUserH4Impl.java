package com.tyrone.sys.dao;

import org.springframework.stereotype.Repository;

import com.tyrone.baseframework.base.dao.BaseH4Impl;
import com.tyrone.sys.vo.SysUserModel;
import com.tyrone.sys.vo.SysUserQueryModel;

@Repository("sysUserDao")
public class SysUserH4Impl extends BaseH4Impl<SysUserModel, SysUserQueryModel> implements SysUserDao{


}
