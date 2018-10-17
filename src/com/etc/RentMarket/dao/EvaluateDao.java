package com.etc.RentMarket.dao;

import java.util.List;

import com.etc.RentMarket.entity.EvaluateBack;
import com.etc.RentMarket.entity.Reevaluate;

/**
 * 自定义商品评价Dao接口
 * @author 小白
 *
 */
public interface EvaluateDao {
	//以下是后台评价相关的操作
	/**
	 * 后台得到所有评价方法
	 * @return List 评价列表集合
	 */
	List<EvaluateBack> getEvaluates();
	
	/**
	 * 后台删除评价方法同时删除评价表和回复评价表
	 * @param evaluateId
	 * @return true 操作成功  false 操作失败
	 */
	boolean DelEvaluate(int evaluateId);
	/**
	 * 后台批量删除评价方法同时删除评价表和回复评价表
	 * @param evaluateId
	 * @return true 操作成功  false 操作失败
	 */
	boolean delMuchEvaluate(String evaluateId);
	//以下是后台回复相关的操作
	/**
	 * 后台得到所有回复方法
	 * @return List 回复列表集合
	 */
	List<Reevaluate> getREevaluate();
	
	/**
	 * 后台删除回复方法
	 * @param cid
	 * @return true 操作成功  false 操作失败
	 */
	boolean DelREevaluate(int cid);
	/**
	 * 后台批量删除回复评价方法
	 * @param cid
	 * @return true 操作成功  false 操作失败
	 */
	boolean delMuchEvaluateci(String cid);
	//以下是前台评价回复相关的操作
	/**
	 * 前台获得评论
	 * @param userName	用户名
	 * @param goodName	商品名
	 * @return
	 */
	public List<EvaluateBack> qEvaluate(String userName, String goodName) ;
}
