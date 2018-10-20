package com.etc.RentMarket.service.impl;

import com.etc.RentMarket.dao.impl.OrderDetailDaoImpl;
import com.etc.RentMarket.entity.Orderdetail;
import com.etc.RentMarket.service.OrderDetailService;

public class OrderDetailServiceImpl implements OrderDetailService{
	OrderDetailDaoImpl odd= new OrderDetailDaoImpl();
	@Override
	public boolean insertOrderDetail(Orderdetail orderdetail) {
		// TODO Auto-generated method stub
		return odd.insertOrderDetail(orderdetail);
	}

}
