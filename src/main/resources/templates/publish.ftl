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
    <title>发布</title>
    <script>
        var deviceWidth = document.documentElement.clientWidth;
        if (deviceWidth > 640) deviceWidth = 640;
        document.documentElement.style.fontSize = deviceWidth / 7.5 + 'px';
    </script>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/address.css">
    <link rel="stylesheet" type="text/css" href="/js/LCalendar/css/LCalendar.css"/>
    <style>
        .select-area {
            position: relative;
            overflow: hidden;
        }

        .select-area select {
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            width: 100%;
        }

        .gearDatetime {
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 10px;
            background-color: rgba(0, 0, 0, 0.2);
            display: block;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9900;
            overflow: hidden;
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
        }
    </style>
</head>

<body class="bg-white has-header has-footer">

<div class="wrap">
    <!--公共头部-->
    <header class="global-header border-1px-bottom">
        <div class="left-area" onclick="javascript:history.back(-1)"><i class="icon-arr-left"></i></div>
        <div class="center-area">发布</div>
    </header>
    <!--表单-->
    <div class="form">
        <div class="input-group border-1px-bottom">
            <div class="tit">标题</div>
            <input type="tel" placeholder="请输入标题" value="" id="title">
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">简介</div>
            <input type="passWord" placeholder="请输入简介" value="" id="description">
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">预期价格/小时</div>
            <input type="tel" placeholder="请输入价格" value="" id="price">
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">分类</div>
            <select id="type">
                <option>请选择分类</option>
                <option value="0">小学</option>
                <option value="1">中学</option>
                <option value="2">高中</option>
                <option value="3">中考</option>
                <option value="4">高考</option>
                <option value="5">小升初</option>
                <option value="6">篮球</option>
                <option value="7">钢琴</option>
                <option value="8">舞蹈</option>
            </select>
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">课程</div>
            <input type="tel" placeholder="请输入课程" value="" id="lesson">
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">适合人群</div>
            <input type="tel" placeholder="请输入适合人群" value="" id="fit">
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">内容</div>
            <textarea placeholder="请输入内容" id="content"></textarea>
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">联系方式</div>
            <input type="tel" placeholder="请输入手机号码" value="" id="phone">
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">授课地址</div>
            <input type="tel" placeholder="请输入授课地址" value="" id="address">
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">文章类型</div>
            <select id="status">
                <option>请选择类型</option>
                <option value="0">家教帖</option>
                <option value="1">求助帖</option>
            </select>
        </div>
    </div>
    <!--底部工具栏-->
    <div class="global-footer for-edit">
        <!-- <button class="btn btn-primary btn-full">保存并使用</button> -->
        <button class="btn btn-primary btn-full" id="submit" onclick="register();">一键发布</button>
    </div>
</div>
<script src="../js/lib/zepto.js"></script>
<script src="../js/jquery-2.1.1.min.js"></script>
<script src="../js/plugins/dialog.js"></script>
<script>
    function register() {
        var title = $('#title').val();
        var address = $('#address').val();
        var content = $('#content').val();
        var description = $('#description').val();
        var price = $('#price').val();
        var lesson = $('#lesson').val();
        var fit = $('#fit').val();
        var phone = $('#phone').val();
        var status = $('#status').val();
        var type = $('#type').val();
        if (!(title && address && content && phone && description && price && lesson && fit && status && type)) {
            Zepto.dialog({
                type: 'tips',
                contentHtml: '参数不完整',
                autoClose: 2000
            })
            return false;
        }
        $.ajax({
            url: '/content/publish',
            data: {
                title: title,
                address: address,
                content: content,
                phone: phone,
                description: description,
                price: price,
                lesson: lesson,
                type: type,
                fit: fit,
                status: status
            },
            success: function (res) {
                if (res.success) {
                    Zepto.dialog({
                        type: 'tips',
                        contentHtml: '发布成功',
                        autoClose: 2000,
                        onClosed: function () {
                            history.back(-1)
                        }
                    })
                }else{
                    Zepto.dialog({
                        type: 'tips',
                        contentHtml: res.msg,
                        autoClose: 2000
                    })
                }
            }
        })

    }
</script>
</body>

</html>