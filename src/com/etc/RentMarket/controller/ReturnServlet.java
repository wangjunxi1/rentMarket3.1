package com.etc.RentMarket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.RentMarket.entity.Order;
import com.etc.RentMarket.service.OrderService;
import com.etc.RentMarket.service.ReturnService;
import com.etc.RentMarket.service.impl.OrderServiceImpl;
import com.etc.RentMarket.service.impl.ReturnServiceImpl;

/**
 * Servlet implementation class ReturnServlet
 */
@WebServlet("/rs.do")
public class ReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReturnService rs = new ReturnServiceImpl();
		String op = request.getParameter("op");
		if("sel".equals(op)) {
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			String goodName = request.getParameter("goodName");
			List<Order> list = rs.getOrder(orderId, goodName);
			request.setAttribute("goodName", goodName);
			request.setAttribute("list", list);
			request.getRequestDispatcher("front/requestback.jsp").forward(request, response);
		}else if ("add".equals(op)) {
			int userId = Integer.parseInt(request.getParameter("userId"));
			int goodId = Integer.parseInt(request.getParameter("goodId"));
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			String goodName = request.getParameter("goodName");
			String content = request.getParameter("content");
			OrderService os = new OrderServiceImpl();
			os.updateOrderState(0, orderId,goodName);
			boolean flag = rs.addComment(userId, goodId, content);
			if(flag){
				request.getRequestDispatcher("front/comment.jsp").forward(request, response);
			}
		}
	}

    @Override
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
