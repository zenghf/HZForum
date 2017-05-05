<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/wangEditor.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/publish.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.6.0/katex.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.3.0/styles/monokai-sublime.min.css" />
    <link rel="stylesheet" href="css/quill.snow.css" />
    <style>
        body > #standalone-container {
            margin: 50px auto;
            width: 720px;
        }
        #editor-container {
            height: 350px;
        }
    </style>
</head>
<body>
<#include "header.ftl">


	<!-- 中间主体板块 -->
	<div class="main w clearfix">
		<form action="publishPost"" method="post" onsubmit="return validateForm(this)">
            <input type="hidden" name="topic.tid" value="1" id="tid">
            <input type="hidden" name="user.uid" value="${Session.uid}">

			<div class="pub-header"><span></span>New Post</div>
			<div class="pub-title">
				<input type="text" name="title" placeholder="Title">
			</div>
			<div class="pub-topic">
				<span>Tags：</span>
				<div class="topic-list">
                    <#list topicList as topic>
                        <a class="topics" href="#" title="${topic.tid}">${topic.name}</a>
                    </#list>
				</div>
			</div>

			<#--<div class="pub-textarea">-->
				<#--<div style="width: 920px;">-->
					<#--<textarea name="content" id="textarea" style="height: 300px;max-height: 1000px;"></textarea>-->
				<#--</div>-->
                <#--<button class="pub-button">发布</button>-->
			<#--</div>-->

            <div id="standalone-container" class="post-reply-textarea pub-textarea">
                <#include "tool.ftl">
                <div id="editor-container" name="content"></div>
                <button class="pub-button">Publish</button>
            </div>

		</form>

	</div><!-- 主体结束 -->

<#include "footer.ftl">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.6.0/katex.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.3.0/highlight.min.js"></script>
<script type="text/javascript" src="js/quill.min.js"></script>
<script type="text/javascript">

    var topics = $(".topics");
    var tid = $("#tid");
    topics.click(function(){
        for(var i=0;i<topics.length;i++){
            $(topics[i]).css("background-color","#fff");
        }
        $(this).css("background-color","#1abc9c");
        tid.val(this.title);
    });

    var quill = new Quill('#editor-container', {
        modules: {
            formula: true,
            syntax: true,
            toolbar: '#toolbar-container'
        },
        placeholder: 'Compose an epic...',
        theme: 'snow'
    });

    function validateForm(form) {
        var content = $("#editor-container .ql-editor").html();
        if (!content || 0 === content.length){
            alert("Reply can not be empty!")
            return false;
        }
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'content';
        input.value = content;
        form.appendChild(input);
    }

    
</script>
</body>
</html>













