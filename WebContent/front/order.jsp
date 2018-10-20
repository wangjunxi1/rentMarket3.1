<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.etc.RentMarket.entity.Shoppingcart"%>
<%@page import="com.etc.RentMarket.entity.User"%>
<%@page import="com.etc.RentMarket.entity.Usersdetail"%>
<%@page import="java.util.List"%>
<%@page import="com.etc.RentMarket.service.impl.AddressServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>提交订单</title>
    <link rel="shortcut icon" type="image/x-icon" href="theme/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="theme/css/base.css">
	<link rel="stylesheet" type="text/css" href="theme/css/home.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/address.js"></script> 
	<script type="text/javascript" src="theme/js/jquery.js"></script>
    <script type="text/javascript">
         (function(a){
             a.fn.hoverClass=function(b){
                 var a=this;
                 a.each(function(c){
                     a.eq(c).hover(function(){
                         $(this).addClass(b)
                     },function(){
                         $(this).removeClass(b)
                     })
                 });
                 return a
             };
         })(jQuery);

         $(function(){
             $("#pc-nav").hoverClass("current");
         });




         $(document).ready(function($){

             $("#btnadd").click(function(event){
                 $("#hintAdd").css({"display":"block"});
                 $("#boxAdd").css({"display":"block"});
             });
			
             $("#btnup").click(function(event){
                 $("#hintUp").css({"display":"block"});
                 $("#boxUp").css({"display":"block"});
             });
             
             $(".hint-in3").click(function(event) {
                 $("#hint").css({"display":"none"});
                 $("#box").css({"display":"none"});
             });

             $(".hint3").click(function(event) {
                 $(this).parent().parent().css({"display":"none"});
                 $(".box").css({"display":"none"});
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

         });
     </script>


 </head>
 <body>
	<%	
		//查询地址信息
		User user=(User)session.getAttribute("user");
		AddressServiceImpl asi = new AddressServiceImpl();
		List<Usersdetail> list=asi.queryUserAddr(user.getUserName());	
	%>
	<!-- 添加收货地址 -->
<div class="box" id ="boxAdd">
	<form action="" method="post">
    <div class="hint" id ="hintAdd">
        <div class="hint-in1">
            <div class="hint2">添加收货地址</div>
            <div class="hint3"></div>
        </div>


        <div class="pc-label">
        <label><i class="reds ">*</i>收货人:</label>
        <input type="text" placeholder="请您填写用户名" name="userName" id="userName" value="${sessionScope.user.userName}">
        </div>
        <div class="pc-label">
        <label><i class="reds ">*</i>真实姓名:</label>
        <input type="text" placeholder="请您填写收货人姓名" name="userRealName" id="userRealName" value="">
        </div>
		<div id="sjld" style="margin-top:10px; padding-left:40px; position:relative;" class="clearfix">

            <div class="clearfix" style="padding-bottom:5px;"><i class="reds fl">*</i><p class="fl">所在地区:</p></div>

           	<select id="cmbProvince" name="cmbProvince" style="width: 181px"></select>  
			<select id="cmbCity" name="cmbCity" style="width: 181px"></select>  
			<select id="cmbArea" name="cmbArea" style="width: 181px"></select>
										
            </div>
            <div class="pc-label"><label><i class="reds ">*</i>详细地址:</label><input type="text" style="width:400px; " placeholder="请您填写收货人详细地址" id="userAddressAdd " name="userAddressAdd" value=<%-- <%=asi.queryUserAddr(user.getUserName()).get(0).getUserAddress() %> --%>></div>
        	<div class="pc-label"><label><i class="reds ">*</i>手机号码:</label><input type="text" style="width:400px;"placeholder="请您填写收货人手机号码" id="userPhone" name="userPhone" value=<%=asi.queryUserAddr(user.getUserName()).get(0).getUserPhone() %>></div>
            <input id="sfdq_num" type="hidden" value="" />
            <input id="csdq_num" type="hidden" value="" />
            <input id="sfdq_tj" type="hidden" value="" />
            <input id="csdq_tj" type="hidden" value="" />
            <input id="qydq_tj" type="hidden" value="" />
            <button href="javascript:;" class="hint-in3"  id="save">保存收货地址</button>
        </div>
			</form>
    </div>
    <!-- 添加收货地址结束 -->
    
    <!-- 编辑收货地址开始 -->
    <div class="box" id ="boxUp">
	
    <div class="hint" id ="hintUp">
        <div class="hint-in1">
            <div class="hint2">编辑收货地址</div>
            <div class="hint3"></div>
        </div>

		
        <div class="pc-label">
        <label><i class="reds ">*</i>收货人:</label>
        <input type="text" placeholder="请您填写用户名" name="userNameed" id="userNameed" value="${sessionScope.user.userName}">
        </div>
        <div class="pc-label">
        <label><i class="reds ">*</i>真实姓名:</label>
        <input type="text" placeholder="请您填写收货人姓名" name="userRealNameed" id="userRealNameed" value="">
        </div>
        
		<div id="sjld" style="margin-top:10px; padding-left:40px; position:relative;" class="clearfix">

            <div class="clearfix" style="padding-bottom:5px;"><i class="reds fl">*</i><p class="fl">所在地区:</p></div>

           	<select id="cmbProvinceed" name="cmbProvinceed" style="width: 181px"></select>  
			<select id="cmbCityed" name="cmbCityed" style="width: 181px"></select>  
			<select id="cmbAreaed" name="cmbAreaed" style="width: 181px"></select>
										
            </div>
            <div class="pc-label"><label><i class="reds ">*</i>详细地址:</label><input type="text" style="width:400px; " placeholder="请您填写收货人详细地址" id="userAddressed " name="userAddressed"></div>
        	<div class="pc-label"><label><i class="reds ">*</i>手机号码:</label><input type="text" style="width:400px;"placeholder="请您填写收货人手机号码" id="userPhoneed" name="userPhoneed" ></div>
            <input id="sfdq_num" type="hidden" value="" />
            <input id="csdq_num" type="hidden" value="" />
            <input id="sfdq_tj" type="hidden" value="" />
            <input id="csdq_tj" type="hidden" value="" />
            <input id="qydq_tj" type="hidden" value="" />
            <button href="javascript:;" class="hint-in3"  id="change">更改</button>
        </div>
			
    </div>
    <!-- 编辑收货地址结束 -->
    
    
    <script type="text/javascript">
    //Ajax请求添加到数据库收货地址
    	$("#save").click(function(){
    		var userName=$("#userName").val();
    		var userRealName=$("#userRealName").val();
    		var cmbProvince=$("#cmbProvince").find("option:selected").text();
    		var cmbCity=$("#cmbCity").find("option:selected").text();
    		var cmbArea=$("#cmbArea").find("option:selected").text();
    		var userPhone=$("#userPhone").val();
    		var userAddress =$("input[name=userAddressAdd]").val();
    		/* alert("cmbProvince="+cmbProvince+",cmbCity="+cmbCity+",cmbArea="+cmbArea+",+userAddress="+userAddress); */
    		 $.get("ads.do?op=orderAdd","userName="+userName+"&userRealName="+userRealName+"&cmbProvince="+cmbProvince+"&cmbCity="+cmbCity+"&cmbArea="+cmbArea+"&userPhone="+userPhone+"&userAddress="+userAddress,function(data,status){
    			 
    			 if(status==success){
    				alert("添加成功");
    			}else{
    				alert("添加失败");
    			}
    			
    		});  
    	});
    
    	//更改内容
    	$("#change").click(function(){
    		var userAddressed=$("#cmbProvinceed").find("option:selected").text();
    		userAddressed+=$("#cmbCityed").find("option:selected").text();
    		userAddressed+=$("#cmbAreaed").find("option:selected").text();
    		userAddressed+=$("input[name='userAddressed']").val();
    		$("#users").html($("#userNameed").val());
    		$("#address").html(userAddressed);
    		$("#telephone").html($("input[name='userPhoneed']").val());
    		 $("#hintUp").css({"display":"none"});
             $("#boxUp").css({"display":"none"});
    	});
    	
    </script>
    
<script type="text/javascript">  //省市级联
	
			addressInit('cmbProvince', 'cmbCity', 'cmbArea');  
</script> 

<script type="text/javascript">  //省市级联
	
			addressInit('cmbProvinceed', 'cmbCityed', 'cmbAreaed');  
</script> 
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


<!-- 订单提交成功 begin-->
	
<section>
    <div class="containers">
       <div class="pc-space">
           <div class="pc-order-title clearfix"><h3 class="fl">收货人信息</h3> <a href="#" class="fr pc-order-add btn1" id="btnadd"> 新增收货地址</a> </div>
           <div class="pc-border">
               <div class="pc-order-text clearfix">
                   <ul class=" clearfix">
                       <li class="clearfix fl">
                           <div class="fl pc-frame pc-frams"> <a href="#">默认地址</a></div>
                           <div class="fl pc-address">
                           <span id="users"><%=list.get(0).getUserName() %></span> 
                           <span id="address"><%=list.get(0).getUserAddress() %></span> 
                           <span >联系方式:</span> <span id="telephone" ><%=list.get(0).getUserPhone() %> </span>
                           </div>
                       </li>
                       <li class="fr">
                           <div class="pc-click"><a href="#">设为默认地址</a> <a href="#" class="btn1" id="btnup">编辑 </a>  </div>
                       </li>
                   </ul>
               </div>
           </div>
       </div>
       <div class="pc-space">
            <div class="pc-order-title clearfix"><h3 class="fl">支付方式</h3></div>
            <div class="pc-border">
                <div class="pc-order-text clearfix">
                    <ul class=" clearfix">
                        <li class="clearfix fl">
                            <div class="fl pc-frame pc-frams" style="margin-right:50px "> <a href="#"> <img src="${pageContext.request.contextPath}/front/theme/img/pay/yinlian.jpg" width="50px" height="25px"></img></a></div>
                            <div class="fl pc-frame pc-frams" style="margin-right:50px "> <a href="#"> <img src="${pageContext.request.contextPath}/front/theme/img/pay/zhifubao.jpg" width="60px" height="25px"></img></a></div> 
                        	<div class="fl pc-frame pc-frams" style="margin-right:50px "> <a href="#"><img src="${pageContext.request.contextPath}/front/theme/img/pay/weixin.jpg" width="60px" height="25px"></img> </a></div> 
                        </li>
                    </ul>
                </div>
            </div>
        </div>
       <div class="pc-space clearfix" style="width:1200px">
           <div class="fr ">
               <div class="pc-order-title clearfix"><h3 class="fl">商品信息</h3></div>
               <div class="pc-border">
                   <div class="pc-order-text clearfix" style="width:1158px " >
                       <%
                       		List<Shoppingcart> shopcart=(List<Shoppingcart>) request.getAttribute("shopCartlist");//查询集合
                       		String total=(String)request.getAttribute("total");//总价钱
                       		String imgPath="theme/img/pd/";//图片路劲
                       		String rentDays=(String)request.getAttribute("rentDays");
                       		String arrRentDay[] = rentDays.split(",");//天数数组
                       		String goodNum="";
                       		for(int i=0;i<shopcart.size();i++){                 		
                       			goodNum+=shopcart.get(i).getGoodNumber();
                       %>
                       <div class="clearfix pc-wares-p">
                           <div class="fl pc-wares"><a href="#"><img width="100px" height="100px" src=<%=imgPath+shopcart.get(i).getGoodImgAdd() %>></a></div>
                           <div class="fl pc-wares-w">  <p class="clearfix"><span class="fr"><%=shopcart.get(i).getGoodName() %></span></p></div>
                           <div class="fl pc-wares-s"><span class="reds" ><%=shopcart.get(i).getGoodPrice() %>/天</span>
                           <span>x<%=shopcart.get(i).getGoodNumber() %></span>
                           <span>有货</span>
                           <span><%=arrRentDay[i] %></span><span>天</span>
                           </div>
                       </div>
                       <%
                       		}
                       %>
                       
                       <div class="pc-written"><p>订单留言</p>
                       		<div>
                       			<textarea rows="10" cols="165.9" >
                       			
                       			</textarea>
                       		
                       		</div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       
       <div class="clearfix">
           <div class="fr pc-list-t">
               <ul>
                   <li><span><b><%=shopcart.size() %></b> 件商品，总商品金额：</span> <em>￥<%=total %></em></li>
                   
                   <li><span>运费：</span> <em>￥20</em></li>
                  
                   
               </ul>
           </div>
       </div>
       <div class="pc-space-n"></div>
       <div class="clearfix">
           <div class="fr pc-space-j">
               <span>应付总额：<strong>￥<%=Double.parseDouble(total)+20%></strong></span>
               <form action="os.do?op=insert" method="post" >
               <button class="pc-submit" id="submit" type="submit">提交订单</button>
               <input type="hidden" name="userName" id="userName" value="${sessionScope.user.userName }">
               <input type = "hidden" name = "orderDate" id="orderDate" value=<%=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date()) %>>
               <input type="hidden" name ="orderTPrice" id="orderTPrice" value=<%=Double.parseDouble(total)+20 %>>
               <input type="hidden" name ="userAddress" id="userAddress" value=<%= list.get(0).getUserAddress()%>>
               <input type="hidden" name ="userTel" id="userTel" value="<%=list.get(0).getUserPhone() %>">
               <input type="hidden" name ="goodId" id="goodId" value="<%=request.getAttribute("goodIdlist") %>">
               <input type="hidden" name ="goodNum" id="goodNum" value="<%=goodNum %>">
               <input type="hidden" name ="rentDays" id="rentDays" value="<%=rentDays %>">
               </form>
           </div>
       </div>
    </div>
</section>
<!-- 订单提交成功 End-->
<script type="text/javascript">
	

</script>

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
                <li><a href="#">服务中心 </a> </li>
                <li><a href="#">服务中心</a> </li>
                
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
                <li><a href="#">服务中心</a> </li>
               
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>
                <span><img src="theme/icon/icon-d3.png"></span>
                <em>保障正品</em>
            </h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">服务中心 </a> </li>
                <li><a href="#">服务中心</a> </li>
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
            <h4>特色服务</h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">服务中心 </a> </li>
               
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
<!-- footer End -->


</body>
</html>