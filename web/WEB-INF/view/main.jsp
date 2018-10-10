<%--
    主页
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<html>
<head>
    <title>五邑大学在线考试系统</title>
    <%-- 引入 bootstrap --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>

    <style>
        .header {
            height: 75px;
            background-color: #293448;
        }

        .header-wyuIcon {
            display: inline-block;
            margin-left: 20%;
        }

        .header-links {
            display: inline-block;
            margin-left: 50px;
        }

        .header-links a {
            margin-top: 8px;
            margin-left: 30px;
            padding-bottom: 0;
            font-size: 1.2rem;
            color: #ffffff;
        }

        .footer {
            margin-top: 0;
            height: 80px;
            width: 100%;
            background-color: #293448;
        }

        .footer-content {
            margin-left: 30%;
            padding-top: 15px;
            color: #ffffff;
        }

        .content {
            position: relative;
        }

        .content img {
            display: block;
            width: fit-content;
            margin: 30px auto;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="header-wyuIcon">
        <img src="images/wyu-logo.png">
    </div>
    <div class="header-links">
        <nav class="nav">
            <a class="nav-link active" href="<%=basePath%>/main" style="color: green;border-bottom: 3px solid green">首页</a>
            <a class="nav-link" href="<%=basePath%>/kskm">在线考试</a>
            <a class="nav-link" href="<%=basePath%>/grade">成绩查询</a>
            <a class="nav-link disabled" href="#">你好，尊敬的会员：${username}</a>
            <a class="nav-link" href="<%=basePath%>/logout" onclick="logout()">登出</a>
        </nav>
    </div>
</div>
<div class="content">
    <img src="images/index02.png">
    <img src="images/index03.png">
    <button type="button" class="btn btn-success" style="width: 980px;margin: 65px auto 65px auto;display: block"
            onclick="exam()">立即考试
    </button>
</div>
<div class="footer">
    <div class="footer-content">
            <span>
                xxxxx有限公司
                <a href="#">Copyright@www.mingrisoft.com </a>
                AllRights Reserved 备案号:吉ICP证07500273
            </span>
    </div>
</div>
<script>
    <%-- 立即考试 --%>
    function exam() {
        //跳转到考试科目
        var kskmPath = "<%=basePath%>" + "/kskm";
        window.location.href = kskmPath
    }
</script>
<script src="<%=basePath%>/js/common.js"></script>
</body>
</html>
