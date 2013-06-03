$(function(){
	$("form:first").submit(function(){
		$.userLogin($("#email").val(),$("#password").val(),$("#icode_login").val(),$("form:first").attr("action"));
		 return false;
	}); 
});

$.extend({
	
	userLogin : function(email, passWord,code,url)
	{
		
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; //验证邮箱的正则表达式
		
		var error =  $(".errors_div");
		var log_num = $("#loginnum");
		
		if(!reg.test(email))
		{
			$("#email").focus();
			error.text("请正确输入邮箱");
		   return false;
		}
		if(passWord.length <= 0)
		{
			$("#password").focus();
			error.text("你没有输入密码");
			return false;
		}
		if($("#code").css("display") != 'none')
		{
			if(code.length != 4)
			{
				error.text("您输入的验证码不正确");
				return false;
			}	
		}
		
		error.text("正在登陆请稍后...");
		
		$.ajax({
			url:url,
			type:'post',
			dataType:'json',
			data:{
				"email":email,
				"password":passWord
			},
			success : function(data)
			{
				if(data.result)
				{
					
				}
				else
				{
					error.text(data.failMsg);
					log_num.val(parseInt(log_num.val()) + 1);
					alert(log_num.val());
					if(log_num.val() >= 3)
					{
						$("#code").css("display","block");
					}	
				}	
			},
			error : function(error)
			{
				console.log(error);
			}
		});
		
		
		/*if($("#code").css("display") == 'none')
		{
			$("#code").css("display","block")
		}	*/
		return false;
		
	}
});