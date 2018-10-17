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

	@Override
	public List<Order> getOrder(int orderId, String goodName) {
		// TODO Auto-generated method stub
		return rd.queryOrder(orderId, goodName);
	}

}
