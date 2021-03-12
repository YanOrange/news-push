<!DOCTYPE HTML>
<html lang="zh-CN">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta id="viewport" name="viewport"
          content="width=device-width,height=device-height,initial-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="grey"/>
    <meta name="format-detection" content="telephone=no,address=no,email=no"/>
    <title>家教预约平台</title>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/swiper.min.css">
    <script>
        var deviceWidth = document.documentElement.clientWidth;
        if (deviceWidth > 640) deviceWidth = 640;
        document.documentElement.style.fontSize = deviceWidth / 7.5 + 'px';
    </script>
    <style>
        body {
            -webkit-overflow-scrolling: touch;
        }

        html {
            background: #fff;
        }

        .bg-red {
            background: #ff5400;
            color: #fff;
        }
        .title{
            font-size: 0.4rem;
            padding: 0.3rem 0 0 0.3rem;
            color:#333;
        }
        .teacher-name{
            color: #8a8a8a;
            font-size: 0.2rem;
            display: flex;
            margin-left: 0.3rem;
            margin-top: 0.2rem;
        }
        .description{
            font-size: 0.3rem;
            padding: 0 0.3rem;
            margin-top:0.5rem;
            line-height: initial;
        }
        .bottom-btn{
            position: fixed;
            bottom: 0;
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        .bottom-btn a{
            height:1rem;
            display: block;
            width:50%;
            text-align: center;
            line-height: 1rem;
            color:#fff;
        }
        .bottom-btn a:active{
            opacity: 0.7 !important;
        }
        .comment{
            background: #ff5400;
        }
        .appointment{
            background: #00ad25;
        }
        .comment-content{
            padding: 0.3rem 0 0 0.3rem;
        }
        .write-comment{
            width:100%;
            height:3rem;
            background: #fff;
            border-radius: 0.4rem 0.4rem 0 0;
            position: fixed;
            bottom:0;
            box-shadow: 0 -1px 9px 0px rgb(0 0 0 / 18%);
            z-index: 2;
        }
        .write-comment textarea{
            border:1px solid #ccc;
            width:100%;

        }
        .write-comment button{
            position: absolute;
            margin: 0 auto;
            left: 0;
            right: 0;
            width: 2rem;
            height: 0.6rem;
            color: #fff;
            background: #ff5400;
            margin-top: 0.1rem;
        }
        .area{
            margin-top: 0.2rem;
            padding:0 0.3rem;
        }
        .write-comment-nav{
            background: rgba(0,0,0,.3);
            width:100%;
            height:100%;
            position: fixed;
            top: 0;
            z-index: 1;
            display: none;
        }
        .warn{
            border-radius: 50rem;
            width:1rem;
            height:1rem;
            background: #ff5400;
            opacity: 0.7;
            color:#fff;
            font-size: 0.25rem;
            position: fixed;
            bottom:2rem;
            right:0.2rem;
            text-align: center;
            line-height:1rem;
        }
        .warn-content{
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            width: 5rem;
            height: 1.5rem;
            background: #fff;
            border: 1px solid #e0e0e0;
            padding: 1rem;
            border-radius: 0.3rem;
            box-shadow: 0 0 20px rgb(66 66 66 / 25%);
            display: none;
        }
        .warn-content button{
            height: 0.6rem;
            width: 45%;
            text-align: center;
            line-height: 0.6rem;
            color: #fff;
            margin-top: 0.3rem;
        }



    </style>
</head>

<body class="has-footer" style="padding-top:0.88rem;">
<div class="wrap">
    <!--公共头部-->
    <header class="global-header search-header border-1px-bottom bg-red">
        <div class="center-area">课程详情</div>
    </header>
    <div class="title">
        ${content.title!''}
    </div>
    <div class="teacher-name">
        <span>${user.name!''}</span>
        <span style="margin-left:0.2rem;">${user.education!''}</span>
        <span style="margin-left:0.2rem;">适合${content.fit!''}</span>
        <span style="margin-left:0.2rem;">${content.createTime!''}</span>
    </div>
    <div class="description">
        简介：<span>${content.description!''}</span>
    </div>

    <div class="description">
        费用：<span>${content.price!''}</span>元/小时
    </div>

    <div class="description">
        联系方式：<span>${content.phone!''}</span>
    </div>

    <div class="description">
        家庭住址：<span>${content.address!''}</span>
    </div>

    <div class="description">
        教学详情：<span>${content.content!''}</span>
    </div>

    <div class="comment-nav">
        <div class="title">留言</div>
        <div class="comment-list">
            <div class="comment-content">
                <span>留言用户</span>:<span>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</span>
            </div>
            <div class="comment-content">
                <span>留言用户</span>:<span>内容内容内容内容内容内容内容内容</span>
            </div>
            <div class="comment-content">
                <span>留言用户</span>:<span>内容内容内容内容内容内容内容内容</span>
            </div>
        </div>
    </div>
    <div class="warn">
        举报
    </div>
    <div class="warn-content">
        举报内容
        <input type="text" id="warn-content" placeholder="请输入举报内容" style="border: 1px solid #cecece;">
        <button onclick="warnCommit();" style="background: #ff5400;">提交</button>
        <button onclick="cancelCommit();" style="background: #00ad25;">取消</button>
    </div>

</div>
<div class="bottom-btn">
    <a class="comment">留言</a>
    <a class="appointment" href="tel:${content.phone!''}">电话预约</a>
</div>
<div class="write-comment-nav">
    <dvi class="write-comment">
        <div class="title">
            评论
        </div>
        <div class="area">
            <textarea rows="3" cols="20" placeholder="请输入内容..." id="comment"></textarea>
        </div>
        <button onclick="comment();">提交</button>
    </dvi>
</div>
<input type="hidden" value="${content.id!''}" id="contentId">
<script src="../js/lib/zepto.js"></script>
<script src="../js/lib/jquery-2.1.1.min.js"></script>
<script src="../js/plugins/dialog.js"></script>
<script src="../js/common.js"></script>
<script>
    $(function () {

        findAllComment();
    })

    function findAllComment(){
        var contentId = $('#contentId').val();
        $.ajax({
            url:'/comment/findAll',
            data:{
                contentId:contentId
            },
            success:function (res) {
                if (res.success){
                    var html='';
                    $.each(res.data,function (i, r) {
                        html +='<div class="comment-content">\n' +
                                '                <span>'+r.user.name+'</span>:<span>'+r.comment+'</span>\n' +
                                '            </div>';
                    })
                    $('.comment-list').html(html);
                }
            }
        })

    }

    $('.write-comment-nav').on('click',function(){
        if(event.target!=this) return;
        $('.write-comment-nav').hide();
        $('#comment').val("")
    })
    $('.comment').on('click',function(){
        $('.write-comment-nav').show();
    })
    $('.warn').on('click',function(){
        $('.warn-content').show();
    })
    
    function cancelCommit() {
        $('.warn-content').hide();
    }

    /**
     * 提交举报
     * */
    function warnCommit(){
        var contentId = $('#contentId').val();
        var content = $('#warn-content').val();
        if(!content){
            alert("举报内容不能为空");
            return;
        }
        $.ajax({
            url:'/warn/warnCommit',
            data:{
                content:content,
                contentId:contentId
            },
            success:function (res){
                if (res.success){
                    alert("提交成功")
                    $('.warn-content').hide();
                } else{
                    alert(res.msg)
                }
            }
        })
    }

    /**
     * 发表评论
     */
    function comment(){
        var contentId = $('#contentId').val();
        var comment = $('#comment').val();
        $.ajax({
            url:'/comment/commit',
            data:{
                comment:comment,
                contentId:contentId
            },
            success:function(res){
                if(res.success){
                    $('.write-comment-nav').hide();
                    $('#comment').val("")
                }else{
                    alert(res.msg)
                }
            }
        })
    }



</script>
</body>

</html>