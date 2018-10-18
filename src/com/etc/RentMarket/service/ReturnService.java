package com.etc.RentMarket.service;

import java.util.List;

import com.etc.RentMarket.entity.Order;

/**
 * 归还服务层接口
 * @author 陈伟杰
 *
 */
public interface ReturnService {
	/**
	 * 查询订单中的商品
	 * @param orderId 订单编号
	 * @param goodName 商品名称
	 * @return
	 */
	List<Order> getOrder(int orderId,String goodName);
	/**
	 * 添加评论
	 * @param content 评论内容
	 * @return
	 */
	boolean addComment(int userId,int goodId,String content);
	/**
	 * 查询商品ID
	 * @param userName
	 * @return
	 */
	int queryGoodId(String goodName);
}
