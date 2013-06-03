<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="inc/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN" dir="ltr">
<head>
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" media="screen" href="${path}/css/base_rr.css">
<link type="text/css" rel="stylesheet" href="${path}/css/info.css" />
</head>
<body screen_capture_injected="true">
	<div>
		<%@include file="inc/head.jsp"%>
		
		<div class="container clearfix">
<div class="left-aside">
<dl class="infonav">
<dt class="infonav-title">消息中心</dt>
<!-- user -->
<dt><span class="ilb"></span>通知</dt>
<dd id="replynav" class="active"><span>0</span>留言/回复</dd>
<dd id="atnav" class=""><span>0</span>@中提到你的</dd>
<dd id="msgnav" class=""><span>0</span>私信</dd>
<!-- sys -->
<dt><span class="ilb"></span>公告</dt>
<dd id="sysnav"><span>0</span>系统消息</dd>
</dl>
</div>
<div class="right-main" id="info">
<div class="infotab">
<span id="readAll" title="全部设为已读">全部设为已读</span>
<a href="javascript:void(0);" id="showAll" hidefocus="true" class="active">全部</a>
<a href="javascript:void(0);" id="showUnread" hidefocus="true">仅查看未读</a>
</div>
<div class="infos">
<!-- 留言/回复 #info-reply -->
<ul id="info-reply"><div id="zeroPage">                    <div class="note">                        <img src="./人人逛街 - 人人网旗下购物分享社区_files/zero.png">亲,你还没有新的留言/回复哦~~~                    </div>                    <dl class="link">                       <dt>你可以继续</dt>                       <dd><a href="http://j.renren.com/avenue/" target="_blank">逛宝贝</a></dd>                       <dd><a href="http://j.renren.com/home/" target="_blank">看好友动态</a></dd>                       <dd><a href="http://j.renren.com/u/521856879" target="_blank">参观我的个人主页</a></dd>                    </dl>                </div></ul>
<!-- @ #info-at -->
<ul id="info-at"></ul>
<!-- 私信 #info-msg -->
<ul id="info-msg"></ul>
<!-- 系统消息 #info-sys-->
<ul id="info-sys"></ul>
<center id="loading" style="display: none;">正在加载...</center>
<center id="fetchMore" style="display: none;">查看更多</center>
</div>
</div>
</div>
		<!-- foot -->
		
		<%@include file="inc/foot.jsp"%>
		
		<!-- foot end -->
	</div>	

</body>
</html>