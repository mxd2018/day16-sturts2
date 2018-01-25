<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<sx:head parseContent="true"/>
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
	<!-- 注意：在struts里面，表单的action最好不要写 # 号，会使二级联动产生异常 -->
	<s:form action="XX"  method="post" theme="xhtml">
	
	<s:textfield name="username" label="用户名" ></s:textfield>
	<s:password name="password" label="密码"></s:password>
	<s:textarea name="info" label="介绍"></s:textarea>
	
	<!-- 注意：name属性必须要写 -->
	<s:radio list="#{'0':'男','1':'女'}" label="性别" name="gender11" value="0"></s:radio>
	
	<!-- 从后台获得genders集合,注意：这里的listKey是表单提交后传递的参数 -->
	<s:radio list="genders" name="gender22" listKey="id" listValue="sex" value="2"></s:radio>
	<s:select list="genders" name="gender33" listKey="id" listValue="sex"  label="性别2" value="1"></s:select>
	<!-- 省市联动 -->
	<!-- 注意：1.keySet()获得map集合所有的键, listValue是下拉框要显示的内容
		 	 2.get(top)表示获得选中的键上的值
	-->
	<s:doubleselect list="map.keySet()" name="pro" listKey="pid" listValue="pname" doubleList="map.get(top)"  doubleName="cit" doubleListKey="cid" doubleListValue="cname" label="省市"></s:doubleselect>
	
	<!-- 注意：1.日期标签需要加jar包，和taglib标签，是一个额外的插件 
		 	 2.因为日期比较特殊，因此还要在头文件加上sx:head parseContent="true"
		 	 3.加label会出错
		 	 4.该日期标签不能使用事件，因此与js交互很差，了解即可
	-->
	生日：<sx:datetimepicker name="birthday" displayFormat="yyyy-MM-dd"></sx:datetimepicker>
	
	
	<s:submit name="提交"></s:submit>
	<s:reset name="重置"></s:reset>
	<input type="button" value="点击">

	</s:form>
	
	
	<s:debug></s:debug>
</body>
</html>