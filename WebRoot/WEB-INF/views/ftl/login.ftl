<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>
			PUMA Framework&mdash;&mdash;让系统开发更简单一点
		</title>
		<meta content="" name="keywords">
		<meta content="" name="description">
		<link href="images/favicon.ico" rel="shortcut icon" type="images/x-icon">
		<link href="include/login.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="resources/jquery.js"></script>
		<!--[if lt IE 9]>
			<script src="include/html5.js" type="text/javascript" xmlns="http://www.w3.org/1999/xhtml">
			</script>
		<![endif]-->
		<script type="text/javascript">
		//the cookie plugin
		var pluses=/\+/g;function raw(s){return s;}
		function decoded(s){return decodeURIComponent(s.replace(pluses,' '));}
		function converted(s){if(s.indexOf('"')===0){s=s.slice(1,-1).replace(/\\"/g,'"').replace(/\\\\/g,'\\');}
		try{return config.json?JSON.parse(s):s;}catch(er){}}
		var config=$.cookie=function(key,value,options){if(value!==undefined){options=$.extend({},config.defaults,options);if(typeof options.expires==='number'){var days=options.expires,t=options.expires=new Date();t.setDate(t.getDate()+days);}
		value=config.json?JSON.stringify(value):String(value);return(document.cookie=[config.raw?key:encodeURIComponent(key),'=',config.raw?value:encodeURIComponent(value),options.expires?'; expires='+options.expires.toUTCString():'',options.path?'; path='+options.path:'',options.domain?'; domain='+options.domain:'',options.secure?'; secure':''].join(''));}
		var decode=config.raw?raw:decoded;var cookies=document.cookie.split('; ');var result=key?undefined:{};for(var i=0,l=cookies.length;i<l;i++){var parts=cookies[i].split('=');var name=decode(parts.shift());var cookie=decode(parts.join('='));if(key&&key===name){result=converted(cookie);break;}
		if(!key){result[name]=converted(cookie);}}
		return result;};config.defaults={};$.removeCookie=function(key,options){if($.cookie(key)!==undefined){$.cookie(key,'',$.extend(options,{expires:-1}));return true;}
		return false;};
		</script>
		<script type="text/javascript">
		    	// speed in milliseconds
				var scrollSpeed = 80;
				 
				// set the default position
				var current = 0;
			
				// set the direction
				var direction = 'h';
			
				bgscroll = function(){
			    	// 1 pixel row at a time
				    current -= 1;
			   
				    // move the background with backgrond-position css properties
				    $('#main-content').css("backgroundPosition", (direction == 'h') ? current+"px 0" : "0 " + current+"px");
			   
				}; 
				//Calls the scrolling function repeatedly
				setInterval("bgscroll()", scrollSpeed);	
			
				 function slideSwitch() {
					    var $active = $('#img-content IMG.active');

					    if ( $active.length == 0 ) $active = $('#img-content IMG:last');

					    // use this to pull the images in the order they appear in the markup
					    var $next =  $active.next().length ? $active.next()
					        : $('#img-content IMG:first');

					    // uncomment the 3 lines below to pull the images in random order
					    
					    // var $sibs  = $active.siblings();
					    // var rndNum = Math.floor(Math.random() * $sibs.length );
					    // var $next  = $( $sibs[ rndNum ] );


					    $active.animate({opacity: 0.0}, 500, function() {
					    	$active.addClass('last-active');
				        });

					    
					    $next.css({opacity: 0.0})
					        .addClass('active')
					        .animate({opacity: 1.0}, 1500, function() {
					            $active.removeClass('active last-active');
					        });
					    
					}
				 	setInterval( "slideSwitch()", 3000 );
				 	
				 	//hack IE compatible
				 	$(function(){
						 $('#img-content IMG.active').css({opacity: 1.0});
				 	});
		</script>
	</head>
	
	<body>
		<div class="page" id="container">
			<header class="header clearfix">
				<div class="header-inner">
					<a class="logo" href="http://www.pumacms.com/">
						PUMA Framework
					</a>
					<div class="header-nav">
						<a class="b-no-ln" hidefocus="true" href="#" id="top_menu_other" target="_blank">
							框架建议
						</a>
						<!-- |
						<a class="b-no-ln-download" hidefocus="true" href="#" target="_blank">
							公司首页
						</a> -->
					</div>
					<div class="clear">
					</div>
				</div>
			</header>
			<section class="main">
				<div id="main-content" class="main-content">
					<div class="slide" id="slideContent">
						<div id="img-content" class="img-content">
							<img src="include/img/browser-compatible.png" alt="浏览器兼容" class="active" />
						    <img src="include/img/spring-based.png" alt="基于Spring构建" />
						</div>
						<div class="login">
							<div id="login">
								<ul class="header-tab">
									<li class="current">
										普通登录
									</li>
									<li attr="phone">
										学号登录(暂停)
									</li>
								</ul>
								<div class="header-login">
									<p class="pass-error0" id="PassError0">
										<#if status = 800>
										您已经在其他地方登陆!
										<#elseif status = 801>
										长时间没操作,会话已经过期,请重新登录!
										<#elseif status = 802>
										成功注销!
										<#elseif status = 803>
										请先登录!
										<#elseif status = 403>
										您被禁止访问!
										</#if>
									</p>
									<div class="login-div" id="login-outer">
										<form class="pass_login_form" id="form-login" action="j_spring_security_check">
											<p class="pass_login_p pass_login_p_username" id="pass_login_p_school_0">
												<label class="pass_login_label pass_login_label_school" id="pass_login_label_school_0" for="pass_login_school_0">
													学&#12288;校
												</label>
												<select style="color: rgb(153, 153, 153);" class="pass_login_input pass_login_input_school" id="pass_login_school_0" name="j_school">
													<option>一所综合性大学</option>
												</select>
												<span class="pass_login_err" id="pass_login_school_0_err">
												</span>
												<span class="pass_login_tip" id="pass_login_school_0_tip">
												</span>
											</p>
											<p class="pass_login_p pass_login_p_username" id="pass_login_p_username_0">
												<label class="pass_login_label pass_login_label_username" id="pass_login_label_username_0" for="pass_login_username_0">
													邮&#12288;箱
												</label>
												<input  type="text" class="pass_login_input pass_login_input_username" id="pass_login_username_0" name="j_username">
												<span class="pass_login_err" id="pass_login_username_0_err">
												</span>
												<span class="pass_login_tip" id="pass_login_username_0_tip">
												</span>
											</p>
											<p class="pass_login_p pass_login_p_password" id="pass_login_p_password_0">
												<label class="pass_login_label pass_login_label_password" id="pass_login_label_password_0" for="pass_login_password_0">
													密&#12288;码
												</label>
												<input type="password" class="pass_login_input pass_login_input_password" id="pass_login_password_0" name="j_password">
												<span class="pass_login_err" id="pass_login_password_0_err">
												</span>
												<span class="pass_login_tip" id="pass_login_password_0_tip">
												</span>
											</p>
											<p class="pass_login_p pass_login_p_verifycode" id="pass_login_p_verifycode_0">
												<label class="pass_login_label pass_login_label_verifycode" name="j_captcha" maxlength="4" id="pass_login_label_verifycode_0" for="pass_login_verifycode_0">
													验证码
												</label>
												<input type="text" class="pass_login_input pass_login_input_verifycode" id="pass_login_verifycode_0" name="verifycode">
												<span class="pass_login_err" id="pass_login_verifycode_0_err">
												</span>
												<span class="pass_login_tip" id="pass_login_verifycode_0_tip">
												</span>
											</p>
											<p class="pass_login_p pass_login_p_img_verifycode" id="pass_login_p_img_verifycode_0">
												<img src="captcha.jpeg" class="pass_login_verifycode" id="pass_login_img_verifycode_0" alt="验证码图片" title="验证码图片">
												<span class="pass_login_change_verifycode" id="pass_login_change_verifycode_0">
													看不清？
												</span>
											</p>
											<p class="pass_login_p pass_login_p_rem" id="pass_login_p_rem_0">
												<!-- <input type="checkbox" class="pass_login_input pass_login_input_rem" id="pass_login_rem_0" name="mem_pass" checked="checked">
												<label class="pass_login_label pass_login_label_rem" name="_spring_security_remember_me" id="pass_login_label_rem_0" for="pass_login_rem_0">
													记住密码
												</label> -->
											</p>
											<p id="pass_login_p_btn_0" class="pass_login_p pass_login_p_btn">
												<input type="submit" value="登录" id="pass_login_input_submit_0" class="pass_login_input pass_login_input_submit">
												<!-- <a id="pass_login_a_fgtpwd_0" class="pass_login_a_fgtpwd" href="#" target="_blank">忘记密码？</a> -->
											</p>
									</form>
									</div>
									<div class="login-div" id="login-outer-phone" style="display:none">
									</div>
									<div class="login-info">
										<p id="login-create">
											没有帐号？
										</p>
										<a class="link-create" hidefocus="true" href="register.html">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="feature">
				<div class="service clearfix">
					<div class="service-item feature-browser">
						<div class="pic">
							<span>
							</span>
						</div>
						<div class="text">
							<h4>
								浏览器兼容
							</h4>
							<p>
								IE7,8,9
							</p>
							<p>
								Firefox,Safri,Chrome
							</p>
							<p>
								搜狗浏览器,360安全浏览器
							</p>
						</div>
					</div>
					<div class="service-item feature-spring">
						<div class="pic">
							<span>
							</span>
						</div>
						<div class="text">
							<h4>
								基于Spring后台
							</h4>
							<p>
								Spring MVC
							</p>
							<p>
								Spring Data JPA
							</p>
							<p>
								Spring Security
							</p>
						</div>
					</div>
					<div class="service-item feature-jquery">
						<div class="pic">
							<span>
							</span>
						</div>
						<div class="text">
							<h4>
								基于JQuery前台
							</h4>
							<p>
								JQuery+JEasyUI
							</p>
							<p>
								模块化按需加载
							</p>
							<p>
								灵活的界面配置
							</p>
						</div>
					</div>
					<div style="float:left;clear:both;height:25px;width:100%;"></div>
					<div class="service-item feature-maven">
						<div class="pic">
							<span>
							</span>
						</div>
						<div class="text">
							<h4>
								Maven工程配置
							</h4>
							<p>
								一键配置开发工程
							</p>
							<p>
								自动HTML,JS，CSS优化
							</p>
							<p>
								详细的文档说明
							</p>
						</div>
					</div>
					<div class="service-item feature-cache">
						<div class="pic">
							<span>
							</span>
						</div>
						<div class="text">
							<h4>
								缓存设置
							</h4>
							<p>
								灵活的缓存配置
							</p>
							<p>
								缩短请求响应时间
							</p>
							<p>
								提高用户体验
							</p>
						</div>
					</div>
					<div class="service-item feature-plugin">
						<div class="pic">
							<span>
							</span>
						</div>
						<div class="text">
							<h4>
								模块化开发
							</h4>
							<p>
								前后端模块化开发
							</p>
							<p>
								提供多种工具类
							</p>
							<p>
								缩短开发周期
							</p>
						</div>
					</div>
				</div>
			</section>
			<footer class="footer">
				<p>
					&copy;2013 Andicentury
					<!-- <a href="#" target="_blank">
						框架特点
					</a>
					|
					<a href="#" target="_blank">
						服务协议
					</a>
					| -->
					<a href="doc/index.html" target="_blank">
						文档中心
					</a>
					<!-- |
					<a href="#" target="_blank">
						问题反馈
					</a> -->
				</p>
			</footer>
		</div>
	
<script>

		$(document).ready(function()
		{
			$('#pass_login_username_0').focus();
			/*
			 * JS login effect
			 * This script will enable effects for the login page
			 */
				// Elements
			var doc = $('html').addClass('js-login'),
				container = $('#container'),
				formLogin = $('#form-login'),
				vcode_img = $('#pass_login_img_verifycode_0,#pass_login_change_verifycode_0'),
				// If layout is centered
				centered;

			/******* EDIT THIS SECTION *******/

			/*
			 * AJAX login
			 * This function will handle the login process through AJAX
			 */
			formLogin.submit(function(event)
			{
				// Values
				var login = $.trim($('#pass_login_username_0').val()),
					pass = $.trim($('#pass_login_password_0').val()),
					vcode = $.trim($('#pass_login_verifycode_0').val()),
					rememberme = $('#pass_login_rem_0').attr("checked");

				// Check inputs
				if (login.length === 0)
				{
					// Display message
					displayError('请输入邮箱!');
					return false;
				}else if(login.length > 0){
					var isValid = login.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/);
					if(!isValid){
						displayError("邮箱格式不正确!");
						return false;
					}
				}
				if (pass.length === 0)
				{
					// Remove empty login message if displayed
					//formLogin.clearMessages('Please fill in your login');

					// Display message
					displayError('请输入密码!');
					return false;
				}
				if (vcode.length < 4)
				{
					// Remove empty login message if displayed
					//formLogin.clearMessages('Please fill in your login');

					// Display message
					displayError('请输入4位验证码!');
					return false;
				}
				// Remove previous messages
				//formLogin.clearMessages();

				// Show progress
				displayLoading('正在验证用户名和密码...');

				// Stop normal behavior
				event.preventDefault();

				$.ajax({ 
						url:'j_spring_security_check',
						type:'POST', 
				  		data: {
				  			j_username:	login,
				  			j_password:	pass,
				  			j_captcha: vcode,
				  			j_remember: rememberme
				  		},
				  		success: function(data)
				  		{
				  			if (data.logged)
				  			{
				  				//formLogin.clearMessages();
				  				displayLoading('验证通过，正在进入系统...');
								setTimeout(function() {
									//console.log(document);
									//console.log(location);
									//console.log($.cookie("puma-current-hash"));
									if($.cookie("puma-current-hash")){
										document.location.href = $.cookie("puma-current-hash");
									}else{
										document.location.href = 'main.html';
									}
								}, 500);
				  			}
				  			else
				  			{
				  				//formLogin.clearMessages();
				  				displayError(data.message);
				  				reloadVCode();
				  				//alert('Invalid user/password, please try again');
				  			}
				  		},
				  		error: function()
				  		{
				  			//formLogin.clearMessages();
				  			displayError('Error while contacting server, please try again!');
				  			//alert('Error while contacting server, please try again');
				  		}
				  });
			});
			
			$("#pass_login_p_school_0").hide();
			$("ul.header-tab li").click(function(){
				$(this).parent().find("li.current").removeClass("current");
				$(this).addClass("current");
				var index = $(this).index();
				switch(index){
					case 0:
						$("#pass_login_p_school_0").hide();
						$(this).parent().css("background-position","-332px 0");
						$("#pass_login_label_username_0").html("邮&#12288;箱");
						break;
					case 1:
						$("#pass_login_p_school_0").show();
						$(this).parent().css("background-position","-332px -40px");
						$("#pass_login_label_username_0").html("学&#12288;号");
						break;
				}
				
			});

			/******* END OF EDIT SECTION *******/
			/* $("#container").width($(document).width());
			$(window).resize(function(){
				$("#container").width($(document).width());
			}); */
			// Handle resizing (mostly for debugging)
			/* function handleLoginResize()
			{
				// Detect mode
				centered = (container.css('position') === 'absolute');

				// Set min-height for mobile layout
				if (!centered)
				{
					container.css('margin-top', '');
				}
				else
				{
					if (parseInt(container.css('margin-top'), 10) === 0)
					{
						centerForm(false);
					}
				}
			};

			 // Register and first call
			$(window).bind('normalized-resize', handleLoginResize);
			handleLoginResize();

			function centerForm(animate, ignore)
			{
				// If layout is centered
				if (centered)
				{
					var siblings = formLogin.siblings(),
						finalSize = formLogin.outerHeight();

					// Ignored elements
					if (ignore)
					{
						siblings = siblings.not(ignore);
					}

					// Get other elements height
					siblings.each(function(i)
					{
						finalSize += $(this).outerHeight(true);
					});

					// Setup
					container[animate ? 'animate' : 'css']({ marginTop: -Math.round(finalSize/2)+'px' });
				}
			};

			// Initial vertical adjust
			centerForm(false); */

			/**
			 * Function to display error messages
			 * @param string message the error to display
			 */
			function displayError(message)
			{
				$("#PassError0").html(message);
			}

			/**
			 * Function to display loading messages
			 * @param string message the message to display
			 */
			function displayLoading(message)
			{
			}
			
			/** 刷新验证码 */
			vcode_img.click( function() {
				reloadVCode();
			});
			
			function reloadVCode(){

				var timestamp = (new Date()).valueOf();
				var imageSrc = vcode_img.attr("src");
				if(imageSrc.indexOf("?") >= 0) {
					imageSrc = imageSrc.substring(0, imageSrc.indexOf("?"));
				}
				imageSrc = imageSrc + "?timestamp=" + timestamp;
				vcode_img.attr("src", imageSrc);
			
			}
		});

	</script>
</body>
</html>