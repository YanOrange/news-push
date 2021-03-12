<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta id="viewport" name="viewport" content="width=device-width,height=device-height,initial-scale=1,user-scalable=no,viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="grey" />
    <meta name="format-detection" content="telephone=no,address=no,email=no" />
    <title>登录</title>
    <script>
        var deviceWidth = document.documentElement.clientWidth;
        if (deviceWidth > 640) deviceWidth = 640;
        document.documentElement.style.fontSize = deviceWidth / 7.5 + 'px';
    </script>
    <link rel="stylesheet" href="/css/common.css">
    <style>
        .bg{
            position: relative;
            width:100%;
            z-index: -1;
        }
        .input-div{
            position: relative;
            background: #fff;
            border-radius: 0.2rem;
            width: 90%;
            margin: 0 auto;
            padding: 0.5rem 0.15rem;
        }
        .inp-group{
            text-align: center;
            margin-top:0.34rem;
            position:relative;
        }

        .inp{
            width: 95%;
            height: 0.94rem;
            border-radius:47px;
            border:1px solid #FAFAFA;
            /* text-indent:20px; */
            padding-left:1rem;
            box-sizing:border-box;
            -webkit-box-sizing:border-box;
            -moz-box-sizing:border-box;
            font-size: 0.31rem;
        }
        input::placeholder{
            color:#999;
        }
        .icon-phone{
            background: url(/img/phone.png) no-repeat;
            height: 0.4rem;
            width: 0.4rem;
            background-size: contain;
            position: absolute;
            left: 0.55rem;
            top: 0.25rem;
        }
        .icon-vercode{
            background: url(/img/vercode.png) no-repeat;
            height: 0.4rem;
            width: 0.4rem;
            background-size: contain;
            position: absolute;
            left: 0.55rem;
            top: 0.25rem;
        }
        .vercode{
            font-size: 0.3rem;
            color:#fc8f80;
            position: absolute;
            right: 0.5rem;
            top: 0.32rem;
        }
        .receive{
            width: 95%;
            height: 0.94rem;
            background: -webkit-linear-gradient(left, #FF784F, #FF4740);
            background: -o-linear-gradient(left, #FF784F, #FF4740);
            background: linear-gradient(to right, #FF784F, #FF4740);
            border-radius: 0.3rem;
            color:#fff;
            font-size: 0.35rem;
        }
        .login-nav{
            margin-top: -1.7rem;
        }
        .login-font{
            color:#fff;
            font-size:0.5rem;
            padding: 0.25rem 0.5rem;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <img src="/img/index-bg.png" alt="" class="bg">
        <div class="login-nav">
            <div class="login-font">
                登录
            </div>
            <div class="input-div">
                <div class="inp-group">
                    <input id="phone" class="inp" placeholder="请输入用户名">
                    <i class="icon-phone"></i>
                </div>
                <div class="inp-group">
                    <input class="inp" placeholder="请输入密码" id="verCode" type="passWord">
                    <i class="icon-vercode" ></i>
                </div>
                <div class="" style="text-align: right;padding: 0 0.2rem;">
                    <a href="/page/register" style="color:#bbb;">立即注册</a>
                </div>
                <div class="inp-group" style="margin-top: 0.82rem;">
                    <input class="receive" type="button" value="立即登录">
                </div>

            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
    $('.receive').on('click',function(){
        var phone = $('#phone').val()
        var verCode = $('#verCode').val()
        $.ajax({
            url:'/user/login',
            data:{
                userName:phone,
                passWord:verCode
            },
            dataType:'json',
            success:function (res) {
                if(res.success){
                    location.href='/page/index';
                }else{
                    alert(res.msg);
                }
            }

        })
    })

</script>
</html>