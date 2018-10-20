<%@page import="com.etc.RentMarket.entity.Shoppingcart"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta name="renderer" content="webkit">
<meta content="易点租, 购物, 大家电, 手机" name="keywords">
<meta content="易点租，购物商城。" name="description">
<title>我的购物车</title>
<link rel="shortcut icon" type="image/x-icon"
	href="theme/icon/favicon.ico">
<link href="front/theme/css/cartstyle.css" rel="stylesheet" type="text/css" />
<link href="theme/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="theme/css/demo.css" rel="stylesheet" type="text/css" />
<link href="front/theme/css/cartstyle.css" rel="stylesheet" type="text/css" />
<link href="theme/css/optstyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="theme/css/base.css">
<link rel="stylesheet" type="text/css" href="theme/css/member.css">
<script type="text/javascript" src="theme/js/jquery.js"></script>
<script type="text/javascript">

	

	//商品数量减一操作
	function d(id){
		if("1"!=$("#num"+id).val()){//如果数量不为0就进行减一操作 
			var num=$("#num"+id).val()+"-"+1;
			var q=eval(num);
			$("#num"+id).val(q);
		}	
	}
	
	//商品数量加一操作 
	function add(index){
		var num=$("#num"+index).val()+"+"+1;
		var q=eval(num);
		$("#num"+index).val(q);
	}
	
	//租赁天数减一
	function rentDatedes(index){
		if("1"!=$("#rentDate"+index).val()){//如果数量不为0就进行减一操作 
			var num=$("#rentDate"+index).val()+"-"+1;
			var q=eval(num);
			$("#rentDate"+index).val(q);
		}
	}
	//租赁天数加一
	function rentDateadd(index){
		var num=$("#rentDate"+index).val()+"+"+1;
		var q=eval(num);
		$("#rentDate"+index).val(q);
	}

/* var index = $("#hideIndex").val();

$("#des"+index).click(function(){
	
	if("1"!=$("#num1").val()){//如果数量不为0就进行减一操作 
		var num=$("#num1").val()+"-"+1;
		var q=eval(num);
		$("#num1").val(q);
	}	
});


$("#plus"+index).click(function(){

		var num=$("#num1").val()+"+"+1;
		var q=eval(num);
		$("#num1").val(q);							
							
});	 */
</script>

<script type="text/javascript">
	(function(a) {
		a.fn.hoverClass = function(b) {
			var a = this;
			a.each(function(c) {
				a.eq(c).hover(function() {
					$(this).addClass(b)
				}, function() {
					$(this).removeClass(b)
				})
			});
			return a
		};
	})(jQuery);

	$(function() {
		$("#pc-nav").hoverClass("current");
	});
</script>

<script>
	$(function() {

		$("#H-table li").each(function(i) {
			$(this).click((function(k) {
				var _index = k;
				return function() {
					$(this).addClass("cur").siblings().removeClass("cur");
					$(".H-over").hide();
					$(".H-over:eq(" + _index + ")").show();
				}
			})(i));
		});
		$("#H-table1 li").each(function(i) {
			$(this).click((function(k) {
				var _index = k;
				return function() {
					$(this).addClass("cur").siblings().removeClass("cur");
					$(".H-over1").hide();
					$(".H-over1:eq(" + _index + ")").show();
				}
			})(i));
		});
	});
	
	
	
						
	
</script>




</head>
<body onload="">

	<!--- header begin-->
	<header id="pc-header">
		<div class="BHeader">
			<div class="yNavIndex">
				<ul class="BHeaderl">
					<li><a href="#" style="color: red;">${sessionScope.user.userName}</a></li>
					<li class="headerul">|</li>
					<div class="header-cart fr">
						<a href="#"><img src="theme/icon/car.png"></a>
					</div>
				</ul>
			</div>
		</div>
		<div class="container clearfix">
			<div class="header-logo fl">
				<h1>
					<a href="#"><img src="theme/icon/logo.png"></a>
				</h1>
			</div>
			<div class="member-title fl">
				<h2></h2>
			</div>

		</div>
	</header>
	<!-- header End -->

	<div class="containers">
		<div class="pc-nav-item">
			<a href="${pageContext.request.contextPath}/front/index.jsp">首页</a> &gt; <a href="${pageContext.request.contextPath}/front/user-info.jsp">会员中心 </a>
		</div>
	</div>

	<!-- 商城快讯 begin -->
	<section id="member">
		<div class="member-center clearfix">
			<div class="member-left fl">
				<div class="member-lists">
					<dl>
						<dt>我的商城</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/front/user-info.jsp">我的信息</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/os.do?op=sel">我的订单</a>
						</dd>
						<dd class="cur">
							<a href="#">我的购物车</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/front/comment.jsp">我的评价</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/ads.do?op=sel">地址管理</a>
						</dd>
					</dl>
					<dl>
						<dt>客户服务</dt>
						<dd class="cur">
							<a href="#">归还</a>
						</dd>
					</dl>
				</div>
			</div>
			<div class="member-right fr">
				<div class="member-head">
					<div class="member-heels fl">
						<h2>我的购物车</h2>
					</div>
					<div class="member-backs member-icons fr">
						<a href="#">搜索</a>
					</div>
					<div class="member-about fr">
						<input type="text" placeholder="商品名称/商品编号">
					</div>
				</div>

				
				<div class="member-return H-over">
				
					<form action="front/order.jsp" method="post" onsubmit="return check()">
						<!--购物车 -->
						<div class="concent">
							<div id="cartTable">
								<div class="cart-table-th">
									<div class="wp">
										<div class="th th-chk">
											<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
										</div>
										<div class="th th-item">
											<div class="td-inner">商品信息</div>
										</div>
										<div class="th th-price" style="margin-left:-50px">
											<div class="td-inner">单价</div>
										</div>
										<div class="th th-amount">
											<div class="td-inner">数量(小于1000)</div>
										</div>
										
										<div class="th th-inner">
											<div class="td-inner" style="margin-left:20px">租赁天数</div>
										</div>
										
										<div class="th th-op">
											<div class="td-inner" style="margin-left:20px">操作</div>
										</div>
									</div>
								</div>
								<div class="clear"></div>

								<tr class="item-list">
									<div class="bundle  bundle-last "></div>
								</tr>
               
                
								<div class="clear"></div>

								<tr class="item-list">
									<div class="bundle  bundle-last ">

										<div class="bundle-main">
											<!--多选按钮--> 
											<!-- 循环开始 -->
                                        	
                							<c:forEach var="a" items="${requestScope.shopcart}" varStatus="i">
                						
											<ul class="item-content clearfix">
											<li class="td td-chk">	
													
                							<div class="cart-checkbox ">
														<input class="check" id="checkAll" name="checkAll"
															type="checkbox" onclick="setSelectAll()"
															value="${a.goodId}">
													</div>
												</li>
												<li class="td td-item">
													<div class="item-pic">
														<!--图片-->
														<a href="#" target="_blank" data-title="图片"
															class="J_MakePoint" data-point="tbcart.8.12"> <img style="width:90px; height:100px"
															src="theme/img/pd/${a.goodImgAdd}"
															class="itempic J_ItemImg"></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" target="_blank" title="bookname"
																class="item-title J_MakePoint" data-point="tbcart.8.11">
																${a.goodName}
															</a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props item-props-can">
												</li>
												<li class="td td-price" style="margin-left:-50px">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<div class="price-line">
																<div id="price${i.index+1}" style="display:inline">
																	${a.goodPrice}
																</div><span>元/天</span>
															</div>
														</div>
													</div>
												</li>
												
												<li class="td td-amount">
													<div class="amount-wrapper ">
														<div class="item-amount ">
															<div class="sl" id="divbtn" >
																<input class="min am-btn" type="button" value="-" id="desNum${i.index+1}"
																onclick="d(${i.index+1})"	name="desNum" /> 
																<input class="text_box"
																	id="num${i.index+1}" type="text"
																 	name="num${i.index+1}"
																	value="${a.goodNumber}"
																	style="width: 30px;" 
																	readonly/> 
																<input type="hidden" id="hid" name="hidnum" value="${i.index+1}">
																<button class="add am-btn" id="addNum${i.index+1}" name="addNum" onclick="add(${i.index+1})"
																	type="button" value="+">+</button>
															</div>
														</div>
													</div>
												</li>
												
												<li class="td td-amount">
													<div class="amount-wrapper ">
														<div class="item-amount ">
															<div class="sl" id="rentDatebtn" >
																<input class="min am-btn" type="button" value="-" id="desDate${i.index+1}"
																onclick="rentDatedes(${i.index+1})"	name="desDate" /> 
																<input class="text_box"
																	id="rentDate${i.index+1}" type="text"
																 	name="rentDate${i.index+1}"
																	value="1"
																	style="width: 30px;" 
																	readonly/> <span>天</span>
																
																<button class="min am-btn" id="addDate${i.index+1}" name="addDate" onclick="rentDateadd(${i.index+1})"
																	type="button" value="+">+</button>
															</div>
														</div>
													</div>
												</li>
												
												<li class="td td-sum">
													<div class="td-inner">
														<span id="allprice${i.index+1}" value="${a.goodNumber}"></span> <input
															type="hidden" id="hiddenAllprice${i.index+1}"
															name="Allprice${i.index+1}" value="" />
													</div>
												</li>
												<li class="td td-op">
													<div class="td-inner" style="margin-top:-20px; margin-left:-70px">
														<a
															href="${pageContext.request.contextPath}/shopcart.do?op=delCart&goodId=${a.goodId}&userName=${requestScope.userName}"
															data-point-url="#" class="delete">删除</a>
													</div>
												</li>
											</ul>
											</c:forEach>
											</div>
									</div>
								</tr>
							</div>
										
						
										


							<div class="float-bar-wrapper">
								<div id="J_SelectAll2" class="select-all J_SelectAll">
									<div class="cart-checkbox">
										<input type="checkbox" class="check-all check"
											name="select-all" id="selAll" onclick="selectAll()" /> <label
											for="J_SelectAllCbx2"></label>
									</div>
									<span>全选</span>

								</div>
								<div class="operations">
									<a href="${pageContext.request.contextPath}/shopcart.do?op=delAll&userName=${sessionScope.user.userName }"  class="deleteAll" id="deleteAll" >清空购物车</a>
									<input type="hidden" id="delVal" name="delVal" value=<%=request.getParameter("delAllCart") %>>
								</div>

								<div class="float-bar-right">
									<div class="amount-sum">
										<span class="txt">已选商品</span> <span class="txt" id="checked"></span>
										<span class="txt">件</span>
										<div class="arrow-box">
											<span class="selected-items-arrow"></span> <span
												class="arrow"></span>
										</div>
									</div>
									<div class="price-sum">
										<span class="txt">合计:</span> ¥<span  class="price" id="J_Total"  >0</span>元
										<input type="hidden" id="hiddenTotal" name="hiddenTotal" value="" />
									</div>
									<div>
										<input type="button" id="J_Go" class="am-btn am-btn-danger" 
											value="结&nbsp;算">
									</div>
								</div>
							</div>
					</form>
				</div>



			

			</div>
		</div>
		</div>
	</section>
	<!-- 商城快讯 End -->

	<!--- footer begin-->
	<div class="aui-footer-bot">
		<div class="time-lists aui-footer-pd clearfix">
			<div class="aui-footer-list clearfix">
				<h4>
					<span><img src="theme/icon/icon-d1.png"></span> <em>消费者权益</em>
				</h4>
				<ul>
					<li><a href="#">保障范围 </a></li>
					<li><a href="#">退货退款流程</a></li>



				</ul>
			</div>
			<div class="aui-footer-list clearfix">
				<h4>
					<span><img src="theme/icon/icon-d2.png"></span> <em>新手上路</em>
				</h4>
				<ul>
					<li><a href="#">退货退款流程</a></li>
					<li><a href="#">服务中心 </a></li>


				</ul>
			</div>
			<div class="aui-footer-list clearfix">
				<h4>
					<span><img src="theme/icon/icon-d3.png"></span> <em>保障正品</em>
				</h4>
				<ul>
					<li><a href="#">退货退款流程</a></li>


					<li><a href="#"> 更多特色服务 </a></li>
				</ul>
			</div>

		</div>
		<div style="border-bottom: 1px solid #dedede"></div>
		<div class="time-lists aui-footer-pd time-lists-ls clearfix">
			<div class="aui-footer-list clearfix">
				<h4>购物指南</h4>
				<ul>


					<li><a href="#">购物流程</a></li>
					<li><a href="#">会员介绍 </a></li>

					<li><a href="#"> 常见问题 </a></li>

				</ul>
			</div>
			<div class="aui-footer-list clearfix">
				<h4>关于网站</h4>
				<ul>
					<li><a href="#">网站简介</a></li>


				</ul>
			</div>
			<div class="aui-footer-list clearfix">
				<h4>帮助中心</h4>
				<ul>
					<li><a href="#">退货退款流程</a></li>
					<li><a href="#">联系我们</a></li>

				</ul>
			</div>
			<div class="aui-footer-list clearfix">
				<h4>新手指导</h4>
				<ul>

					<li><a href="#">退货退款流程</a></li>
					<li><a href="#">使用教程</a></li>
					<li><a href="#"> 联系客服购物 </a></li>

				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#J_Go").click(function(){
			var str = [];
			var obj = document.getElementsByName("checkAll");
			var total=$("#hiddenTotal").val();
			var strRentDays=[]
			for(var i=0;i<obj.length;i++){
				if(obj[i].checked==true){
					str.push(obj[i].value);
					strRentDays.push($("#rentDate"+(i+1)).val());
				}
				
			}
			
			location.href="shopcart.do?op=selGoodById&goodId="+str+"&totalPrice="+total+"&rentDays="+strRentDays;
		});
	</script>
<script language="javascript">

	//选中全选按钮，下面的checkbox全部选中 
	
	var selAll = document.getElementById("selAll");
	function selectAll() {
		var obj = document.getElementsByName("checkAll");
		if (document.getElementById("selAll").checked == false) {
			for (var i = 0; i < obj.length; i++) {
				obj[i].checked = false;
				document.getElementById("checked").innerHTML = 0;
				document.getElementById("J_Total").innerHTML = 0;
			}
		} else {
			for (var i = 0; i < obj.length; i++) {
				obj[i].checked = true;
				document.getElementById("checked").innerHTML = obj.length;
				setSelectAll();
			}
		}
	}
	
	//当选中所有的时候，全选按钮会勾上 
	var ischecked=true;//是否是选中状态，true表示还未选中
	var checkedNo=[];
	function setSelectAll() {
		var obj = document.getElementsByName("checkAll");
		var count = obj.length;
		var selectCount = 0;
		var pay = 0;
		for (var i = 0; i < count; i++) {
				if (obj[i].checked == true) {
					selectCount++;
					//checkedNo.push[i];
					var price = $('#allprice'+(i+1)).val();
					pay = parseFloat(pay) + price;
					//将对应按钮隐藏
				/* 	$("#desNum"+ (i+1)).css("display","none");
					$("#addNum"+ (i+1)).css("display","none");
					$("#desDate"+ (i+1)).css("display","none");
					$("#addDate"+ (i+1)).css("display","none"); */
					
				}
				/* else{
					ischecked=true;
					$("#desNum"+ (i+1)).show();
					$("#addNum"+ (i+1)).show();
					$("#desDate"+ (i+1)).show();
					$("#addDate"+ (i+1)).show();
				} */
			}
		
		//打印选中个数
		document.getElementById("checked").innerHTML = selectCount;
		//计算选中的价格并打印

		//document.getElementById("J_Total").innerHTML = pay;
		//给input隐藏域赋值
		document.getElementById("hiddenTotal").value = pay;
		if (count == selectCount) {
			document.all.selAll.checked = true;
		} else {
			document.all.selAll.checked = false;
		}
		setAllPrice();
		
	}
	

	//反选按钮 
	function setNoSelect() {
		var checkboxs = document.getElementsByName("checkAll");
		for (var i = 0; i < checkboxs.length; i++) {
			if(checkboxs[i].checked==true){
				var e = checkboxs[i];
				e.checked = !e.checked;
				
				setSelectAll();
			}
			
		}
		
	}

	//判断是否有商品与数量不为0 
	function check() {
		var checknum = parseFloat($('#checked').html());
		var total = parseFloat($('#J_Total').html());
		if (checknum == 0) {
			alert('未选中需要购买的商品');
			return false;
		} else if (total == 0) {
			alert('数量不能为0');
			return false;
		} else {
			return true;
		}
	}
	
	window.onload=function(){
		var isDelAll=$("#delVal").val();
		if(isDelAll==true){
			alert("清空购物车成功");
		}
		
		
	};
	
</script>


</head>

<script type="text/javascript">
	function setAllPrice() {//计算总价钱
		var total=0;
		var allprice=0;
		var obj = document.getElementsByName("checkAll");
		
		for (var i = 0; i < obj.length; i++) {
			
			if (obj[i].checked == true){
			//获取数值
			
			var price = parseFloat($('#price' + (i+1)).html());
			var num = parseInt($('#num' + (i+1)).val());
			var rentDate=parseInt($('#rentDate'+(i+1)).val());
			
			//计算
			if (num > 1000) {
				alert('超过最大输入数量');
				document.getElementById('num' + (i+1)).value = 0;
				num = 0;
			} else if (num < 0 || num == "") {
				document.getElementById('num' + (i+1)).value = 0;
				num = 0;
			}
			allprice = (price) * (num)*(rentDate);
			//alert("allprice="+allprice)
			//赋值
			total = total+allprice;

		}
		$("#hiddenTotal").val(total);
		$("#J_Total").html(total);
	}
	}
	
</script>
	<!-- footer End -->
	
</body>
</html>