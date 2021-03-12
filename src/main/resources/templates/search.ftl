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
            background: #F2F2F2;
        }

        .bg-red {
            background: #ff5400;
            color: #fff;
        }

        .type-list {
            width: 100%;
            height: 0.7rem;
            background: #ff9b6b;
        }

        .type-list ul {
            height: 0.7rem;
            display: flex;
            justify-content: space-around;
            justify-items: center;
            line-height: 0.7rem;
        }

        .type-list ul li {
            color: #fff;
        }

        .type-list ul li.active {
            color: #ff0000;
        }

        .content-list {

        }

        .content-list .item, .cinema-list-search .item {
            width: 100%;
            background: rgba(255, 255, 255, 1);
            border-radius: 0.12rem;
            padding: 0.3rem 0.2rem;
            box-sizing: border-box;
            margin-top: 0.2rem;
            cursor: pointer;
            position: relative;
        }

        .title-warper {
            display: flex;
            /* justify-content: space-between; */
            font-size: 0.3rem;
            font-weight: bolder;
            padding: 0.1rem 0;
        }

        .title-warper .title-left {
            flex: 1;
        }

        .title-warper .del {
            color: #999;
            font-size: 0.22rem;
            font-weight: 400;
        }

        .title-warper .del span {
            text-decoration: line-through;
        }

        .title-warper .price {
            color: #FD4B57;
            font-size: 0.24rem;
            font-weight: 400;
        }

        .title-warper .price .font {
            font-size: 0.22rem;
        }

        .address {
            display: flex;
            justify-content: space-between;
            font-size: 0.24rem;
            color: rgba(102, 102, 102, 1);
            padding: 0.1rem 0;
        }

        .address .address-left {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            width: 55vw;
        }

        .distance {
            width: 20vw;
            text-align: right;
        }

        .support-tags {
            padding: 0.1rem 0;
        }

        .support-tags span {
            padding: 0 0.05rem;
            font-size: 0.2rem;
        }

        .tag-orange {
            color: #F99402;
            border-radius: 0.03rem;
            border: 0.01rem solid rgba(249, 148, 2, 0.4);
        }

        .tag-gray {
            color: #626262;
            border-radius: 0.03rem;
            border: 0.01rem solid #C8C8C8;
        }

        .cinema-list .item:after, .cinema-list-search .item:after {
            border-bottom: 1px solid #DDE7E9;
            content: '';
            position: absolute;
            width: 95%;
            bottom: 0;
            margin: 0 auto;
            left: 0;
            right: 0;
        }
        .search-nav{
            text-align: center;
        }
        .search-nav input[type="button"]{
            background: #ff5400;
            color: #fff;
            border-radius: 0.2rem;
            height: 0.5rem;
            width: 1rem;
        }
        .search-nav input[type="text"]{
            height: 0.5rem;
            border-radius: 0.1rem;
        }



    </style>
</head>

<body class="has-footer" style="padding-top:0.88rem;">
<div class="wrap">
    <!--公共头部-->
    <header class="global-header search-header border-1px-bottom bg-red">
        <div class="center-area">搜索</div>
    </header>
    <div class="search-nav">
        <input type="text" placeholder="请输入搜索条件" id="key">
        <input type="button" value="搜索" onclick="search();">
    </div>


    <div class="content-list">

    </div>


</div>
<script src="../js/lib/zepto.js"></script>
<script src="../js/lib/jquery-2.1.1.min.js"></script>
<script src="../js/lib/fastclick.js"></script>
<script src="../js/plugins/lazyload.js"></script>
<script src="../js/plugins/swiper.min.js"></script>
<script src="../js/plugins/dialog.js"></script>
<script src="../js/common.js"></script>
<script src="../js/lib/jquery.fly.min.js"></script>
<script>

    function search(){
        var key = $('#key').val();
        getContent(key);
    }

    function getContent(key) {
        $.ajax({
            url: '/content/search',
            data: {
                key: key
            },
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    var data = res.data;
                    var html = '';
                    $.each(data, function (i, r) {
                        html += '<a href="/page/content?contentId='+r.id+'"><div class="item">\n' +
                            '            <div class="title-warper">\n' +
                            '                <div class="title-left">\n' +
                            '                    <span>' + r.title + '</span>\n' +
                            '                </div>\n' +
                            '                <div class="del">\n' +
                            '                    <span>￥' + r.price + '</span>\n' +
                            '                </div>\n' +
                            '                <div class="price">\n' +
                            '                    <span>￥' + r.price + '</span>\n' +
                            '                    <span class="font">起</span>\n' +
                            '                </div>\n' +
                            '            </div>\n' +
                            '            <div class="address">\n' +
                            '                <div class="address-left">\n' +
                            '                    <span>' + r.description + '</span>\n' +
                            '                </div>\n' +
                            '                <div class="distance">\n' +
                            '                    <span>' + r.user.education + '</span>\n';
                        if (r.status == 0) {
                            html += '                    <span>家教帖</span>\n';
                        } else {
                            html += '                    <span>求助帖</span>\n';
                        }
                        html += '                </div>\n' +
                            '            </div>\n' +
                            '            <div class="support-tags">\n' +
                            '                <span class="tag-orange">优质教师</span>\n' +
                            '                <span class="tag-gray">耐心</span>\n' +
                            '            </div>\n' +
                            '        </div></a>';
                    })
                    $('.content-list').html(html);
                } else {
                    alert(res.msg);
                }
            }
        })
    }


</script>
</body>

</html>