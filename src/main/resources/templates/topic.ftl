<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/topic.css">
</head>
<body>
<#include "header.ftl">


	<div class="main w clearfix">
		<div class="main-left">
			<div class="share">
				<div class="share-left"><span class="glyphicon glyphicon-th-large"></span>&nbsp;Topic Plaza</div>
				<#if Session.uid?exists>
				<div class="share-right">
					<a href="#" id="open-mask"><span class="glyphicon glyphicon-pencil"></span>&nbsp;New Topic</a>
				</div>
				</#if>
			</div>
			<div class="topic-root">
				<div class="topic-root-wrap">
					<#list topicList as topic>
                        <a href="#">${topic.name}</a>
					</#list>

				</div>
			</div>
			<#--List of Topic-->
			<div class="topic-list">
				<div class="topic-list-wrap clearfix">
					<#list topicList as topic>
						<#if topic?counter % 2 != 0>
							<div class="topic-odd relative">
								<a href="#" class="topic-image"><img src="${topic.image}"></a>
								<div class="topic-content">
									<a href="#" class="topic-name">${topic.name}</a>
									<a href="#" class="topic-desc">${topic.content}</a>
								</div>
							</div>
						<#else>
							<div class="topic-even relative">
								<a href="#" class="topic-image"><img src="${topic.image}"></a>
								<div class="topic-content">
									<a href="#" class="topic-name">${topic.name}</a>
									<a href="#" class="topic-desc">${topic.content}</a>
								</div>
							</div>
						</#if>
					</#list>
				</div>
			</div>
			<div class="topic-more">
				<a href="#">More</a>
			</div>
		</div>
		<#include "right_side.ftl">
	</div>

	<#--TODO:// add ajax response to add topic-->
	<div class="mask"></div>
	<div class="upon-mask">
		<form>
			<input type="text" name="" id="new-topic" placeholder="Please input a topic">
			<button id="new-topic-submit">Submit</button>
		</form>
		<span id="close-mask">×</span>
	</div>
<#include "footer.ftl">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript">
	$(function(){

		var openMask = $("#open-mask");
		var closeMask = $("#close-mask");
		var mask = $(".mask");
		var uponMask = $(".upon-mask");

		openMask.click(function(){
			mask.show();
			uponMask.show();
		});

		closeMask.click(function(){
			mask.hide();
			uponMask.hide();
		});
	});

    // New Topic
    var newTopic = $("#new-topic");
    var newTopicButton = $("#new-topic-submit");
    newTopicButton.click(function(){
        var topic = newTopic.val();
        if (topic){
            topic = topic.trim();
		}
		console.log("before topic");
		console.log(topic);
        if (topic){
			$.post("newTopic123", {"topic":topic},
				function(response,status,xhr){
			    	console.log("response: " + response + "; status: " + status);
                    location.reload();
				}
			);
        }
    });
</script>
</body>
</html>













