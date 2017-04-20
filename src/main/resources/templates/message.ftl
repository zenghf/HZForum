<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/wangEditor.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/message.css">
</head>
<body>
<#include "header.ftl">


	<!-- 中间主体板块 -->
	<div class="main w clearfix" style="margin-bottom: 360px">
		<div class="message-header"><span></span>&nbsp;消息列表</div>
        <#list map?keys as key>
        <#--<c:forEach items="${map}" var="item">-->
            <div class="m-wrap">
                <div class="m-date">${key}</div>
                <ul class="m-list">
                    <#list map[key] as m>
                    <#--<c:forEach items="${map[key]}" var="m">-->
                        <li><a href="toProfile.do?uid=${m.otherId}"><span>${m.otherUsername}</span></a>${m.operation}<a href="toPost.do?pid=${m.postId}"><span>${m.displayedContent}</span></a></li>
                    <#--</c:forEach>-->
                    </#list>
                </ul>
            </div>
        <#--</c:forEach>-->
        </#list>
	</div><!-- 主体结束 -->


<#include "footer.ftl">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
</body>
</html>



