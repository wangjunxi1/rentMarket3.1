<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="favicon.ico">
<link rel="Shortcut Icon" href="favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>添加商品类别</title>
</head>
<body>
	<article class="cl pd-20">
		<form action="../gsback.do?op=addType" method="post" class="form form-horizontal"
			id="form-member-add">

			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>商品类别名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value=""
						placeholder="" name="typeName" id="typeName" required="required">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>商品所属父类类别：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select name="typeparentId" id="typeparentId" >
						<option value="" selected id ="op1" >请输入父类类别：</option>
					
					</select> 
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit" value="提交" />
				</div>
			</div>
		</form>
	</article>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="static/h-ui.admin/js/H-ui.admin.page.js"></script>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<!-- ajax请求代码,页面一加载就触发事件，给下拉框添加元素 -->
	

	<script type="text/javascript">
		$(function() {
			//get请求 
			$.get("../gsback.do","op=type", function(data,status) {
				
				//如何从data中提取对象
				//此时从servlet返回的是json格式的字符串,如果要转换为json对象,JSON.parse()
				
				
				
				//遍历
				$.each(data.data, function(index, type) {
					
					$("#typeparentId").append(
							"<option value="+type.typeId+">" + type.typeName
									+ "</option>");
				}); 
			});
			/*validate验证和 ajax 的方式完成表单提交 */
			/* $("#form-member-add")
					.validate(
							{
								onkeyup : false,
								focusCleanup : true,
								success : "valid",
								submitHandler : function(form) {
									//alert("submit" + form);  
									//$(form).ajaxSubmit();
									//var index = parent.layer.getFrameIndex(window.name);
									//parent.$('.btn-refresh').click();
									//parent.layer.close(index);
									$(form) 
											.ajaxSubmit(
													{
														type : 'post',
														url : "../gsback.do?op=type",
														success : function(data) {
															layer
																	.msg(
																			'操作成功!',
																			{
																				icon : 1,
																				time : 1000
																			},
																			function() {
																				//获取父层					
																				var index = parent.layer
																						.getFrameIndex(window.name);
																				//刷新父层					
																				parent.location
																						.reload();
																				//关闭弹出层			
																				parent.layer
																						.close(index);

																			});

														},
														error : function(
																XmlHttpRequest,
																textStatus,
																errorThrown) {
															console
																	.log(errorThrown
																			+ ","
																			+ XmlHttpRequest.responseText);
															layer
																	.msg(
																			'ERROR!'
																					+ errorThrown,
																			{
																				icon : 2,
																				time : 1000
																			});
														}
													});
									//ajaxSubmit结束
									return false; // 阻止表单自动提交事件

								}
							}); */
		});
	</script>
	
	<!-- 	<script type="text/javascript"
		src="http://malsup.github.io/jquery.form.js"></script> -->
	


	<!-- <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script> -->
	<script type="text/javascript">
	$(function(){
		
		
	});
	</script>

	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>