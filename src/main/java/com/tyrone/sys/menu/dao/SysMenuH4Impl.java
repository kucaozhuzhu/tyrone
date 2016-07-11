package com.tyrone.sys.menu.dao;

import org.springframework.stereotype.Repository;

import com.tyrone.baseframework.base.dao.BaseH4Impl;
import com.tyrone.sys.menu.vo.SysMenuModel;
import com.tyrone.sys.menu.vo.SysMenuQueryModel;

@Repository("sysMenuDao")
public class SysMenuH4Impl extends BaseH4Impl<SysMenuModel, SysMenuQueryModel> implements SysMenuDao {


}
