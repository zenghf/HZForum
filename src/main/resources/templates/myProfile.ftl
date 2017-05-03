
<!DOCTYPE html>
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


	<!-- 中间主体板块 -->
	<div class="main w clearfix">
		<div class="m-left">
			<#--//TODO: fix user.headUrl default value in database-->
			<div class="user-image"><img src="${user.headUrl}"></div>
			<div class="user-info">
				<div class="user-name">${user.username}</div>
				<div class="user-desc">${user.description}</div>
				<div class="user-position">坐标：${user.position}</div>
				<div class="user-school">学校：${user.school}</div>
				<div class="user-job">工作：${user.job}</div>
			</div>
			<div class="clearfix" style="border-bottom: 1px dashed #ddd;"></div>
			<div class="user-button">
                <a href="toEditProfile"" class="button-follow">编辑信息</a>
			</div>

			<div class="user-post">
				<div class="user-post-title"><span></span>&nbsp;发帖</div>
				<ul class="user-post-list">
					<#list postList as post>
					<#--<c:forEach items="${postList}" var="post">-->
                        <li>
                            <span class="glyphicon glyphicon-file"></span>&nbsp;
                            <a href="toPost"?pid=${post.pid}">${post.title}</a>
                            <span class="user-post-time">发布于 ${post.publishTime}</span>
                        </li>
                    <#--</c:forEach>-->
					</#list>
				</ul>
			</div>
		</div>

		<div class="m-right">
			<div class="user-follow">
				<div class="user-follow">关注了<span class="user-count">${user.followCount}</span>人</div>
				<div class="user-follower">关注者<span class="user-count">${user.followerCount}</span>人</div>
			</div>
			<div class="user-attr">
				<span class="user-like-count">获赞：${user.likeCount!'0'}</span>&nbsp;
				<span class="user-post-count">发帖：${user.postCount!'0'}</span>

			</div>
			<div class="user-scan-count">个人主页被浏览${user.scanCount!'0'}次</div>
		</div>

	</div><!-- 主体结束 -->

<#include "footer.ftl">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
</body>
</html>













