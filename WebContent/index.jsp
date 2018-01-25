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
	欢迎您
	<br>
	<hr>
	<!-- value直接引用属性，不需要加# -->
	<s:property value="flag"/>
	<br>
	<s:property value="user.username"/>
	<br>
	<!-- 注意：1.使用request域在Action中要实现接口   2.这类取值使用request不是requestScope，原因是与el表达式区分 -->
	<s:property value="#request.req"/>
	<br>
	--------------list的取值-------------
	<br>
	<s:property value="list"/>
	<br>
	<!-- list集合根据索引获得元素有以下两种方式 -->
	<s:property value="list[0]"/>
	<br>
	<s:property value="list.get(0)"/>
	<br>
	<s:property value="list.size()"/>
	<br>
	--------------set的取值-------------
	<br>
	<s:property value="set"/>
	<br>
	<!-- set集合没有根据索引获得元素的方法，因此需要将set转化为数组 -->
	<s:property value="set.toArray()[0]"/>
	<br>
	--------------map的取值-------------
	<br>
	<s:property value="map"/>
	<br>
	<s:property value="map.map1"/>
	<br>
	<!-- 注意：这里[]中的键要加‘’ -->
	<s:property value="map['map1']"/>
	<br>
	------------在页面构造集合--------------------
	<br>
	<s:property value="#{'key1':'value11','key2':'value22','key3':'value33'}.key1"/>
	<br>
	<s:property value="{'list1','list2','list3'}[0]"/>
	<br>
	------------投影过滤--------------------
	<br>
	<!-- 过滤所有符合条件的集合 -->
	<s:property value="users.{?#this.age>=21}"/>
	<br>
	<!-- 过滤第一个符合条件的元素，本质是只有一个元素的集合 -->
	<s:property value="users.{^#this.age>=21}[0].username"/>
	<br>
	<!-- 过滤最后一个符合条件的元素，本质是只有一个元素的集合 -->
	<s:property value="users.{$#this.age>=21}[0].username"/>
	
	
	
	
	<s:debug></s:debug>
</body>
</html>