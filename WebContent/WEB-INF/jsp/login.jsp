<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="inc/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${path}/css/login.css" rel="stylesheet" type="text/css" media="all" />
	<style type="text/css">
		body 
		{
			overflow-x:hidden;
			overflow-y:hidden;
		}
</style> 
</head>
<body>
	<div id="yellow_error" class="yellow-error">
		<a href="javascript:void()" class="close"></a>
		<p class="wrong">您的用户名和密码不匹配</p>
		<p class="worp">为了帐号安全，已向您的邮箱： <strong id="sendemail"></strong>发送了一封确认信，请通过邮件内链接登录。</p>
		<p class="m-26"><a target="_blank" href="#" id="gotoEmail">打开邮箱查收确认信</a></p>
		<p class="m-26"><a href="javascript:closeError();">重新输入</a></p>
	</div>
	<div id="account_stop" class="yellow-error" >
		<a href="javascript:closeStop();" class="close"></a>
		<p class="wrong"></p>
		<p class="center">您的帐号已停止使用，如有疑问请联系<a style="background:none;padding-left:0;" target="_blank" href="http://support.renren.com/helpcenter">客服</a></p>
	</div>
	<div id="account_lock" class="yellow-error">
		<a href="javascript:closeLock();" class="close"></a>
		<p class="wrong">您的帐号由于以下某种原因需要解锁才能登录</p>
		<ol>
			<li>删除过帐号</li>
			<li>长时间没有登录网站</li>
			<li>安全原因</li>
		</ol>
		<p class="center"><a href="" target="_blank">立即解锁</a></p>
	</div>
	<form method="post" id="loginForm" class="login-form" action="${path}/user/login">
		<dl class="top clearfix">
			<dt>
				<label for="email">账户:</label></dt>
				<dd>
					<input type="text" name="email" class="input-text" id="email" tabindex="1" value=""/>
				</dd>
		</dl>
		<dl class="pwd clearfix">
			<dt>
				<label for="password">密码:</label>
			</dt>
			<dd>
				<input type="password" id="password" name="password" error="请输入密码" class="input-text" tabindex="2" />
				<a class="forgetPwd" id="forgetPwd" href="" stats="home_findpassword" target="_blank">忘记密码？</a>
			</dd>
		</dl>
		<div class="caps-lock-tips" id="capsLockMessage" style="display: none;"></div>
		<dl id="code" class="code clearfix" style="display: none;">
			<dt><label for="code">验证码:</label></dt>
			<dd>
				<input type="text" name="icode" id="icode_login" class="input-text" tabindex="3" autocomplete="off" />
				<div id="codeimg" class="codeimg clearfix">
					<img id="verifyPic_login" src=""/>
					<a href="">换一张</a>
				</div>
			</dd>	
		</dl>
		<dl class="savepassword clearfix">
			<dt>
				<label title="为了确保您的信息安全，请不要在网吧或者公共机房勾选此项！" for="autoLogin" class="labelCheckbox">
					<input type="checkbox" name="autoLogin" id="autoLogin" value="true" tabindex="4" />下次自动登录
				</label>
			</dt>
			<dd>
				<span class="getpassword" id="getpassword"><a href="" stats="home_findpassword" target="_blank">忘记密码？</a></span>
			</dd>
		</dl>
		<span id="errorMessage" class="errors_div"></span>
		<div class="log-buttonDiv clearfix">
			<input type="hidden" name="origURL" value="" />
			<input type="hidden" name="key_id" value="" />
			<input type="hidden" id="loginnum" value="0" />
			<input type="submit" id="login" class="submit_btn submit-btn" value="登录" tabindex="5"/>
			<div class="registDiv">还没有人人帐号？<a target="_blank" href="">立即注册</a></div>
		</div>
	</form>
	<div id="open-login-panel">
		<div id="open-login-title">使用合作网站帐号登录</div>
		<a class="login-weibo" target="_top" href="">微博帐号登录</a>
		<a class="login-qq" target="_top" href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=100444179&redirect_uri=www.ttgjie.com/user/qqLogin&scope=all">QQ帐号登录</a>
	</div>
	<script type="text/javascript" src="${path}/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${path}/js/user/user.js"></script>
</body>
</html>
