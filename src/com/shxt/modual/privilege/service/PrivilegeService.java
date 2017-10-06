package com.shxt.modual.privilege.service;

import java.util.List;

import com.shxt.modual.privilege.domain.Privilege;

public interface PrivilegeService {
	
	/** 
	 * 根据用户获取权限
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年7月2日 下午2:03:12
	 * @参数:@param userinfo_id
	 * @参数:@return 
	 * @返回值：List<Privilege>
	 */
	public List<Privilege> listByUserinfo(String userinfo_id);
}
