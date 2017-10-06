package com.shxt.modual.userinfo.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.shxt.modual.userinfo.domain.Userinfo;
import com.shxt.modual.userinfo.service.UserinfoService;

@Controller
@RequestMapping("/userinfo")
public class UserinfoController {
	@Autowired
	private UserinfoService userinfoServ;
	/** 查看页面*/  
	@RequestMapping(method=RequestMethod.GET)    
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("userinfo/userinfo_list");
		List<Userinfo> list=userinfoServ.listByRole("2");
		System.out.println(list);
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping(value="list")
	public ModelAndView Ulist(){
		ModelAndView mav= new ModelAndView("userinfo/userinfo_list");
		return mav;
	}
	@RequestMapping(value="add")
	public ModelAndView Uadd(){
		ModelAndView mav= new ModelAndView("userinfo/userinfo_add");
		return mav;
	}
}
