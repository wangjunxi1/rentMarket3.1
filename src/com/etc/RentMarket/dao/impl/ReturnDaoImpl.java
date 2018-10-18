package com.etc.RentMarket.dao.impl;

import java.util.List;

import com.etc.RentMarket.DBUtil.BaseDao;
import com.etc.RentMarket.dao.ReturnDao;
import com.etc.RentMarket.entity.Good;
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
	/**
	 * 添加评论
	 */
	@Override
	public boolean addComment(int userId,int goodId,String content) {
		// TODO Auto-generated method stub
		String sql = "insert into evaluate(userId,goodId,evaluateContent,evaluateDate) values (?,?,?,NOW())";
		return BaseDao.execute(sql, userId,goodId,content)>0;
	}
	/**
	 * 查询商品Id
	 */
	@Override
	public int queryGoodId(String goodName) {
		// TODO Auto-generated method stub
		String sql = "select goodId from good where goodName = ?";
		List<Good> list = (List<Good>) BaseDao.select(sql, Good.class, goodName);
		int goodId = list.get(0).getGoodId();
		return goodId;
	}

}
