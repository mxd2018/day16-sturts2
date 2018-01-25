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
	
	<!-- 
	这是动态引入：
		1.先编译后合并，每个jsp比较独立；
		2.是jsp:include的一个载体，进行了轻量的包装
	静态引入：
		1.先合并后编译，合并后就变成了一个servlet，当其中的一个jsp页面发生改动后整个servlet要重写编译，因此效率很低
	-->
	<%-- <s:include value="include01.jsp"></s:include> --%>
	<br>	
	---------控制标签--------
	<br>
	<!-- 这里有个问题：使用小于的话，小于符号会和标签的符号冲突 -->
	<s:if test="user.age>20" >大于20岁</s:if>
	<s:else>小于20岁</s:else>
	<br>
	<s:iterator var="list" value="{'list1','list2','list3'}" status="sta">
		<!-- odd是奇数，even是偶数判断的都是count -->
		<s:property value="list"/>
		---<s:property value="#sta.count"/>
		---<s:property value="#sta.index"/>
		---<s:property value="#sta.odd"/>
		---<s:property value="#sta.even"/>
		<br>
	</s:iterator>
	<!-- 用于知道循环次数的，不要忘记加# -->
	<s:iterator begin="0" end="2" step="1" status="sta">
		<s:property value="{'list1','list2','list3'}.get(#sta.index)"/>
	</s:iterator>
	<br><br><br>
	
	---------UI标签(表单标签)--------
	<!-- theme表示主题，不同的主题有不同的显示风格 -->
	<s:form action="XX"  method="post" theme="xhtml">
	<s:textfield name="username" label="用户名" ></s:textfield>
	<s:password name="password" label="密码"></s:password>
	<s:textarea name="info" label="介绍"></s:textarea>
	
	<!-- 注意：name属性必须要写 -->
	<s:radio list="#{'0':'男','1':'女'}" label="性别" name="gender" value="1"></s:radio>
	
	<!-- 从后台获得genders集合 -->
	<s:radio list="genders" name="gender2" listKey="id" listValue="sex" value="0"></s:radio>
	<s:submit name="提交"></s:submit>
	<s:reset name="重置"></s:reset>
	<input type="button" value="点击">

</s:form>
	
	
	<s:debug></s:debug>
</body>
</html>