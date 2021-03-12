<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta id="viewport" name="viewport" content="width=device-width,height=device-height,initial-scale=1,user-scalable=no,viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="grey" />
    <meta name="format-detection" content="telephone=no,address=no,email=no" />
    <title>个人中心</title>
    <script>
        var deviceWidth = document.documentElement.clientWidth;
        if (deviceWidth > 640) deviceWidth = 640;
        document.documentElement.style.fontSize = deviceWidth / 7.5 + 'px';
    </script>
    <link rel="stylesheet" href="/css/common.css">
    <style>
        .top-img{
            padding:0.3rem 0.2rem;
            position: relative;
        }
        .top-img .point{
            position: absolute;
            top: 0.9rem;
            left: 0.5rem;
            font-weight: bolder;
            font-size: 0.9rem;
            font-family: "DINCondensedBold";
        }
        .top-img .font{
            position:absolute;
            top: 2rem;
            left: 0.5rem;
        }
        .top-img .record{
            position:absolute;
            bottom: 0.5rem;
            right: 0.54rem;
            font-size: 0.2rem;
        }
        .bottom-func{
            padding: 0.3rem 0.6rem;
            /*display: flex;*/
            /*justify-content: space-between;*/
            /*text-align:center;*/
        }
        .func img{
            width: 65%;
            margin: 0 auto;
        }
        .func span{
            margin-top: 0.15rem;
            display: block;
        }
        .icons-right{
            background: url(/img/right.png) no-repeat;
            height: 0.18rem;
            width: 0.18rem;
            bottom: 0.05rem;
            right: -0.3rem;
            background-size: contain;
            position: absolute;
        }
        .func{
            display: inline-block;
            text-align: center;
            padding: 0.35rem 0.15rem;
        }
    </style>
</head>
<body>
<div class="wrap">
    <!--公共头部-->
    <header class="global-header search-header border-1px-bottom">
        <div class="left-area" onclick="javascript:history.back(-1)"><i class="icon-arr-left"></i></div>
        <div class="center-area">个人中心</div>
    </header>
    <div class="top-img" style="margin-top: 0.88rem;">
        <div class="point">
        ${user.name!'匿名'}
        </div>
        <div class="font">
        ${user.phone!'xxx'}
    </div>
        <div class="record" style="bottom: 1rem;">
            <#if user.isTeacher==1>
                教师
            <#else>
                普通用户
            </#if><i class="icons-right"></i>
        </div>
        <div class="record">
            <a href="javascript:;" onclick="exit();">退出登录</a>
        </div>
        <img src="/img/person-bg.png" alt="" class="bg">
    </div>
    <div class="bottom-func">
        <div class="func" id="done">
            <img src="/img/done.png" alt="">
            <span>我的发布</span>
        </div>
        <div class="func" id="edit">
            <img src="/img/edit.png" alt="">
            <span>修改信息</span>
        </div>
        <div class="func" id="auth">
            <img src="/img/admin.png" alt="">
            <span>认证身份</span>
        </div>


    </div>

    <!--底部工具栏-->
    <div class="global-footer">
        <a href="/page/index" class="home">
            <div class="img"><img src="../img/icons/home.png"></div>
            <div class="text">首页</div>
        </a>
        <a href="/page/type" class="home">
            <div class="img"><img src="../img/icons/type.png"></div>
            <div class="text">分类</div>
        </a>
        <a href="/page/person" class="home active">
            <div class="img"><img src="../img/icons/my-active.png"></div>
            <div class="text">个人中心</div>
        </a>
    </div>
</div>
</body>
<script type="text/javascript" src="/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">

    //查看发布信息
    $('#done').on('click',function () {
        location.href="/page/contentList";
    });

    //修改个人信息
    $('#edit').on('click',function () {
        location.href="/user/editInfo";
    });


    //认证身份
    $('#auth').on('click',function () {
        $.ajax({
            url:'/user/ident',
            dataType:'json',
            success:function(res){
                if(res.success){
                    location.href='/page/ident';
                }else{
                    alert(res.msg)
                }
            }
        })
    });

    function exit() {
        $.ajax({
            url:'/page/exit',
            success:function () {
                location.reload();
            }
        })
    }
</script>

</html>