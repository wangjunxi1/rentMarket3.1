package com.etc.RentMarket.test;

import java.util.List;

import com.etc.RentMarket.entity.Goodstype;
import com.etc.RentMarket.service.GoodService;
import com.etc.RentMarket.service.impl.GoodServiceImpl;

public class typeTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GoodService gs=new GoodServiceImpl();
		List<Goodstype> list=gs.selectAllType();
		System.out.println(list);
	}

}
