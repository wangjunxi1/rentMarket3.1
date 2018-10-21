package com.etc.RentMarket.service.impl;

import java.util.List;

import com.etc.RentMarket.dao.AdDao;
import com.etc.RentMarket.dao.impl.AdDaoImpl;
import com.etc.RentMarket.entity.Ad;
import com.etc.RentMarket.service.AdService;

public class AdServiceImpl implements AdService {
	private AdDao ad= new AdDaoImpl();
	/**
	 * 广告信息查询
	 */
	@Override
	public List<Ad> selectAds() {
		// TODO Auto-generated method stub
		return ad.selectAds();
	}

	@Override
	public boolean addAds(Ad a) {
		// TODO Auto-generated method stub
		return ad.addAds(a);
	}
	
	@Override
	public boolean updAd(Ad a) {
		// TODO 自动生成的方法存根
		return ad.updAd(a);
	}
	
	@Override
	public boolean delAd(int id) {
		// TODO Auto-generated method stub
		return ad.delAd(id);
	}
	/**
	 * 后台批量删除广告
	 * @param ad_id
	 * @return true 操作成功  false 操作失败
	 */
	@Override
	public boolean delMuchAd(String id) {
		// TODO Auto-generated method stub
		return ad.delMuchAd(id);
	}
}
