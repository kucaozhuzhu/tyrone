package com.tyrone.baseframework.base.vo;

public class DataTablesPageParam { 
	private String name;
	private Object value;
   
   public DataTablesPageParam() {}
   
   public String getName() { return this.name; }
   
   public void setName(String name)
   {
     this.name = name;
   }
   
   public Object getValue() {
     return this.value;
   }
   
   public void setValue(Object value) {
     this.value = value;
   }
 }
