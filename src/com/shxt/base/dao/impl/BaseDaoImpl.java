package com.shxt.base.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shxt.base.dao.BaseDao;

@Repository(value="baseDao")
public class BaseDaoImpl extends SqlSessionDaoSupport implements BaseDao {
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	/** 
	 * 添加 默认标签id是add
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 下午2:10:00
	 * @参数:@param cl
	 * @参数:@param mapperId
	 * @参数:@param praram 
	 * @返回值：void
	 */
	public void add(Class<?> cl,  Object praram) {
		getSqlSession().insert(cl.getName() + ".add", praram);
	}
	
	/** 
	 * 添加
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 下午2:10:00
	 * @参数:@param cl
	 * @参数:@param mapperId
	 * @参数:@param praram 
	 * @返回值：void
	 */
	public void add(Class<?> cl, String mapperId, Object praram) {
		getSqlSession().insert(cl.getName() + "." + mapperId, praram);
	}
	
	
	/** 
	 * 基础查询，默认的标签id值：list
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 上午10:51:00
	 * @参数:@param cl
	 * @参数:@return 
	 * @返回值：List<?>
	 */
	public List<?> list(Class<?> cl) {
		return getSqlSession().selectList(cl.getName() + ".list");
	}
	
	/** 
	 * 查询，自定义标签id
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 上午10:53:57
	 * @参数:@param cl
	 * @参数:@param mapperId 标签的id
	 * @参数:@return 
	 * @返回值：List<?>
	 */
	public List<?> list(Class<?> cl, String mapperId) {
		return getSqlSession().selectList(cl.getName() + "." + mapperId);
	}
	
	/** 
	 * 查询，自定义标签id，带条件
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 上午10:59:39
	 * @参数:@param cl
	 * @参数:@param mapperId
	 * @参数:@param param
	 * @参数:@return 
	 * @返回值：List<?>
	 */
	public List<?> list(Class<?> cl, String mapperId, Object param) {
		return getSqlSession().selectList(cl.getName() + "." + mapperId, param);
	}
	
	/** 
	 * @描述:根据 id主键获取对象
	 * @作者:韩老师
	 * @时间:2017年6月25日 下午1:48:55
	 * @参数:@param cl
	 * @参数:@param id
	 * @参数:@return 
	 * @返回值：Object
	 */
	public Object get(Class<?> cl, String id) {
		return getSqlSession().selectOne(cl.getName() + ".get", id);
	}
	
	
	/** 
	 * 修改
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 下午2:04:44
	 * @参数:@param cl
	 * @参数:@param mapperId
	 * @参数:@param praram 
	 * @返回值：void
	 */
	public void update(Class<?> cl, String mapperId, Object praram){
		getSqlSession().update(cl.getName() + "." + mapperId, praram);
	}
	
	/** 
	 * 删除
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 下午2:04:44
	 * @参数:@param cl
	 * @参数:@param mapperId
	 * @参数:@param praram 
	 * @返回值：void
	 */
	public void delete(Class<?> cl, String mapperId, Object praram) {
		getSqlSession().delete(cl.getName() + "." + mapperId, praram);
	}
	
	
	/** 
	 * 根据条件，查询一条数据
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年7月2日 下午1:20:59
	 * @参数:@param cl
	 * @参数:@param mapperId
	 * @参数:@param param
	 * @参数:@return 
	 * @返回值：Object
	 */
	public Object query(Class<?> cl, String mapperId, Object param) {
		return getSqlSession().selectOne(cl.getName() + "." + mapperId, param);
	}
	
}
