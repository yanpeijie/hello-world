package com.shxt.modual.role.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.base.dao.BaseDao;
import com.shxt.modual.role.domain.Role;
import com.shxt.modual.role.service.RoleService;

@Service(value="roleServ")
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private BaseDao baseDao;
	
	
	/** 
	 * 查询角色
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 上午9:31:27
	 * @参数:@return 
	 * @返回值：List<Role>
	 */
	@SuppressWarnings("unchecked")
	public List<Role> list() {
		return (List<Role>)baseDao.list(Role.class);
	}
	
	/** 
	 * 根据id获取角色
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 下午1:49:42
	 * @参数:@param id
	 * @参数:@return 
	 * @返回值：Role
	 */
	public Role get(String id) {
		return (Role)baseDao.get(Role.class, id);
	}
	
	
	/** 
	 * 修改角色拥有的用户
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 下午2:11:20
	 * @参数:@param ids
	 * @参数:@param role_id 
	 * @返回值：void
	 */
	public void editUser(String[] ids, String role_id ) {
		//根据角色id，删除所有对应关系
		baseDao.delete(Role.class, "deleteUserinfoRole", role_id);
		
		//根据ids里的多个用户id，批量添加关系
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("role_id", role_id);
		map.put("ids", ids);
		
		baseDao.add(Role.class, "addBatchUserinfoRole", map);
		
	}
}
