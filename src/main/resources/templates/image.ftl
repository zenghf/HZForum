﻿<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/wangEditor.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/profile.css">
</head>
<body>
<#include "header.ftl">

	<#--TODO: list Article page-->
	<!-- 中间主体板块 -->
	<div class="main w clearfix">
		<#list imageList as image>
		<#--<c:forEach items="${imageList}" var="image">-->
			<img src="${image}">
		<#--</c:forEach>-->
		</#list>

	</div><!-- 主体结束 -->

<#include "footer.ftl">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
</body>
</html>













