
<div class="header clearfix">
    <div class="w">
        <h1 class="logo"><a href="toIndex"">DF</a></h1>
        <ul class="left-nav">
            <li class="current-nav"><a href="toIndex"">Home</a></li>
            <li><a href="listTopic"">Topics</a></li>
            <li><a href="listImage"">Articles</a></li>
            <li><a href="toMessage"">Messages</a></li>
        </ul>

        <ul class="right-nav">
            <#if Session.uid?exists>
                <li class="login2 relative">
                    <a href="toMyProfile"" id="profile"><img src="${Session.headUrl!''}"></a>
                    <ul id="down-menu">
                        <li><a href="toMyProfile">Profile</a></li>
                        <li><a href="logout"">Logout</a></li>
                    </ul>
                </li>
            <#else>
                <li class="login">
                    <a href="toLogin"">Login</a>
                    <a href="toLogin"">/</a>
                    <a href="toLogin"#register">Register</a>
                </li>
            </#if>

            <li>
                <a href="#"><span class="glyphicon glyphicon-search"></span></a>
            </li>
            <li><input type="text"></li>
        </ul>
    </div>
</div>
