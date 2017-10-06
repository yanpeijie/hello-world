package com.shxt.base.dao;

import java.util.List;

public interface BaseDao {
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
	public void add(Class<?> cl,  Object praram) ;
	
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
	public void add(Class<?> cl, String mapperId, Object praram) ;
	
	/** 
	 * 基础查询，默认的标签id值：list
	 * @描述:
	 * @作者:韩老师
	 * @时间:2017年6月25日 上午10:51:00
	 * @参数:@param cl
	 * @参数:@return 
	 * @返回值：List<?>
	 */
	public List<?> list(Class<?> cl) ;
	
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
	public List<?> list(Class<?> cl, String mapperId);
	
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
	public List<?> list(Class<?> cl, String mapperId, Object param) ;
	
	/** 
	 * @描述:根据 id主键获取对象
	 * @作者:韩老师
	 * @时间:2017年6月25日 下午1:48:55
	 * @参数:@param cl
	 * @参数:@param id
	 * @参数:@return 
	 * @返回值：Object
	 */
	public Object get(Class<?> cl, String id);
	
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
	public void update(Class<?> cl, String mapperId, Object praram);
	
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
	public void delete(Class<?> cl, String mapperId, Object praram);
	
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
	public Object query(Class<?> cl, String mapperId, Object param);
}
