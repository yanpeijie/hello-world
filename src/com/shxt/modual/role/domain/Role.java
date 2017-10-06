package com.shxt.modual.role.domain;

/** 
 * 角色
 * @描述:
 * @作者:韩老师
 * @版本:1.0
 * @版权所有:四海兴唐
 * @时间 2017年6月25日 上午9:23:22
 */
public class Role {
	private String id;
	private String name;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + "]";
	}
	
	
	
}
