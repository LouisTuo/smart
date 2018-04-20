[1mdiff --git a/.gitignore b/.gitignore[m
[1mindex 090ae57..73c2706 100644[m
[1m--- a/.gitignore[m
[1m+++ b/.gitignore[m
[36m@@ -1,3 +1,4 @@[m
[32m+[m[32m### For Eclipse[m
 target[m
 *.class[m
 .settings[m
[1mdiff --git a/smart-sso/smart-sso-server/src/main/java/com/smart/sso/server/controller/IndexAction.java b/smart-sso/smart-sso-server/src/main/java/com/smart/sso/server/controller/IndexAction.java[m
[1mindex 6bf502f..41f8359 100644[m
[1m--- a/smart-sso/smart-sso-server/src/main/java/com/smart/sso/server/controller/IndexAction.java[m
[1m+++ b/smart-sso/smart-sso-server/src/main/java/com/smart/sso/server/controller/IndexAction.java[m
[36m@@ -1,4 +1,20 @@[m
 package com.smart.sso.server.controller;[m
 [m
[32m+[m
[32m+[m[32mimport org.springframework.stereotype.Controller;[m
[32m+[m[32mimport org.springframework.web.bind.annotation.RequestMapping;[m
[32m+[m
[32m+[m[32m@Controller[m
 public class IndexAction {[m
[32m+[m
[32m+[m[32m    @RequestMapping("/")[m
[32m+[m[32m    public String page(){[m
[32m+[m[32m         return "redirect:"+"/admin/admin";[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @RequestMapping("/smart-sso-server")[m
[32m+[m[32m    public String pageIndex(){[m
[32m+[m[32m        return "redirect:"+"/admin/admin";[m
[32m+[m[32m    }[m
[32m+[m
 }[m
[1mdiff --git a/smart-sso/smart-sso-server/src/main/java/com/smart/sso/server/controller/LoginController.java b/smart-sso/smart-sso-server/src/main/java/com/smart/sso/server/controller/LoginController.java[m
[1mindex c395961..2bb8bbb 100644[m
[1m--- a/smart-sso/smart-sso-server/src/main/java/com/smart/sso/server/controller/LoginController.java[m
[1m+++ b/smart-sso/smart-sso-server/src/main/java/com/smart/sso/server/controller/LoginController.java[m
[36m@@ -53,6 +53,7 @@[m [mpublic class LoginController extends BaseController{[m
 	public String login([m
 			@ApiParam(value = "返回链接", required = true) @ValidateParam({ Validator.NOT_BLANK }) String backUrl,[m
 			HttpServletRequest request) {[m
[32m+[m[41m[m
 		String token = CookieUtils.getCookie(request, TokenManager.TOKEN);[m
 		if (StringUtils.isNotBlank(token) && tokenManager.validate(token) != null) {[m
 			return "redirect:" + authBackUrl(backUrl, token);[m
[36m@@ -70,6 +71,7 @@[m [mpublic class LoginController extends BaseController{[m
 			@ApiParam(value = "密码", required = true) @ValidateParam({ Validator.NOT_BLANK }) String password,[m
 			@ApiParam(value = "验证码", required = true) @ValidateParam({ Validator.NOT_BLANK }) String captcha,[m
 			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {[m
[32m+[m[41m[m
 		if (!CaptchaHelper.validate(request, captcha)) {[m
 			request.setAttribute("errorMessage", "验证码不正确");[m
 			return goLoginPath(backUrl, request);[m
[1mdiff --git a/smart-sso/smart-sso-server/src/main/webapp/WEB-INF/view/login.jsp b/smart-sso/smart-sso-server/src/main/webapp/WEB-INF/view/login.jsp[m
[1mindex 770dc4f..946548c 100644[m
[1m--- a/smart-sso/smart-sso-server/src/main/webapp/WEB-INF/view/login.jsp[m
[1m+++ b/smart-sso/smart-sso-server/src/main/webapp/WEB-INF/view/login.jsp[m
[36m@@ -17,6 +17,7 @@[m
 		[m
 		<script type="text/javascript">[m
 			var url = window.location.href;[m
[32m+[m			[32malert(url);[m[41m[m
 			if(url.indexOf('${loginUrl}') == -1){[m
 				window.location.href = '${_path}${loginUrl}';[m
 			}[m
[36m@@ -83,7 +84,7 @@[m
 												<fieldset>[m
 													<label class="block clearfix form-group">[m
 														<span class="block input-icon input-icon-right help-validate">[m
[31m-															<input id="_account" name="account" type="text" class="form-control form-data" placeholder="登录名"[m
[32m+[m															[32m<input id="_account" name="account" type="text" class="form-control form-data" placeholder="用户名"[m[41m[m
 																required="true" minlength = '4'/>[m
 															<i class="ace-icon fa fa-user"></i>[m
 														</span>[m
[1mdiff --git a/smart-sso/smart-sso-server/src/main/webapp/WEB-INF/web.xml b/smart-sso/smart-sso-server/src/main/webapp/WEB-INF/web.xml[m
[1mindex 2e89e1c..172a74e 100644[m
[1m--- a/smart-sso/smart-sso-server/src/main/webapp/WEB-INF/web.xml[m
[1m+++ b/smart-sso/smart-sso-server/src/main/webapp/WEB-INF/web.xml[m
[36m@@ -3,6 +3,7 @@[m
 	xmlns="http://java.sun.com/xml/ns/javaee"[m
 	xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"[m
 	version="3.0">[m
[32m+[m	[32m<display-name>hh</display-name>[m
 	<!-- Spring核心 -->[m
 	<listener>[m
 		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>[m
[36m@@ -91,4 +92,9 @@[m
 		<load-on-startup>2</load-on-startup>[m
 		<async-supported>true</async-supported>[m
 	</servlet>[m
[32m+[m	[32m<!-- 配置错误访问界面 dev-->[m
[32m+[m	[32m<error-page>[m
[32m+[m		[32m<location>/smart-sso-server</location>[m
[32m+[m	[32m</error-page>[m
[32m+[m
 </web-app>[m
\ No newline at end of file[m
