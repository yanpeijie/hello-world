package com.shxt.modual.role.service;

import java.util.List;

import com.shxt.modual.role.domain.Role;

public interface RoleService {
	/** 
	 * 查询角色
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 上午9:31:27
	 * @参数:@return 
	 * @返回值：List<Role>
	 */
	public List<Role> list();
	
	/** 
	 * 根据id获取角色
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 下午1:49:42
	 * @参数:@param id
	 * @参数:@return 
	 * @返回值：Role
	 */
	public Role get(String id) ;
	
	/** 
	 * 修改角色拥有的用户
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 下午2:11:20
	 * @参数:@param ids
	 * @参数:@param role_id 
	 * @返回值：void
	 */
	public void editUser(String[] ids, String role_id ) ;
}
