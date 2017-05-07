<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/profile.css">
</head>
<body>
<#include "header.ftl">

	<div class="main w clearfix">
		<div class="m-left">
			<div class="user-image"><img src="${user.headUrl}"></div>
			<div class="user-info">
				<div class="user-name">${user.username}</div>
				<div class="user-desc">${user.description}</div>
				<div class="user-position">Location: ${user.position}</div>
				<div class="user-school">School: ${user.school}</div>
				<div class="user-job">Job: ${user.job}</div>
			</div>
			<div class="clearfix" style="border-bottom: 1px dashed #ddd;"></div>
			<div class="user-button">
				<#if following>
					<a href="unfollow?uid=${user.uid}" class="button-unfollow">unfollow</a>
				<#else>
					<a href="follow?uid=${user.uid}" class="button-follow">follow</a>
				</#if>
			</div>

			<div class="user-post">
				<div class="user-post-title"><span></span>&nbsp;Posts</div>
				<ul class="user-post-list">
                    <#list postList as post>
                        <li>
                            <span class="glyphicon glyphicon-file"></span>&nbsp;
                            <a href="toPost?pid=${post.pid}">${post.title}</a>
                            <span class="user-post-time">published ${post.publishTime}</span>
                        </li>
                    </#list>
				</ul>
			</div>
		</div>

		<div class="m-right">
			<div class="user-follow">
				<div class="user-follow">following &nbsp;<span class="user-count">${user.followCount}</span></div>
				<div class="user-follower">followers &nbsp;<span class="user-count">${user.followerCount}</span></div>
			</div>
			<div class="user-attr">
				<span class="user-like-count">liked: ${user.likeCount}</span>
				<span class="user-post-count">posts: ${user.postCount!'0'}</span>

			</div>
			<div class="user-scan-count">viewed: ${user.scanCount!'0'}</div>
		</div>

	</div><!-- 主体结束 -->

<#include "footer.ftl">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
</body>
</html>













