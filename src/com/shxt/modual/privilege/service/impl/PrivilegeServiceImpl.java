package com.shxt.modual.privilege.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.base.dao.BaseDao;
import com.shxt.modual.privilege.domain.Privilege;
import com.shxt.modual.privilege.service.PrivilegeService;


@Service("privilegeServ")
public class PrivilegeServiceImpl implements PrivilegeService {
	@Autowired
	private BaseDao baseDao;
	/** 
	 * 根据用户获取权限
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年7月2日 下午2:03:12
	 * @参数:@param userinfo_id
	 * @参数:@return 
	 * @返回值：List<Privilege>
	 */
	@SuppressWarnings("unchecked")
	public List<Privilege> listByUserinfo(String userinfo_id) {
		List<Privilege> allList = (List<Privilege>)baseDao.list(Privilege.class, "listByUserinfo", userinfo_id);
	
		/*for(int i=0;i<allList.size();i++){
			System.out.println(allList.get(i).getLevel());
		}*/
        
		//一级权限集合
		List<Privilege> oneList = new ArrayList<Privilege>();
		//一级权限map对象 key ：一级权限id  value：一级权限对象
		Map<String, Privilege> map = new HashMap<String, Privilege>();
		Privilege parent;
		//遍历所有的权限
		for(Privilege p : allList) {
			System.out.println("当前权限="+p.getLevel());
			//判断当前的权限
			if(p.getLevel() == 1) {//一级
				oneList.add(p);
				map.put(p.getId(), p);
			}else {
				//根据父级id找到父级对象n 
				System.out.println("父级id="+p.getParent_id());
				parent = map.get(p.getParent_id());
				System.out.println("parent="+parent);
				if(parent.getChilds() == null){
					parent.setChilds(new ArrayList<Privilege>());
				}
				parent.getChilds().add(p);
			}
		}
		return oneList;
	}
}
