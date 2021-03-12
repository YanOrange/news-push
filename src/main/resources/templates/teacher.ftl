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
    <title>认证教师</title>
    <script>
        var deviceWidth = document.documentElement.clientWidth;
        if (deviceWidth > 640) deviceWidth = 640;
        document.documentElement.style.fontSize = deviceWidth / 7.5 + 'px';
    </script>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/address.css">
    <link rel="stylesheet" type="text/css" href="/js/LCalendar/css/LCalendar.css" />
    <style>
        .select-area{
            position: relative;
            overflow: hidden;
        }
        .select-area select{
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
        <div class="center-area">认证身份</div>
    </header>
    <!--表单-->
    <div class="form">
        <div class="input-group border-1px-bottom">
            <div class="tit">毕业院校</div>
            <input type="tel" placeholder="请输入毕业院校" value="" id="school">
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">学历</div>
            <input type="tel" placeholder="请输入学历" value="" id="education">
        </div>
        <div class="input-group border-1px-bottom">
            <div class="tit">学位证编号</div>
            <input type="tel" placeholder="请输入学位证编号" value="" id="eduNo">
        </div>
        <input id="idCard" value="#{idCard}" type="hidden">
    </div>
    <!--底部工具栏-->
    <div class="global-footer for-edit">
        <!-- <button class="btn btn-primary btn-full">保存并使用</button> -->
        <button class="btn btn-primary btn-full" id="submit" onclick="register();">开始认证</button>
    </div>
</div>
<script src="../js/lib/zepto.js"></script>
<script src="../js/jquery-2.1.1.min.js"></script>
<script src="../js/plugins/dialog.js"></script>
<script>
    function register() {
        var school = $('#school').val();
        var education = $('#education').val();
        var eduNo = $('#eduNo').val();
        var idCard = $('#idCard').val();
        if(!(school&&education&&eduNo)){
            Zepto.dialog({
                type:'tips',
                contentHtml:'参数不完整',
                autoClose:2000
            })
            return false;
        }
        $.ajax({
            url:'/user/doTeacher',
            data:{
                school:school,
                education:education,
                eduNo:eduNo,
                idCard:idCard
            },
            success:function (res) {
                if (res.success){
                    Zepto.dialog({
                        type:'tips',
                        contentHtml:'认证申请提交成功',
                        autoClose:2000,
                        onClosed:function () {
                            location.href='/page/person';
                        }
                    })
                }
            }
        })

    }
</script>
</body>

</html>