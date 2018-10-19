package com.etc.RentMarket.dao.impl;

import java.util.List;

import com.etc.RentMarket.DBUtil.BaseDao;
import com.etc.RentMarket.dao.ShoppingCartDao;
import com.etc.RentMarket.entity.Good;
import com.etc.RentMarket.entity.Shoppingcart;
/**
 * 自定义购物车ShoppingCartDao实现类
 * @author 小白
 *
 */
public class ShoppingCartDaoImpl implements ShoppingCartDao {
	/**
	 * 添加购物车
	 * @param cart 购物车对象
	 * @return true 添加成功    false 添加失败
	 */
	@Override
	public boolean addItem(Shoppingcart cart) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO shoppingcart (userId, goodId, goodNumber) SELECT DISTINCT shoppingcart.userId, ?, ? FROM shoppingcart, good, users WHERE users.userId = shoppingcart.userId AND good.goodId = shoppingcart.goodId AND shoppingcart.userId = ?";
		return BaseDao.execute(sql,cart.getGoodId(),cart.getGoodNumber(),cart.getUserId())>0;
	}
	/**
	 * 删除购物车的单件商品
	 * @param goodId 商品编号
	 * @return true 删除成功，false 删除失败
	 */
	
	@Override
	public boolean removeItem(int goodId) {
		// TODO Auto-generated method stub
		String sql="delete shoppingcart from users,shoppingcart,good where shoppingcart.userId=users.userId and shoppingcart.goodId=good.goodId and shoppingcart.goodId=?";
		return BaseDao.execute(sql, goodId)>0;
	}
	/**
	 * 显示购物车的界面
	 * @param userId 用户编号
	 * @return 购物车清单
	 */
	@Override
	public List<Shoppingcart> showShopCart(int userId) {
		// TODO Auto-generated method stub
		String sql="select good.goodName,good.goodImgAdd,good.goodPrice,shoppingcart.goodNumber,shoppingcart.goodId,shoppingcart.userId from shoppingcart,good,users where shoppingcart.goodId=good.goodId and users.userId=shoppingcart.userId and shoppingcart.userId=?";
		return (List<Shoppingcart>)BaseDao.select(sql, Shoppingcart.class, userId);
	}
	/**
	 * 更新购物车的商品数量信息
	 * @param cart 购物车对象
	 * @return true 操作成功,false 操作失败
	 */
	@Override
	public boolean updateItem(Shoppingcart cart) {
		// TODO Auto-generated method stub
		String sql="update shoppingcart,users,good set shoppingcart.goodNumber=? where shoppingcart.userId=users.userId and shoppingcart.goodId=good.goodId and shoppingcart.userId=?";
		return BaseDao.execute(sql, cart.getGoodNumber(),cart.getUserId())>0;
	}
	/**
	 * 根据商品Id查询购物车信息
	 * @param goodId 商品Id
	 * @return
	 */
	@Override
	public List<Shoppingcart> selGoodByGoodId(List<Integer> goodId) {
		
		if(goodId.size()>0) {//如果选中的数量>0
			Integer arr[] = new Integer[goodId.size()];//创建一个数组，大小为选中的数量
			
			String sql = "SELECT good.goodName,good.goodPrice,good.goodImgAdd,shoppingcart.goodNumber FROM good,shoppingcart WHERE shoppingcart.goodId=good.goodId and shoppingcart.goodId in(";//拼接sql语句
			for (int i = 0 ;i<goodId.size() ;i++) {
				sql += "?,";
				arr[i]=goodId.get(i);
			}
			sql=sql.substring(0, sql.length()-1);
			sql += ")";
			
			
			return (List<Shoppingcart>) BaseDao.select(sql, Shoppingcart.class, arr);
			}else {
				return null;
			}
		
		
	}
	
	/**
	 * 批量删除购物车的信息
	 * @param goodId 购物车商品的Id
	 */
	@Override
	public boolean delMuchShopCart(List<Integer> goodId) {
		if(goodId.size()>0) {//如果选中的数量>0
			Integer arr[] = new Integer[goodId.size()];//创建一个数组，大小为选中的数量
			
			String sql = "delete from shoppingcart where goodId in (";//拼接sql语句
			for (int i = 0 ;i<goodId.size() ;i++) {
				sql += "?,";
				arr[i]=goodId.get(i);
			}
			sql=sql.substring(0, sql.length()-1);
			sql += ")";
			//System.out.println(sql);
			int c = BaseDao.execute(sql, arr);//进行删除操作
			return c>0;
			}else {
				return false;
			}
	}

}
