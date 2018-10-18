package com.etc.RentMarket.dao;

import java.util.List;

import com.etc.RentMarket.entity.PhoneGood;

public interface PhoneGoodDao {
	public List<PhoneGood> selectPhone();//查询手机-一加
	
	public List<PhoneGood> selectPhone1();//查询手机-vivo
}
