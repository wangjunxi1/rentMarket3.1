package com.etc.RentMarket.dao.impl;

import com.etc.RentMarket.DBUtil.BaseDao;
import com.etc.RentMarket.dao.OrderDetailDao;
import com.etc.RentMarket.entity.Orderdetail;

public class OrderDetailDaoImpl implements OrderDetailDao{

	@Override
	public boolean insertOrderDetail(Orderdetail orderdetail) {
		String sql="INSERT INTO orderdetail (orderId, goodName, goodNumber, rentDate, goodImg, rentPrice) VALUES (?, ?, ?, ?, ?, ?)";
		return BaseDao.execute(sql, orderdetail.getOrderId(),orderdetail.getGoodName(),orderdetail.getGoodNumber(),orderdetail.getRentDate(),orderdetail.getGoodImg(),orderdetail.getRentPrice())>0;
	}

}
