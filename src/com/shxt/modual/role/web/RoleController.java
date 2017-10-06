package com.shxt.modual.role.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shxt.modual.role.domain.Role;
import com.shxt.modual.role.service.RoleService;
import com.shxt.modual.userinfo.domain.Userinfo;
import com.shxt.modual.userinfo.service.UserinfoService;

/** 
 * 角色
 * @描述:
 * @作者:韩老师
 * @版本:1.0
 * @版权所有:四海兴唐
 * @时间 2017年6月25日 上午9:25:22
 */
@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private UserinfoService userinfoServ;
	
	@Autowired
	private RoleService roleServ;
	
	/** 查看页面*/  
	@RequestMapping(method=RequestMethod.GET)    
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("role/role_list");
		return mav;
	}
	
	
	
	/** 查看页面使用的数据*/  
	@RequestMapping("/data")   
	@ResponseBody
	public List<Role> data() {
		List<Role> list = roleServ.list();
		return list;
	}
	
	/**
	 * 选择用户 
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 上午10:42:17
	 * @参数:@return 
	 * @返回值：ModelAndView
	 */
	@RequestMapping(value="/chooseUserinfo")    
	public ModelAndView chooseUserinfo(String id) {
		ModelAndView mav = new ModelAndView("role/choose_userinfo");
		
		Role r = roleServ.get(id);
		mav.addObject("role", r);
		
		List<Userinfo> havList = userinfoServ.listByRole(id);
		mav.addObject("havList",havList);
		
		List<Userinfo> notList = userinfoServ.listByRoleNot(id);
		mav.addObject("notList", notList);
		
		
		return mav;
	}
	
	
	/**
	 * 
	 * @描述:查看部门信息
	 * @作者:闫沛杰
	 * @时间:2017年8月15日 下午4:09:00
	 * @参数:@param id
	 * @参数:@return 
	 * @返回值：ModelAndView
	 */
	@RequestMapping(value="/chooseUserinfoin") 
	@ResponseBody
	public ModelAndView chooseUserinfoin(String id) {
		ModelAndView mav = new ModelAndView("role/choose_userinfoin");
		Role r = roleServ.get(id);
		mav.addObject("role", r);
		List<Userinfo> havList = userinfoServ.listByRole(id);
		mav.addObject("havList",havList);
		
		/*List<Userinfo> notList = userinfoServ.listByRoleNot(id);
		mav.addObject("notList", notList);*/
		return mav;
	}
	@RequestMapping(value="/editUser") 
	public ModelAndView  editUser(String[] ids, String role_id){
		roleServ.editUser(ids, role_id);
		return null;
	}
	
	
	
}
