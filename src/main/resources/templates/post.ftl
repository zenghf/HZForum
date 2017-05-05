<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/wangEditor.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/post.css">
</head>
<body>

<#include "header.ftl">


	<!-- 中间主体板块 -->
	<div class="main w clearfix">

		<!-- 主体左部分 -->
		<div class="main-left">
			
			<!-- 帖子内容板块 -->
			<div class="post-content">
				<div class="post-title">
					<span class="glyphicon glyphicon-th"></span>&nbsp;${post.title}
				</div>
				<div class="post-user clearfix">
					<div class="user-image"><a href="toProfile?uid=${post.user.uid}"><img src="${post.user.headUrl}"></a></div>
					<div class="user-info">
						<div class="user-name">${post.user.username}</div>
						<div class="post-time">Published ${post.publishTime}</div>
					</div>
					<div class="other-count">
						<span class="reply-count"><a href="javascript:void(0);">Reply ${post.replyCount}</a></span>&nbsp;

                        <#if liked>
                            <span class="up-count"><a href="javascript:void(0);" style="color:#2e6da4;">Like ${post.likeCount}</a></span>&nbsp;
                        <#else>
                            <#if Session.uid?exists>
                                <span class="up-count"><a href="javascript:void(0);" id="like-button" style="color:#2eb944;">Like ${post.likeCount}</a></span>&nbsp;
                            <#else>
                                <span class="up-count"><a href="javascript:void(0);">Like ${post.likeCount}</a></span>&nbsp;
                            </#if>
                        </#if>

						<span class="scan-count"><a href="#">View ${post.scanCount}</a></span>
					</div>
				</div>
				<div class="post-desc">
					${post.content}
				</div>
			</div>



			<!-- 帖子回复内容板块 -->
			<div class="post-reply">
				<!-- 回复区标题 -->
				<div class="post-reply-title">
					<h2 class="reply-count"><span class="glyphicon glyphicon-th"></span>&nbsp;${post.replyCount} Replies</h2>
					<a href="#reply-area">Reply</a>
				</div>
				<!-- 回复区内容 -->
				<div class="post-reply-content">
					<!-- 回复条目 -->
                    <#list replyList as reply>
                    <#--<c:forEach items="${replyList}" var="reply" varStatus="status">-->
                        <div class="post-reply-item clearfix">
                            <div class="item-image"><a href="toProfile?uid=${reply.user.uid}"><img src="${reply.user.headUrl}"></a></div>
                            <div class="item-info">
                                <div class="item-user-name"><a href="#">${reply.user.username}</a></div>
                                <div class="item-content">${reply.content}</div>
                                <div class="item-date">published ${reply.replyTime!''}</div>

                                <!-- 楼中楼，即嵌套的回复内容 -->
                                <div class="item-more">
                                    <#list reply.commentList as comment>
                                    <#--<c:forEach items="${reply.commentList}" var="comment">-->
                                        <#--<%--一个wrap开始--%>-->
                                        <div class="item-wrap">
                                            <div class="item-more-1">
                                                <a href="toProfile?uid=${comment.user.uid}" class="item-more-user">${comment.user.username}</a>
                                                <span>：</span>
                                                <span class="item-more-content">${comment.content}</span>
                                            </div>

                                            <div class="item-more-date">${comment.commentTime!''}</div>
                                            <div class="item-more-other">
                                                <a href="#s${reply?counter}" class="item-more-reply">Comment</a>&nbsp;
                                            </div>
                                        </div><!-- 一个wrap结束-->
                                    <#--</c:forEach>-->
                                    </#list>

                                    <!-- 楼中楼的回复框 -->
                                    <div class="reply-input">
                                        <form action="comment"" method="post">
                                            <input type="hidden" name="pid" value="${post.pid}"/>
                                            <input type="hidden" name="rid" value="${reply.rid}"/>
                                            <textarea id="s${reply?counter}" name="content"></textarea>
                                            <button type="submit">Comment</button>
                                        </form>
                                    </div>
                                </div><!-- 楼中楼结束 -->

                            </div>
                            <div class="item-other">
                                <a href="#s${reply?counter}" class="item-reply">Comment</a>&nbsp;
                            </div>

                        </div>
                    <#--</c:forEach><!-- 回复条目结束 &ndash;&gt;-->
                    </#list>
				</div>
			</div>



			<!-- 回复区，付文本编辑器板块 -->
			<div id="reply-area" class="post-reply-textarea">
				<div style="width: 650px;margin: 10px 20px">
					<form action="reply"" method="post" enctype="multipart/form-data">
						<input type="hidden" name="pid" value="${post.pid}" />
						<textarea name="content" id="textarea" style="height: 200px;max-height: 1000px;"></textarea>
						<button class="reply-button">Reply</button>
					</form>
				</div>
			</div>

		</div>
        TESTTEST
        ${Session.uid!'uid not exist'}

		<#include "right_side.ftl">




<#--<%@ include file="footer.jsp" %>-->
<#include "footer.ftl">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript">
    var editor = new wangEditor('textarea');

    editor.config.menus = [
        'source',
        '|',
        'bold',
        'underline',
        'italic',
        'strikethrough',
        'eraser',
        'fontsize',
        '|',
        'link',
        'table',
        'emotion',
        '|',
        'img',
        'insertcode',
        '|',
        'undo',
     ];
     
     //配置处理图片上传的路径，最好用相对路径
     editor.config.uploadImgUrl = 'upload"';
     //配置图片上传到后台的参数名称
     editor.config.uploadImgFileName = 'myFileName';

		
    editor.create();

    //点赞按钮处理
    var likeButton = $("#like-button");
    likeButton.click(function(){
        $.ajax({
            type:"GET",
            url:"ajaxClickLike",
            data:{pid:${post.pid}},
            success:function(response,status,xhr){
                likeButton.text("赞 "+response);
                likeButton.removeAttr("href");
            }
        });
    });
    
</script>
</body>
</html>
