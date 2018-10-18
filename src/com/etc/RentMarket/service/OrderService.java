package com.etc.RentMarket.service;


import java.util.List;

import com.etc.RentMarket.DBUtil.PageData;
import com.etc.RentMarket.entity.Order;

/**
 * 订单管理服务层接口
 * @author 陈伟杰
 *
 */
public interface OrderService {
	/**
	 * 根据用户名查询订单并分页+模糊查询
	 * @param page 页数
	 * @param pageSize 一页的记录数
	 * @param userName 用户名
	 * @param keywords 关键字
	 * @return
	 */
	PageData<Order> queryOrdersByPage(int page, int pageSize,String userName,String keywords);
	
	
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
	public List<Order> selOrders();
	
	public boolean upOrders(Order order);//更新订单
	
	public boolean delOrders(int orderId);//删除订单
	
	public boolean delMuchOrders(List<Integer> ordersIds);//批量删除订单
	
	public List<Order> queryOrdersByOrderId2(int orderId);//
	
	/**
	 * 更改订单状态
	 * @param orderState
	 * @return
	 */
	boolean updateOrderState(int orderState,int orderId,String goodName);
}
