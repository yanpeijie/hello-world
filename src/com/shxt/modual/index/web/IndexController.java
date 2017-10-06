package com.shxt.modual.index.web;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.shxt.modual.privilege.domain.Privilege;
import com.shxt.modual.privilege.service.PrivilegeService;
import com.shxt.modual.userinfo.domain.Userinfo;
import com.shxt.modual.userinfo.service.UserinfoService;

@Controller
@RequestMapping
public class IndexController {
	@Autowired
	private UserinfoService userinfoServ;
	@Autowired
	private PrivilegeService privilegeServ;
	
	
	/** 
	 * 进入登录页面
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年7月2日 下午1:12:09
	 * @参数:@return 
	 * @返回值：ModelAndView
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)   
	public ModelAndView loginShow() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	@RequestMapping(value="/zhuce", method=RequestMethod.GET)   
	public ModelAndView zhuceShow() {
		ModelAndView mav = new ModelAndView("zhuce");
		return mav;
	}
	/** 
	 * 执行登录功能
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年7月2日 下午1:12:09
	 * @参数:@return 
	 * @返回值：ModelAndView
	 */
	@RequestMapping(value="/login", method=RequestMethod.POST)   
	public ModelAndView login(Userinfo param, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		Userinfo userinfo = userinfoServ.login(param);
		
		if(userinfo == null) {
			mav.setViewName("login");
			mav.addObject("m", "账号或者密码错误");
			return mav;
		}
		//登录成功
		//记录登录者的信息
		session.setAttribute("id", userinfo.getId());
		//调到首页
		mav.setViewName("redirect:index");
		return mav;
	}
	@RequestMapping(value="/zhuce", method=RequestMethod.POST)   
	public ModelAndView zhuce(Userinfo param, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Userinfo userinfo = userinfoServ.login(param);
		if(userinfo != null) {
			mav.setViewName("zhuce");
			mav.addObject("m", "账号已存在");
			return mav;
		}
		
		userinfoServ.add(param);
		//注册成功
		//调到登陆页面
		//做个弹窗提示注册成功
		mav.setViewName("redirect:login");
		return mav;
	}
	/** 
	 * 首页
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年7月2日 下午1:30:15
	 * @参数:@return 
	 * @返回值：ModelAndView
	 */
	@RequestMapping("/index")   
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index/index");
		return mav;
	}
	/** 
	 * 左侧菜单
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年7月2日 下午1:33:14
	 * @参数:@return 
	 * @返回值：ModelAndView
	 */
	@RequestMapping("/showMenu")   
	public ModelAndView showMenu(HttpSession session) {
		ModelAndView mav = new ModelAndView("index/left1");
		String id = (String)session.getAttribute("id");
		System.out.println("登陆者id"+id);
		List<Privilege> list = privilegeServ.listByUserinfo(id);
		mav.addObject("list", list);
		return mav;
	}
}
