
<div class="header clearfix">
    <div class="w">
        <h1 class="logo"><a href="toIndex"">DF</a></h1>
        <ul class="left-nav">
            <li class="current-nav"><a href="toIndex"">首页</a></li>
            <li><a href="listTopic"">话题</a></li>
            <li><a href="listImage"">文章</a></li>
            <li><a href="toMessage"">消息</a></li>
        </ul>

        <ul class="right-nav">
            <#if Session.uid?exists>
                <li class="login2 relative">
                    <a href="toMyProfile"" id="profile"><img src="${Session.headUrl!''}"></a>
                    <ul id="down-menu">
                        <li><a href="profile">个人主页</a></li>
                        <li><a href="logout"">退出登录</a></li>
                    </ul>
                </li>
            <#else>
                <li class="login">
                    <a href="toLogin"">登录</a>
                    <a href="toLogin"">/</a>
                    <a href="toLogin"#register">注册</a>
                </li>
            </#if>

            <li>
                <a href="#"><span class="glyphicon glyphicon-search"></span></a>
            </li>
            <li><input type="text"></li>
        </ul>
    </div>
</div>
