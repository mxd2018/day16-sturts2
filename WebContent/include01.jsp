<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	-------数据标签-------<br>
	<s:property value="username" default="当属性值为null时，使用这默认的值" escapeHtml="false"/>
	<!-- 18-1-25显示的是这样的格式 -->
	<s:property value="date"/>
	<br>
	
	<!-- 2018/01/25 14:26:28 也可以使用 yyyy-MM-dd- -->
	<s:date name="date" format="yyyy/MM/dd HH:mm:ss"/>
	<br>
	
	<s:set var="i" value="321" scope="request"/>
	<s:property value="#request.i" />
	<br>
	
	<!-- 注意：1.set标签和set集合无关   2.改标签可以用来优化user.address.addr.xxx.xxx -->
	<s:set var="name" value="user.username" scope="request"/>
	<s:property value="#request.name"/>
	
	<br>
	<!-- 注意：没有这种写法，value等于的都是引用 -->
	<s:property value="http://www.baidu.com"/>
	<!-- 可以用来拼接网址 -->
	<s:url var="baidu" value="http://www.baidu.com">
		<!-- !!!注意了：value等于的是引用对象，没有aaa这个属性，因此要显示名称要加‘’ -->
		<s:param name="username" value="'aaa'"></s:param>
		<s:param name="password" value="1234"></s:param>
	</s:url>
	<s:property value="baidu"/>
	<br>
	<!-- 注意：这里的href等于的是字符串，要想使用引用变量就需要加 %{} -->
	<s:a href="%{baidu}">点击</s:a>
	<br>
	<a href="${baidu}">使用EL表达式获取OGNL</a>
	<br>
	
	<s:include value="index.jsp"></s:include>
	
	
	<s:debug></s:debug>
</body>
</html>