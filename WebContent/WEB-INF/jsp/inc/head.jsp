<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${path}/js/jquery-1.9.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 弹出插件 -->
	<script type="text/javascript" src="${path}/js/fancyBox/jquery.fancybox.js?v=2.1.4"></script>
	<link rel="stylesheet" type="text/css" href="${path}/js/fancyBox/jquery.fancybox.css?v=2.1.4" media="screen" />
<!-- end -->
<script type="text/javascript">
$(function() { 
	$('.fancybox').fancybox();
    var elm = $('#nav'); 
    var startPos = $(elm).offset().top; 
    $.event.add(window, "scroll", function() { 
        var p = $(window).scrollTop(); 
        $(elm).css('position',((p) > startPos) ? 'fixed' : 'static'); 
        $(elm).css('top',((p) > startPos) ? '0px' : ''); 
    }); 
    
    $("#pub-trigger").hover(function(){$("#pub-receive").css("display","block")},function(){$("#pub-receive").css("display","none");});
    $("#drop-nav").hover(function(){$("#drop_down_div").css("display","block")},function(){$("#drop_down_div").css("display","none");});
}); 
</script>
<!-- head -->
		<div id="header"><!-- width: 1696px;  -->
			<div class="header clearfix" style="visibility: visible;">
				<div class="logos">
					<a class="logo" href="" hidefocus="true"></a> 
					<span class="slogan"></span>
				</div>
				<ul class="menu">
					<c:choose>
						<c:when test="${sessionScope.user == null}">	
							<li class="tools">
								<a class="btn fancybox.iframe fancybox" href="${path}/login" target="_blank" title = "用户登录" hidefocus="true"><b>
									<i class="ico-mobile"></i><span>登录</span></b>
								</a>
								<!-- <a class="btn" href="" hidefocus="true" target="_blank"><b>
									<i class="ico-collector"></i><span>采集器</span></b>
								</a> -->
							</li> 
							<li class="login">
								<a class="header_login"  hidefocus="true" id="header_login">人人登录</a>
								<a class="header_login_weibo" ref="nav" href="">微博登录</a>
								<a class="header_login_qq" ref="nav" href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=100444179&redirect_uri=www.ttgjie.com/user/qqLogin&scope=all">QQ登录</a>
								<a class="header_go_register fancybox" ref="nav" href="#plaza-darens" title="注册">注册</a>
							</li>
						</c:when>
						<c:otherwise>				
					<li class="splitor"></li>
					<li class="header-pub" id="pub-trigger">
						<a class="head-pub-btn" hidefocus="true"></a>
						<div class="header-pub-box" id="pub-receive">
							<ul class="pub clearfix">
								<li class="h-pub-item">
									<a href="javascript:void(0);" class="pubgoods" hidefocus="true">上传商品</a>
								</li>
								<li class="h-pub-item">
									<a href="javascript:void(0);" class="pubpics" hidefocus="true">上传图片</a>
								</li>
								<li class="h-pub-item">
									<a href="javascript:void(0);" class="pubstatus" hidefocus="true">购物心得</a>
								</li>
								<li class="h-pub-item">
									<a href="javascript:void(0);" class="pubalbum" hidefocus="true">创建专辑</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="account clearfix">
						<a href="http://j.renren.com/u/521856879" class="header-avatar">
							<img src="${path}/img/test/head_jssS_441400000413125f.jpg" width="25" height="25">
						</a>
						<div class="drop-nav" id="drop-nav">
							<div class="account-info clearfix" hidefocus="true">
								<a href="">${sessionScope.user.username}</a>
								<i class="ico-arrow-down" id="drop_down"></i>
							</div>
							<ul class="entry" id="drop_down_div">
								<li><a href="">我的分享</a></li>
								<li><a href="">我的专辑</a></li>
								<li class="seperator"><a href="">我喜欢的</a></li>
								<li><a href="${path}/toMmessagecenter" target="_blank">消息中心</a></li>
								<li class="seperator"><a target="_blank" href="">个人设置</a></li>
								<li><a href="${path}/user/logout">退出</a></li>
							</ul>
						</div>
					</li>
				</c:otherwise>	
					
				</c:choose>
				</ul>
			</div>
			</div>
		<!-- head end -->
		
		<!-- nav -->
		<div id="navigation">
			<div id="nav"><!-- class="fixed-nav" -->
				<ul class="nav new-nav clearfix" style="visibility: visible;">
					<li>
						<a href="${path}/" class="current" hidefocus="true">首页</a>
					</li>
					<li>
						<a href="${path}/toMyAttention" id="nav-new-index" hidefocus="true">我的关注</a>
					</li>
					<li class="new-nav-avenue">
						<ul class="avenue-sub-nav">
							<li class="new-nav-gb">
								<a href="${path}/toViewPage" class="current" hidefocus="true">逛街</a>
							</li>
							<li>
								<a href="http://j.renren.com/avenue/men" hidefocus="true">男人</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="${path}/toMyAlbum">我的分享</a>
					</li>
					<li>
						<a href="${path}/starchannel">达人</a>
					</li>
					<li>
						<a href="${path}/sheAlbum">她的收藏</a>
					</li>
					<li class="nav-discount">
						<a href="${path}/toList" class="" hidefocus="true">逛折扣<i class="ico-sale"></i></a>
					</li>
					<!--
					<li>
					<a href="/activities/spring" target="_blank" hidefocus="true">活动</a>
					</li>
					-->
					<li class="search" id="search">
						<form method="get" action="" class="form-search">
							<input type="hidden" name="t" value="">
							<input type="text" name="query" class="input-medium search-query textbox" placeholder="搜宝贝，找达人">
							<input type="submit" class="submit ico-search">
						</form>
					</li>
				</ul>
			</div>
		</div>
		<!-- nav end -->
		<!-- user login -->
		
