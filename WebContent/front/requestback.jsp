<%@page import="java.util.List"%>
<%@page import="com.etc.RentMarket.service.impl.ReturnServiceImpl"%>
<%@page import="com.etc.RentMarket.service.ReturnService"%>
<%@page import="com.etc.RentMarket.entity.Order"%>
<%@page import="com.etc.RentMarket.service.impl.UsersServiceImpl"%>
<%@page import="com.etc.RentMarket.service.UsersService"%>
<%@page import="com.etc.RentMarket.entity.User"%>
<%@ page language="java" pageEncoding="utf-8"%>
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
    <meta content="歪秀购物, 购物, 大家电, 手机" name="keywords">
    <meta content="歪秀购物，购物商城。" name="description">
	<title>归还商品</title>
    <link rel="shortcut icon" type="image/x-icon" href="theme/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="theme/css/base.css">
	<link rel="stylesheet" type="text/css" href="theme/css/member.css">
    <script type="text/javascript" src="theme/js/jquery.js"></script>
    <script src="theme/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" charset="utf-8"
	src="theme/js/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"
	src="theme/js/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8"
	src="theme/js/zh-cn.js"></script>
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
     </script>

     <script>
         $(function(){

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


 </head>
 <body>

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

<div class="containers"><div class="pc-nav-item"><a href="front/index.jsp">首页</a> &gt; <a href="${pageContext.request.contextPath}/os.do?op=sel">我的订单 </a>&gt; <a href="#">归还 </a></div></div>

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
						<dd>
							<a href="${pageContext.request.contextPath}/shopcart.do?op=showCart&userName=${sessionScope.user.userName}">我的购物车</a>
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
                    <dd class="cur"><a href="#">归还</a></dd>
                </dl>
            </div>
        </div>
        <div class="member-right fr">
            <div class="member-head">
                <div class="member-heels fl"><h2>归还</h2></div>
            </div>
            <c:forEach var="r" items="${requestScope.list}">
            <div class="member-border">
                <div class="member-newly"><span><b>订单号：</b>${r.orderId}</span> <span><b>订单状态：</b><i class="reds">${r.orderState==0?"未完成":"已完成"}</i></span></div>
                <div class="member-cargo">
                    <h3>商品信息：</h3>
                </div>
                <div class="member-sheet clearfix">
                    <ul>
                        <li>
                            <div class="member-circle clearfix">
                                <div class="member-apply clearfix">
                                       <div class="ap1 fl">
                                           <span class="gr1"><a href="#"><img width="60" height="60" about="" title="" src="theme/img/pd/${r.goodImg}"></a></span>
                                           <span class="gr2"><a href="#">${r.goodName}</a></span>
                                           <span class="gr3">X${r.goodNumber}</span>
                                       </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="member-modes clearfix">
                    <p class="clearfix"><b>支付方式：</b><em>支付宝</em></p>
                    <p class="clearfix"><b>发票信息：</b><em>无发票</em></p>
                </div>
                <div class="member-modes clearfix">
                    <p class="clearfix"><b>配送方式：</b><em> 顺丰快递</em></p>
                </div>
                <div class="member-modes clearfix">
                    <p class="clearfix"><b>商品金额：</b><em> ￥${r.orderTPrice}</em></p>
                </div>
                <form method="post" action="rs.do?op=add">
                <%
                	User u = (User)request.getSession().getAttribute("user");
                	String userName = u.getUserName();
                	String goodName = (String)request.getAttribute("goodName");
                	UsersService us = new UsersServiceImpl();
                	ReturnService rs = new ReturnServiceImpl();
                	int userId = us.getUserIdByUserName(userName);
                	int goodId = rs.queryGoodId(goodName);
                	
                %>
                <div class="member-modes clearfix">
                	<p style="color: red;">*请给予您宝贵的评价：</p>
                    <script id="editor" name="content" type="text/plain" style="width:920px;height:500px;"></script>
                </div>
                <div class="member-modes clearfix">
                	<input type="hidden" name="userId" value="<%=userId%>">
                	<input type="hidden" name="goodId" value="<%=goodId%>">
                	<input type="hidden" name="orderId" value="${r.orderId}">
                	<input type="hidden" name="goodName" value="${r.goodName}">
                    <input type="submit" style="float: right;width: 70px;height: 40px;background-color: red;color: white;border: 0" value="提交">
                </div>
                </form>
            </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- 商城快讯 End -->

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
<!-- footer End -->
</body>
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>

</html>