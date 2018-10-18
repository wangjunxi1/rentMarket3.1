package com.etc.RentMarket.dao;
/**
 * 订单管理dao接口
 * @author 陈伟杰
 *
 */

import java.util.List;

import com.etc.RentMarket.DBUtil.PageData;
import com.etc.RentMarket.entity.Order;

public interface OrderDao {
	/**
	 * 根据用户名查询订单并分页+模糊查询
	 * @param page 页数
	 * @param pageSize 一页的记录数
	 * @param userName 用户名
	 * @param keywords 关键字
	 * @return
	 */
	PageData<Order> queryOrdersByPage(int page,int pageSize,String userName,String keywords);
	/**
	 * 根据订单ID查询订单信息
	 * @param orderId 订单编号
	 * @return
	 */
	List<Order> queryOrdersByOrderId(int orderId);
	/**
	 * 根据用户名查询订单id
	 * @param userName
	 * @return
	 */
	List<Order> queryOrdersIdByuserName(String userName);
	
	/**
	 * 查询订单
	 * @return
	 */
	List<Order> selOrders();
	
	/**
	 * 更新订单
	 * @return
	 */
	boolean upOrders(Order order);
	
	/**
	 * 删除订单
	 */
	boolean delOrders(int orderId);
	/**
	 * 批量删除订单
	 */
	boolean delMuchOrders(List<Integer> ordersIds);
	
	/**
	 * 根据订单ID查询订单信息(包含图片)
	 * @param orderId
	 * @return
	 */
	List<Order> queryOrdersByOrderId2(int orderId);
	/**
	 * 更改订单状态
	 * @param orderState
	 * @return
	 */
	boolean updateOrderState(int orderState,int orderId,String goodName);
	/**
	 * 插入订单
	 * @param order 订单Order实体类对象
	 * @return
	 */
	boolean insertOrders(Order order);
}
