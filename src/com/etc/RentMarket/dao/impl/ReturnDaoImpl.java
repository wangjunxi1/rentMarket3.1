package com.etc.RentMarket.dao.impl;

import java.util.List;

import com.etc.RentMarket.DBUtil.BaseDao;
import com.etc.RentMarket.dao.ReturnDao;
import com.etc.RentMarket.entity.Order;

/**
 * 归还接口的实现类
 * @author 陈伟杰
 *
 */
public class ReturnDaoImpl implements ReturnDao{
/**
 * 查询订单中的商品
 */
	@Override
	public List<Order> queryOrder(int orderId, String goodName) {
		// TODO Auto-generated method stub
		String sql = "SELECT orders.orderId,orders.orderState,orders.orderDate,orders.orderTPrice,orderdetail.goodName,orderdetail.rentDate,orderdetail.goodNumber,orderdetail.goodImg " + 
				" FROM orders " + 
				" INNER JOIN orderdetail " + 
				" ON orders.orderId = orderdetail.orderId " + 
				" WHERE orders.orderId = ? AND orderdetail.goodName = ?";
		List<Order> list = (List<Order>) BaseDao.select(sql, Order.class, orderId,goodName);
		return list;
	}

}
