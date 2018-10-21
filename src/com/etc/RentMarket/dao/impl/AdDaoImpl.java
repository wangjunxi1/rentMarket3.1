package com.etc.RentMarket.dao.impl;

import java.util.List;

import com.etc.RentMarket.DBUtil.BaseDao;
import com.etc.RentMarket.dao.AdDao;
import com.etc.RentMarket.entity.Ad;
import com.etc.RentMarket.entity.Uesrslist;

public class AdDaoImpl implements AdDao {

	@Override
	public List<Ad> selectAds() {
		// TODO Auto-generated method stub
		String sql = "select * from ad";
		List<Ad> list = (List<Ad>) BaseDao.select(sql, Ad.class);
		for (Ad ad : list) {
			if ("0".equals(ad.getAd_state())) {
				ad.setAd_state("未激活");
			} else {
				ad.setAd_state("激活");
			} 
		}
		return list;
	}
	
	@Override
	public boolean addAds(Ad a) {
		// TODO Auto-generated method stub
		String sql = "insert into ad(ad_content,ad_picture,ad_productor,ad_beginDate,ad_day,ad_state)values(?,?,?,now(),?,?)";
		return BaseDao.execute(sql, a.getad_content(),a.getad_picture(),a.getad_productor(),a.getAd_day(),a.getAd_state())>0;
	}
	
	@Override
	public boolean updAd(Ad a) {
		// TODO 自动生成的方法存根
		String sql = "update ad set ad_content=?,ad_picture=?,ad_productor=?,ad_endDate=now(),ad_day=?,ad_state=? where ad_id=?";
		return BaseDao.execute(sql,  a.getad_content(),a.getad_picture(),a.getad_productor(),a.getAd_day(),a.getAd_state(),a.getad_id())>0;
	}
	
	@Override
	public boolean delAd(int id) {
		// TODO Auto-generated method stub
		String sql = "delete from ad where ad_id=?";
		return BaseDao.execute(sql, id)>0;
	}
	/**
	 * 后台批量删除广告
	 * @param ad_id
	 * @return true 操作成功  false 操作失败
	 */
	@Override
	public boolean delMuchAd(String id) {
		// TODO Auto-generated method stub
		String sql="delete from ad where ad_id in ("+id+")";
		return BaseDao.execute(sql)>0;
	}
}
