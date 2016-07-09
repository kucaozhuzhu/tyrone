package com.tyrone.baseframework.base.service;

import java.util.List;

import com.tyrone.baseframework.base.dao.BaseDAO;
import com.tyrone.baseframework.base.vo.BaseModel;


public class BaseServiceImpl<M extends BaseModel, QM extends M>
   implements BaseService<M, QM>
 {
   public BaseServiceImpl() {}
   
   protected BaseDAO dao = null;
   
   public void setDao(BaseDAO dao) { this.dao = dao; }
   
   public String create(M m) {
     return this.dao.create(m);
   }
   
   public void update(M m) { this.dao.update(m); }
   
   public void delete(M m) {
     this.dao.delete(m);
   }
   
   public M getByUuid(String uuid) {
	   return (M) this.dao.getByUuid(uuid);
	  }
   
   public List<M> getAll(int start, int pageShow) {
     return this.dao.getAll(start, pageShow);
   }
   
   public List<M> getByCondition(QM qm, int start, int pageShow) { return this.dao.getByCondition(qm, start, pageShow); }
   
   public int getCount(QM qm) {
     return this.dao.getCount(qm);
   }
   
   public List<M> getAll() { return this.dao.getAll(); }
   
   public List<M> getByCondition(QM qm) {
     return this.dao.getByCondition(qm);
   }
   
   public void deletes(List<String> needDeleteUuids) {
     this.dao.deletes(needDeleteUuids);
   }
   
   public void updateCell(M m, String opeCellName) {
     this.dao.updateCell(m, opeCellName);
   }
 }