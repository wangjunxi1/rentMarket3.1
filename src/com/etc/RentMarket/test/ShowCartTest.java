package com.etc.RentMarket.test;

import java.util.ArrayList;
import java.util.List;

import com.etc.RentMarket.service.impl.ShoppingCartServiceImpl;

public class ShowCartTest {
	public static void main(String[] args) {
		ShoppingCartServiceImpl scs= new ShoppingCartServiceImpl();
		List<Integer> list = new ArrayList<Integer>();
		list.add(3);
		list.add(4);
		System.out.println(scs.selGoodByGoodId(list));
		
	}
}
