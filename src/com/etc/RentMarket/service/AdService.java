package com.etc.RentMarket.service;

import java.util.List;

import com.etc.RentMarket.entity.Ad;

public interface AdService {
	public List<Ad> selectAds();//查询广告

	public boolean addAds(Ad a);//添加广告
	
	public boolean updAd(Ad a);//修改广告
	
	public boolean delAd(int id);//删除广告稿
	/**
	 * 后台批量删除广告
	 * @param ad_id
	 * @return true 操作成功  false 操作失败
	 */
	boolean delMuchAd(String id);
}
