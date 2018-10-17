package com.etc.RentMarket.test;

import java.util.List;

import com.etc.RentMarket.entity.Shoppingcart;
import com.etc.RentMarket.service.UsersService;
import com.etc.RentMarket.service.impl.ShoppingCartServiceImpl;
import com.etc.RentMarket.service.impl.UsersServiceImpl;

public class ShowCartTest {
	public static void main(String[] args) {
		ShoppingCartServiceImpl scs= new ShoppingCartServiceImpl();
		UsersService us=new UsersServiceImpl();
		int userId=us.getUserIdByUserName("azhuge");
		System.out.println(userId);
		List<Shoppingcart> list = scs.showShopCart(userId);
		System.out.println(list);
	}
}
