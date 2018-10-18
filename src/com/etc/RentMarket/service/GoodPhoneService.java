package com.etc.RentMarket.service;

import java.util.List;

import com.etc.RentMarket.entity.Ad;
import com.etc.RentMarket.entity.PhoneGood;

public interface GoodPhoneService {
	public List<PhoneGood> selectPhone();//查询手机商品-一加

	public List<PhoneGood> selectPhone1();//查询手机商品-vivo
}
