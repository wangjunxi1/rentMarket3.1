package com.etc.RentMarket.dao;
/**
 * 归还接口
 * @author 陈伟杰
 *
 */

import java.util.List;

import com.etc.RentMarket.entity.Order;

public interface ReturnDao {
	/**
	 * 查询订单中的商品
	 * @param orderId 订单编号
	 * @param goodName 商品名称
	 * @return
	 */
	List<Order> queryOrder(int orderId,String goodName);

}
