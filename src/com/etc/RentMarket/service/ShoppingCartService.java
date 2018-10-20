package com.etc.RentMarket.service;

import java.util.List;

import com.etc.RentMarket.entity.Shoppingcart;

/**
 * 自定义购物车ShoppingCartService接口
 * @author 小白
 *
 */
public interface ShoppingCartService {
	/**
	 * 添加购物车
	 * @param cart 购物车对象
	 * @return true 添加成功   , false 添加失败
	 */
	boolean addItem(Shoppingcart cart);
	/**
	 * 删除购物车的商品
	 * @param goodId 商品编号
	 * @return true 删除成功,false 删除失败
	 */
	boolean removeItem(int goodId);
	/**
	 * 显示购物车的界面
	 * @param userId 用户编号
	 * @return 购物车清单
	 */
	List<Shoppingcart> showShopCart(int userId);
	/**
	 * 更新购物车的商品数量信息
	 * @param cart 购物车对象
	 * @return true 操作成功,false 操作失败
	 */
	boolean updateItem(Shoppingcart cart);
	/**
	 * 根据商品Id查询购物车信息
	 * @param goodId 商品Id
	 * @return
	 */
	public List<Shoppingcart> selGoodByGoodId(List<Integer> goodId);
	/**
	 * 批量删除购物车的信息
	 * @param goodId 商品信息
	 */
	boolean delMuchShopCart(List<Integer> goodId) ;
	/**
	 * 清空购物车
	 * @param userId 用户Id
	 * @return true 删除成功
	 */
	public boolean removeAllItem(int userId);
	/**
	 * 更新购物车商品租赁的天数
	 * @param rentDays 租赁天数
	 * @param goodId 商品的Id
	 * @return
	 */
	public boolean insertDays(int goodId,int rentDays);
}
