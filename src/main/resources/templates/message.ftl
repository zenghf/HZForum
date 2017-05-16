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


	<div class="main w clearfix" style="margin-bottom: 360px">
		<div class="message-header"><span></span>&nbsp;List of Messages</div>
        <#list map?keys as key>
            <div class="m-wrap">
                <div class="m-date">${key}</div>
                <ul class="m-list">
                    <#list map[key] as m>
                        <li>
                            <a href="toProfile?uid=${m.otherId}">
                                <span>${m.otherUsername}</span></a> ${m.operation} <a href="toPost?pid=${m.postId}"><span>${m.displayedContent}</span>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#list>
	</div>


<#include "footer.ftl">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
</body>
</html>



