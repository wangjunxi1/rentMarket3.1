package com.etc.RentMarket.service.impl;

import java.util.List;

import com.etc.RentMarket.dao.ReturnDao;
import com.etc.RentMarket.dao.impl.ReturnDaoImpl;
import com.etc.RentMarket.entity.Order;
import com.etc.RentMarket.service.ReturnService;

/**
 * 归还服务层接口的实现类
 * @author 陈伟杰
 *
 */
public class ReturnServiceImpl implements ReturnService{
	ReturnDao rd = new ReturnDaoImpl();
	/**
	 * 查询商品
	 */
	@Override
	public List<Order> getOrder(int orderId, String goodName) {
		// TODO Auto-generated method stub
		return rd.queryOrder(orderId, goodName);
	}
	/**
	 * 查询商品Id
	 */
@Override
public int queryGoodId(String goodName) {
	// TODO Auto-generated method stub
	return rd.queryGoodId(goodName);
}

/**
 * 添加评论
 */
	@Override
	public boolean addComment(int userId, int goodId, String content) {
		// TODO Auto-generated method stub
		return rd.addComment(userId, goodId, content);
	}

}
