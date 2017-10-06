package com.shxt.modual.userinfo.domain;

/** 
 * 
 * 用户
 * @描述:
 * @作者:韩老师
 * @版本:1.0
 * @版权所有:四海兴唐
 * @时间 2017年6月25日 上午10:34:10
 */
public class Userinfo {
	private String id;
	private String realname;
	private String account;
	private String password;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Userinfo [id=" + id + ", realname=" + realname + ", account=" + account + ", password=" + password
				+ "]";
	}
}
