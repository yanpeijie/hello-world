package com.shxt.modual.userinfo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.base.dao.BaseDao;
import com.shxt.modual.userinfo.domain.Userinfo;
import com.shxt.modual.userinfo.service.UserinfoService;

@Service(value="userinfoServ")
public class UserinfoServiceImpl implements UserinfoService {
	@Autowired
	private BaseDao baseDao;
	
	
	/** 
	 * 查询角色拥有的用户
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 上午10:55:03
	 * @参数:@return 
	 * @返回值：List<Userinfo>
	 */
	@SuppressWarnings("unchecked")
	public List<Userinfo> listByRole(String role_id) {
		return (List<Userinfo>)baseDao.list(Userinfo.class, "listByRole", role_id);
	}
	
	/** 
	 * 查询角色没有的用户
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 上午10:55:19
	 * @参数:@return 
	 * @返回值：List<Userinfo>
	 */
	@SuppressWarnings("unchecked")
	public List<Userinfo> listByRoleNot(String role_id) {
		return (List<Userinfo>)baseDao.list(Userinfo.class, "listByRoleNot", role_id);
	}
	
	/** 
	 * 登录查询用户
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年7月2日 下午1:22:22
	 * @参数:@param param
	 * @参数:@return 
	 * @返回值：Userinfo
	 */
	public Userinfo login(Userinfo param) {
		return (Userinfo)baseDao.query(Userinfo.class, "queryByLogin", param);
	}
	/**
	 * 注册添加用户信息
	 * @描述:
	 * @作者:闫沛杰
	 * @时间:2017年8月17日 上午11:29:43
	 * @参数:@param param 
	 * @返回值：void
	 */
	public void add(Userinfo param){
		baseDao.add(Userinfo.class, param);
	}
}
