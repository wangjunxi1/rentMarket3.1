<%@page import="com.etc.RentMarket.entity.User"%>
<%@page import="com.etc.RentMarket.service.impl.UsersServiceImpl"%>
<%@page import="com.etc.RentMarket.service.UsersService"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.etc.RentMarket.entity.EvaluateBack"%>
<%@page import="com.etc.RentMarket.service.impl.EvaluateServiceImpl"%>
<%@page import="com.etc.RentMarket.service.EvaluateService"%>
<%@page import="com.etc.RentMarket.entity.Good"%>
<%@page import="java.util.List"%>
<%@page import="com.etc.RentMarket.service.impl.GoodServiceImpl"%>
<%@page import="com.etc.RentMarket.service.GoodService"%>
<%@ page language="java" pageEncoding="utf-8"%>
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
	<title>商品详情</title>
    <link rel="shortcut icon" type="image/x-icon" href="theme/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="theme/css/base.css">
	<link rel="stylesheet" type="text/css" href="theme/css/home.css">
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
	<script type="text/javascript" src="theme/js/jquery.js"></script>
	<script type="text/javascript" src="theme/js/index.js"></script>
	<script type="text/javascript" src="theme/js/js-tab.js"></script>
    <script>
    
    function checkNum (val) {
        document.getElementById('goodNumber').value = val >= 1 ? val : 1;
    }
    
    
         $(function(){
             $(".yScrollListInList1 ul").css({width:$(".yScrollListInList1 ul li").length*(160+84)+"px"});
             $(".yScrollListInList2 ul").css({width:$(".yScrollListInList2 ul li").length*(160+84)+"px"});
             var numwidth=(160+84)*4;
             $(".yScrollListInList .yScrollListbtnl").click(function(){
                 var obj=$(this).parent(".yScrollListInList").find("ul");
                 if (!(obj.is(":animated"))) {
                     var lefts=parseInt(obj.css("left").slice(0,-4));
                     if(lefts<60){
                         obj.animate({left:lefts+numwidth},1000);
                     }
                 }
             })
             $(".yScrollListInList .yScrollListbtnr").click(function(){
                 var obj=$(this).parent(".yScrollListInList").find("ul");
                 var objcds=-(60+(Math.ceil(obj.find("li").length/4)-4)*numwidth);
                 if (!(obj.is(":animated"))) {
                     var lefts=parseInt(obj.css("left").slice(0,-4));
                     if(lefts>objcds){
                         obj.animate({left:lefts-numwidth},1000);
                     }
                 }
             })
         })
     </script>
    <script>
         $(function(){
         	$("#pro_detail a").click(function(){
         		$("#pro_detail a").removeClass("cur");
         		$(this).addClass("cur");
         		$("#big_img").attr("src",$(this).attr("simg"));
         	});
         	
         	$(".attrdiv a").click(function(){
         		$(".attrdiv a").removeClass("cur");
				$(this).addClass("cur");
         	});
         	
         	$('.amount2').click(function(){
		        var num_input = $("#subnum");
		        var buy_num = (num_input.val()-1)>0?(num_input.val()-1):1;
		        num_input.val(buy_num);
		    });
		
		    $('.amount1').click(function(){
		        var num_input = $("#subnum");
		        var buy_num = Number(num_input.val())+1;
		        num_input.val(buy_num);
		    });
			
             $("#H-table li").each(function(i){
                 $(this).click((function(k){
                     var _index = k;
                     return function(){
                         $(this).addClass("cur").siblings().removeClass("cur");
                         $(".H-over").hide();
                         $(".H-over:eq(" + _index + ")").show();
                     }
                 })(i));
             });
             $("#H-table1 li").each(function(i){
                 $(this).click((function(k){
                     var _index = k;
                     return function(){
                         $(this).addClass("cur").siblings().removeClass("cur");
                         $(".H-over1").hide();
                         $(".H-over1:eq(" + _index + ")").show();
                     }
                 })(i));
             });
         });
     </script>
    
     <script type="text/javascript">
         $(document).ready(function(){

             $("#firstpane .menu_body:eq(0)").show();
             $("#firstpane h3.menu_head").click(function(){
                 $(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
                 $(this).siblings().removeClass("current");
             });

             $("#secondpane .menu_body:eq(0)").show();
             $("#secondpane h3.menu_head").mouseover(function(){
                 $(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
                 $(this).siblings().removeClass("current");
             });

         });
     </script>


 </head>
 <body>
<%
		int goodId = Integer.parseInt(request.getParameter("goodId"));
		GoodService gs = new GoodServiceImpl();
		List<Good> list = gs.getgoodsByGoodId(goodId);
	%>
<!--- header begin-->
<header id="pc-header">
    <div class="BHeader">
			<div class="yNavIndex">
				<ul class="BHeaderl">
					<li><a href="#" style="color: red;">${sessionScope.user.userName}</a></li>
					<li class="headerul">|</li>
					<div class="header-cart fr">
						<a href="${pageContext.request.contextPath}/shopcart.do?op=showCart&userName=${sessionScope.user.userName}"><img src="theme/icon/car.png"></a>
					</div>
				</ul>
			</div>
		</div>
    <div class="container clearfix">
        <div class="header-logo fl"><h1><a href="${pageContext.request.contextPath}/front/index.jsp"><img src="theme/icon/logo.png"></a> </h1></div>
        <div class="head-mountain"></div>
    </div>
    <div class="yHeader">
        <div class="yNavIndex">
            <div class="pullDown">
                <h2 class="pullDownTitle">全部商品分类</h2>
            </div>
            <ul class="yMenuIndex">
                <li><a href="" target="_blank">电器</a></li>
                <li><a href="" target="_blank">数码</a></li>
                <li><a href="" target="_blank">家具</a></li>
                <li><a href="" target="_blank">图书</a></li>
                <li><a href="" target="_blank">健身</a></li>
                <li><a href="" target="_blank">乐器</a></li>
                <li><a href="" target="_blank">汽车</a></li>
                <li><a href="" target="_blank">别墅</a></li>
                <li><a href="" target="_blank">智能</a></li>
            </ul>
        </div>
    </div>
</header>
<!-- header End -->

<!-- 商品详情 begin -->
<section>
    <div class="pc-details" >
        <div class="containers">
        <div class="pc-nav-item"><a class="pc-title" href="${pageContext.request.contextPath}/front/index.jsp">首页</a> &gt; <a href="#">商品详情</a> </div>
            <form class="theme-signin"  method="post" action="../shopcart.do?op=addCart">
            <input type="hidden" id="userName" name="userName" value="${sessionScope.user.userName}">
			<input type="hidden" id="goodId" name="goodId" value="<%=list.get(0).getGoodId()%>">
            
            <div class="pc-details-l">
                <div class="pc-product clearfix">
                    <div class="pc-product-h">
                        <div class="pc-product-top"><img src="theme/img/pd/<%=list.get(0).getGoodImgAdd()%>" id="big_img" width="418" height="418"></div>
                        <div class="pc-product-bop clearfix" id="pro_detail">
                            <ul>
                                <li><a href="javascript:void(0);" class="cur" simg="theme/img/pd/<%=list.get(0).getGoodImgAdd()%>"><img src="theme/img/pd/<%=list.get(0).getGoodImgAdd()%>" width="58" height="58"></a> </li>
                            </ul>
                        </div>
                    </div>
                    <div class="pc-product-t">
                        <div class="pc-name-info">
                            <h1><%=list.get(0).getGoodName()%></h1>
                            <p class="clearfix pc-rate"><strong>￥<%=list.get(0).getGoodPrice()%>/月</strong></p>
                        </div>
                        <div class="pc-dashed clearfix">
                            <span>累计销量：<em class="reds">3988</em> 件</span>
                        </div>
                        <div class="pc-size">
                            <div class="pc-telling clearfix">
                                <div class="pc-version">数量</div>
                                <div class="pc-adults clearfix">
                                    <div class="pc-adults-p clearfix fl">
                                        <input type="number" name="goodNumber" id="goodNumber" value="1" oninput="checkNum(this.value)">
                                    </div>
                                    <div class="fl pc-letter ">件</div>
                                    <div class="fl pc-stock ">库存<em>10</em>件</div>
                                </div>
                            </div>
                            <div class="pc-number clearfix"><span class="fl">商品编号：<%=list.get(0).getGoodId()%>   </span> </div>
                        </div>
                        <div class="pc-emption">
                            <input style="background-color: red; color: white;border: 0;width: 100px;height: 50px"
							id="addCart" class="submit am-btn" title="加入购物车"
							type="button" value="加入购物车">
							
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
    <div class="containers clearfix" style="margin-top:20px;">
        <div class="pc-info fr" style="width: 1200px">
            <div class="pc-overall">
                <ul class="brand-tab H-table H-table-shop clearfix " id="H-table" style="margin-left:0;">
                    <li class="cur"><a href="javascript:void(0);">全部评价</a></li>
                </ul>
                <div class="pc-term clearfix">
                    <div class="pc-column">
                        <span class="column1">评价</span>
                        <span class="column4" style="float: right;margin-right: 35px">评论者</span>
                    </div>
                    <div class="H-over  pc-comments clearfix">
                        <ul class="clearfix">
                        <%
                        	EvaluateService es = new EvaluateServiceImpl();
                        	UsersService us = new UsersServiceImpl();
                            List<EvaluateBack> e_list = es.qEvaluateByGoodId(list.get(0).getGoodId());
                            for(EvaluateBack eb : e_list){
                        %>
                        
                        
                            <li class="clearfix">
                                <div class="column1">
                                    <p><%=eb.getEvaluateContent() %></p>
                                    <p class="column5"><%=eb.getEvaluateDate() %></p>
                                </div>
                         <%
                        	 List<User> u_list = us.queryUserByUserId(eb.getUserId());
                         %>
                                <div class="column4" style="float: right;">
                                    <p><img src="${pageContext.request.contextPath}/avatar/<%=u_list.get(0).getUserphoto() %>"></p>
                                    <p><%=u_list.get(0).getUserName() %></p>
                                </div>
                                
                            </li>
                            
                            <%
                            	}
                            %>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 商品详情 End -->

<!--- footer begin-->
<div class="aui-footer-bot">
    <div class="time-lists aui-footer-pd clearfix">
        <div class="aui-footer-list clearfix">
            <h4>
                <span><img src="theme/icon/icon-d1.png"></span>
                <em>消费者权益</em>
            </h4>
            <ul>
                <li><a href="#">保障范围 </a> </li>
                <li><a href="#">退货退款流程</a> </li>
                
                
                
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>
                <span><img src="theme/icon/icon-d2.png"></span>
                <em>新手上路</em>
            </h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">服务中心 </a> </li>
                
               
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>
                <span><img src="theme/icon/icon-d3.png"></span>
                <em>保障正品</em>
            </h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
               
               
                <li><a href="#"> 更多特色服务 </a> </li>
            </ul>
        </div>
       
    </div>
    <div style="border-bottom:1px solid #dedede"></div>
    <div class="time-lists aui-footer-pd time-lists-ls clearfix">
        <div class="aui-footer-list clearfix">
            <h4>购物指南</h4>
            <ul>
            	
                
                <li><a href="#">购物流程</a> </li>
                <li><a href="#">会员介绍 </a> </li>
                
                <li><a href="#"> 常见问题 </a> </li>
                
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>关于网站</h4>
            <ul>
                <li><a href="#">网站简介</a> </li>
             
               
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>帮助中心</h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">联系我们</a> </li>
                
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>新手指导</h4>
            <ul>
                
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">使用教程</a> </li>
                <li><a href="#"> 联系客服购物 </a> </li>
                
            </ul>
        </div>
    </div>
</div>
<!--加入购物车的操作  -->
	<script type="text/javascript" src="layui/layui.js"></script>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript">
		layui.use('layer', function(){
  		var layer = layui.layer;
		});   
		$("#addCart").click(function() {
			$.post("${pageContext.request.contextPath}/shopcart.do","op=addCart&userName="+$("#userName").val()+"&goodId="+$("#goodId").val()+"&goodNumber="+$("#goodNumber").val(),function(data,status){
				if("success"==status){
					layer.msg('<span style="color:white;font-size:20px">添加商品成功</span>');
					icon:1;
					time:1000
				}else{
					
					layer.msg('<span style="color:gray;">添加商品失败</span>');
					icon:1;
					time:1000
				}
			});
		});
	</script>
<!-- footer End -->
</body>
</html>