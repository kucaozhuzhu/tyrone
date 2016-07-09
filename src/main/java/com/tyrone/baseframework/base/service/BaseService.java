package com.tyrone.baseframework.base.service;

import java.util.List;

import com.tyrone.baseframework.base.vo.BaseModel;


public abstract interface BaseService<M extends BaseModel, QM extends M>
{
  public abstract String create(M paramM);
  
  public abstract void update(M paramM);
  
  public abstract void updateCell(M paramM, String paramString);
  
  public abstract void delete(M paramM);
  
  public abstract void deletes(List<String> paramList);
  
  public abstract M getByUuid(String paramString);
  
  public abstract List<M> getAll();
  
  public abstract List<M> getAll(int paramInt1, int paramInt2);
  
  public abstract List<M> getByCondition(QM paramQM);
  
  public abstract List<M> getByCondition(QM paramQM, int paramInt1, int paramInt2);
  
  public abstract int getCount(QM paramQM);
}
