<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'GetUser.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

</head>

<body>
	<div id="a"></div>
	<br>
</body>
<script>
	jQuery(function($){
	var urlStr = "<%=request.getContextPath()%>/user/GetUser";
		var user = {
			"id" : 6,
			"userName" : "小红",
			"password" : "123",
			"age" : 12
		};
		$.ajax({
			url : urlStr,
			dataType:'json',
			contentType:'application/json;charset=utf-8',
			data : JSON.stringify(user),
			type : 'POST',
			success : function(response) {
				data = eval("(" + response + ")");
				alert(data.userName);
				$("#a").html(data.userName);
			},
			error : function(msg) {
				alert("错误");
			}
		}); // end ajax
	});
</script>
</html>
