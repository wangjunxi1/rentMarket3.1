package com.etc.RentMarket.dao;

import java.util.List;

import com.etc.RentMarket.entity.Ad;

public interface AdDao {
	public List<Ad> selectAds();
	
	public boolean addAds(Ad a);
	
	public boolean updAd(Ad a);
	
	public boolean delAd(int id);
	/**
	 * 后台批量删除广告
	 * @param ad_id
	 * @return true 操作成功  false 操作失败
	 */
	boolean delMuchAd(String id);
}
