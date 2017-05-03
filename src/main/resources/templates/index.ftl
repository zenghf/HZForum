<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
</head>
<body>

<#include "header.ftl">

	<div class="main w clearfix">
		<div class="main-left">
			<div class="share">
				<div class="share-left"><span></span>&nbsp;分享与提问</div>
				<div class="share-right">
					<a href="toPublish""><span class="glyphicon glyphicon-pencil"></span>&nbsp;我要发布</a>
				</div>
			</div>
			<div class="post">
				<div class="post-wrap">
					<div class="post-choice">
						<a href="#" class="post-choice-current">最近</a>
						<a href="#">最热</a>
						<a href="#" class="post-choice-last">精华</a>
					</div>

					<ul class="post-list">
                        <#list pageBean.list as post>
                            <li class="clearfix">
                                <div class="post-image">
                                    <a href="toProfile"?uid=${post.user.uid}"><img src="${post.user.headUrl}"></a>
                                </div>
                                <div class="post-content">
                                    <div class="post-title"><a href="toPost"?pid=${post.pid}">${post.title}</a></div>
                                    <div class="post-other">
                                        <div class="post-other-left">
                                            <span class="post-username"><a href="toProfile"?uid=${post.user.uid}">${post.user.username}</a></span>
                                            <span>&nbsp;发表</span>
                                            <span class="post-time">&nbsp;${post.publishTime}</span>
                                            <span>&nbsp;最后回复&nbsp;</span>
                                            <span class="post-reply-time">${post.replyTime}</span>
                                        </div>
                                        <div class="post-other-right">
                                            <span class="post-reply-count">回复 ${post.replyCount}</span>&nbsp;
                                            <span class="post-like-count">赞 ${post.likeCount}</span>&nbsp;
                                            <span class="post-scan-count">浏览 ${post.scanCount}</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </#list>

					</ul>

                    <#--Page Navigation-->
                    <nav class="col-md-10 col-md-offset-2">
                        <ul class="pagination pagination-sm">
                            <#--First Page-->
                            <li><a href="listPostByTime"?curPage=1">首页</a></li>
                            <#--Previous Page-->
                            <#if pageBean.curPage!=1>
                                <li><a href="listPostByTime"?curPage=${pageBean.curPage-1 }"><span>&laquo;</span></a></li>
                            <#else>
                                <li><span>&laquo;</span></li>
                            </#if>

                            <#--Center-->
                            <#if pageBean.allPage lte 10>
                                <#list 1..pageBean.allPage as i>
                                    <li class="pageNum"><a href="listPostByTime"?curPage=${i }">${i }</a></li>
                                </#list>
                            <#elseif pageBean.curPage lte 5>
                                <#list 1..10 as i>
                                    <li class="pageNum"><a href="listPostByTime"?curPage=${i }">${i }</a></li>
                                </#list>
                            <#elseif pageBean.allPage - pageBean.curPage lte 5>
                                <#list (pageBean.allPage-9)..pageBean.allPage as i>
                                    <li class="pageNum"><a href="listPostByTime"?curPage=${i }">${i }</a></li>
                                </#list>
                            <#else>
                                <#list (pageBean.curPage-4)..(pageBean.curPage+5) as i>
                                    <li class="pageNum"><a href="listPostByTime"?curPage=${i }">${i }</a></li>
                                </#list>
                            </#if>

                            <#--Next Page-->
                            <#if pageBean.curPage != pageBean.allPage>
                                <li><a href="listPostByTime"?curPage=${pageBean.curPage+1 }"><span>&raquo;</span></a></li>
                            <#else>
                                <li><span>&raquo;</span></li>
                            </#if>

                            <#--Last Page    -->
                            <li><a href="listPostByTime"?curPage=${pageBean.allPage}">尾页</a></li>
                        </ul>
                    </nav>

				</div>
			</div>
		</div>
		<div class="main-right">


        <div class="hot-user">
            <div class="clearfix"><div class="hot-user-title"><span></span>&nbsp;近期活跃用户</div></div>
            <ul class="hot-user-list">
                <#list hotUserList as user>
                    <li class="clearfix">
                        <a href="toProfile"?uid=${user.uid}" class="hot-user-image"><img src="${user.headUrl!''}"></a>
                        <a href="toProfile"?uid=${user.uid}" class="hot-user-name">${user.username}</a>
                    </li>
                </#list>
            </ul>
        </div>

        <div class="hot-user">
            <div class="clearfix"><div class="hot-user-title"><span></span>&nbsp;近期加入用户</div></div>
            <ul class="hot-user-list">
                <#list userList as user>
                    <li class="clearfix">
                        <a href="toProfile"?uid=${user.uid}" class="hot-user-image"><img src="${user.headUrl!''}"></a>
                        <a href="toProfile"?uid=${user.uid}" class="hot-user-name">${user.username}</a>
                    </li>
                </#list>
            </ul>
        </div>

		</div>
	</div>


<#include "footer.ftl">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript">
    $(function(){
        var curPage = ${pageBean.curPage};
        $(".pageNum").each(function(){
            if($(this).text()==curPage){
                $(this).addClass("active");
            }
        });
    });

</script>
</body>
</html>
