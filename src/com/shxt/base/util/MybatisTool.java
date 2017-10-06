package com.shxt.base.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/** 
 * mybatis工具类
 * @描述:
 * @作者:韩老师
 * @版本:1.0
 * @版权所有:四海兴唐
 * @时间 2017年5月18日 下午6:40:08
 */
public class MybatisTool {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static{
		try {
			//1.读取mybatis核心配置文件
			InputStream inputStream = Resources.getResourceAsStream("mybatis.xml");
			
			//2.创建session工厂 -- 重量级的对象
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	/** 
	 * 获取session对象
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年5月18日 下午6:39:54
	 * @参数:@return 
	 * @返回值：SqlSession
	 */
	public static SqlSession getSqlSession()  {
		return sqlSessionFactory.openSession();
	}
}
