package com.etc.RentMarket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.RentMarket.entity.Shoppingcart;
import com.etc.RentMarket.entity.User;
import com.etc.RentMarket.service.ShoppingCartService;
import com.etc.RentMarket.service.UsersService;
import com.etc.RentMarket.service.impl.ShoppingCartServiceImpl;
import com.etc.RentMarket.service.impl.UsersServiceImpl;

/**
 * 自定义购物车ShoppingcartServlet
 * 
 * @author 小白
 */
@WebServlet("/shopcart.do")
public class ShoppingcartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ShoppingCartService sc = new ShoppingCartServiceImpl();
	UsersService us = new UsersServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShoppingcartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String op = "";
		if (request.getParameter("op") != null) {
			op = request.getParameter("op");
		}
		// 1、显示购物车信息

		if ("showCart".equals(op)) {

			doGetCarts(request, response);
		}
		// 2、添加购物车
		else if ("addCart".equals(op)) {
			doAddCarts(request, response);
		}
		// 3、删除购物车商品
		else if ("delCart".equals(op)) {
			doDelCarts(request, response);
		}
		// 4、更新购物车商品
		else if ("updateCart".equals(op)) {
			doUpdateCarts(request, response);
		}else if("selGoodById".equals(op)) {
			selGoodById(request, response);
		}
	}

	/**
	 * 1、显示购物车信息
	 */
	protected void doGetCarts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 调用service的分页方法返回一个pageData对象
		User u = (User) request.getSession().getAttribute("user");
		String userName = u.getUserName();
	
		//String userName = request.getParameter("userName");

		// 通过userName得到userId
		int userId = us.getUserIdByUserName(userName);

		List<Shoppingcart> list = sc.showShopCart(userId);

		request.setAttribute("shopcart", list);
		request.setAttribute("userName", userName);
		request.getRequestDispatcher("front/myShopCart.jsp").forward(request, response);
		// Ajax来实现
		// 返回数据最好是json格式 外部的jar包 gson
		/*
		 * MyData<Shoppingcart> md = new MyData<Shoppingcart>(); md.setData(list); Gson
		 * gson = new Gson(); String jsonString = gson.toJson(md); // 使用printWriter对象
		 * PrintWriter out = response.getWriter(); out.print(jsonString); out.close();
		 */
	}

	/**
	 * 2、添加购物车
	 */
	protected void doAddCarts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 获取传参数据
		String userName = request.getParameter("userName");
		int goodId = Integer.valueOf(request.getParameter("goodId"));
		int goodNumber = Integer.valueOf(request.getParameter("goodNumber"));
		
		// 通过userName得到userId
		int userId = us.getUserIdByUserName(userName);
		// 创建一个Shoppingcart对象
		Shoppingcart cart = new Shoppingcart(goodNumber, userId, goodId);
		boolean flag = sc.addItem(cart);
		// 使用printWriter对象
		PrintWriter out = response.getWriter();
		out.print(flag);
		out.close();
		// request.getRequestDispatcher("front/myShopCart.jsp").forward(request,
		// response);

	}

	/**
	 * 3、删除购物车商品
	 */
	protected void doDelCarts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 获取传参数据
		String userName = request.getParameter("userName");
		int goodId = Integer.valueOf(request.getParameter("goodId"));
		// 调用ShoppingCartService删除方法
		boolean flag = sc.removeItem(goodId);
		// 使用printWriter对象
		// PrintWriter out = response.getWriter();
		int userId = us.getUserIdByUserName(userName);

		List<Shoppingcart> list = sc.showShopCart(userId);

		request.setAttribute("shopcart", list);
		if (flag) {
			
			request.getRequestDispatcher("shopcart.do?op=showCart").forward(request, response);
		}

	}

	/**
	 * 4、更新购物车商品
	 */
	protected void doUpdateCarts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 获取传参数据
		String userName = request.getParameter("userName");
		int goodNumber = Integer.valueOf(request.getParameter("goodNumber"));
		// 通过userName得到userId
		int userId = us.getUserIdByUserName(userName);
		// 创建一个Shoppingcart对象
		Shoppingcart cart = new Shoppingcart(goodNumber, userId);
		// 调用ShoppingCartService更新方法
		boolean flag = sc.updateItem(cart);
		// 使用printWriter对象
		PrintWriter out = response.getWriter();
		out.print(flag);
		out.close();
	}
	
	protected void selGoodById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {//根据商品Id查询购物车信息
		ShoppingCartServiceImpl scs= new ShoppingCartServiceImpl();
		String goods = request.getParameter("goodId");
		String totalPrice =request.getParameter("totalPrice");
		
		String arr[] = goods.split(",");

		List<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < arr.length; i++) {
			list.add(Integer.valueOf(arr[i]));
		}
		
		List<Shoppingcart> shopCartlist = scs.selGoodByGoodId(list);
		// System.out.println("shopser"+shopCartlist);
		request.setAttribute("goodIdlist", list);
		request.setAttribute("shopCartlist", shopCartlist);
		request.setAttribute("total", totalPrice);
		request.getRequestDispatcher("front/order.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
