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

import com.etc.RentMarket.DBUtil.MyData;
import com.etc.RentMarket.DBUtil.PageData;
import com.etc.RentMarket.entity.Good;
import com.etc.RentMarket.entity.Order;
import com.etc.RentMarket.entity.Orderdetail;
import com.etc.RentMarket.entity.User;
import com.etc.RentMarket.service.OrderService;
import com.etc.RentMarket.service.impl.GoodServiceImpl;
import com.etc.RentMarket.service.impl.OrderDetailServiceImpl;
import com.etc.RentMarket.service.impl.OrderServiceImpl;
import com.etc.RentMarket.service.impl.ShoppingCartServiceImpl;
import com.google.gson.Gson;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/os.do")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String op = request.getParameter("op");
		Gson gson = new Gson();
		OrderService os = new OrderServiceImpl();
		if ("sel".equals(op)) {
			int page = 1;
			int pageSize = 2;
			String userName = "";
			String keywords = "";
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			if (request.getParameter("pageSize") != null) {
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			}
			if (request.getSession().getAttribute("user") != null) {
				User user = (User) request.getSession().getAttribute("user");
				userName = user.getUserName();
			}
			if (request.getParameter("keywords") != null) {
				
				keywords = request.getParameter("keywords");
			}

			PageData<Order> pd = os.queryOrdersByPage(page, pageSize, userName, keywords);
			request.setAttribute("keywords", keywords);
				request.setAttribute("pd", pd);
				request.getRequestDispatcher("front/list-receive.jsp").forward(request, response);
		}else if ("selOrderInfo".equals(op)) {//查询订单表信息
			List<Order> orders = os.selOrders();
			MyData<Order> md = new MyData<Order>();
			md.setData(orders);
			String jsonString = gson.toJson(md);
			out.print(jsonString);
			
			out.close();
		}else if ("upInfo".equals(op)) {//更新信息
			String orderId=request.getParameter("orderId");
			String userName=request.getParameter("userName");
			String userTel=request.getParameter("userTel");
			String userAddress=request.getParameter("userAddress");
			String orderDate=request.getParameter("orderDate");
			String orderTPrice=request.getParameter("orderTPrice");
			String orderState=request.getParameter("orderState");
			Order order = new Order(Integer.parseInt(orderId), orderDate, Integer.parseInt(orderState), Double.parseDouble(orderTPrice), userAddress, userName, userTel);
			boolean flag = os.upOrders(order);
			out.println(flag);
		}else if("delOrder".equals(op)) {//删除订单
			String id = request.getParameter("id");
			boolean flag = os.delOrders(Integer.valueOf(id));
			out.println(flag);
		}else if("delMuchOrders".equals(op)) {
			String ordersIds= request.getParameter("ids");
			String arr[]=ordersIds.split(",");
			
			List<Integer> list = new ArrayList<Integer>();
			for (int i =0;i<arr.length;i++) {
				list.add(Integer.valueOf(arr[i]));
			}
			//System.out.println(list);
			boolean flag = os.delMuchOrders(list);
			if(flag) {
				
				out.print(flag);
			}else {
				out.print(flag);
			}
			out.close();
		}else if ("insert".equals(op)) {
			String userName=request.getParameter("userName");
			String orderDate=request.getParameter("orderDate");
			String orderTPrice=request.getParameter("orderTPrice");
			String userAddress=request.getParameter("userAddress");
			String userTel=request.getParameter("userTel");
			String goodIdlist=request.getParameter("goodId");
			String goodNums=request.getParameter("goodNum");
			goodNums=goodNums.substring(0,goodNums.length()-1);
			String rentDays=request.getParameter("rentDays");
			GoodServiceImpl gsi = new GoodServiceImpl();
			ShoppingCartServiceImpl scs = new ShoppingCartServiceImpl();
			OrderDetailServiceImpl odsi = new OrderDetailServiceImpl();
			String arrrentDays[]=rentDays.split(",");
			String arrgoodNums[]=goodNums.split(",");
			
			
			//插入订单
			Order order = new Order(orderDate, Double.parseDouble(orderTPrice) , userAddress, userName, userTel);
			boolean isInsertOrder = os.insertOrders(order);
			//根据用户名查询用户Id
			List<Order> orders=os.queryOrdersIdByuserName(userName);
			
			String arr[] = goodIdlist.split(",");
			List<Integer> list = new ArrayList<Integer>();
			List<Integer>	listNums=new ArrayList<Integer>();
			for (int i = 0; i < arr.length; i++) {
				list.add(Integer.valueOf(arr[i]));
				
				//通过goodID获取good类
				List<Good> good = gsi.getgoodsByGoodId(Integer.valueOf(arr[i]));
				String goodImg = good.get(i).getGoodImgAdd();//商品图片
				int orderId=orders.get(orders.size()-1).getOrderId();//订单Id
				String goodName=good.get(i).getGoodName();//商品名称
				double goodPrice=good.get(0).getGoodPrice();//商品价格
				int goodNum=Integer.valueOf(arrgoodNums[i]);//商品数量
				
				String rentdate =arrrentDays[i] ;//租赁天数
				Orderdetail orderdetail= new Orderdetail(goodName, goodNum, orderId, goodImg, goodPrice, rentdate);
				request.getSession().setAttribute("orderdetail",orderdetail);
				boolean isInsertOrderDetail =odsi.insertOrderDetail(orderdetail);//插入详细商品订单	
				
						
			}
			//删除购物车中的信息s
			scs.delMuchShopCart(list);//删除购物车中的信息
			
			
			
			
			request.getSession().setAttribute("order",order);
			request.getRequestDispatcher("alipay/index.jsp?").forward(request, response);
			

		}
		
	}

	@Override
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
