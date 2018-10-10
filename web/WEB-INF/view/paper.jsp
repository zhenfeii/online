<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <style>
        .header{
            height: 75px;
            background-color: #293448;
        }
        .header-wyuIcon{
            display: inline-block;
            margin-left: 20%;
        }

        .header-links{
            display: inline-block;
            margin-left: 50px;
        }
        .header-links a{
            margin-top: 8px;
            margin-left: 30px;
            padding-bottom: 0;
            font-size: 1.2rem;
            color: #ffffff;
        }
        .content-selectPaper{
            height: 150px;
            width: fit-content;
            margin: 20px auto 0;
            padding-top: 50px;
            background-color: #f1faea;
        }
        .container{
            max-width: 1200px;
            margin-top: 20px;
        }
        .col{
            width: 72px;
            border: 1px solid #dddddd;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-wyuIcon">
            <img src="../../images/wyu-logo.png">
        </div>
        <div class="header-links">
            <nav class="nav">
                <a class="nav-link active" href="<%=basePath%>/main">首页</a>
                <a class="nav-link" href="<%=basePath%>/kskm" style="color: green;border-bottom: 3px solid green">在线考试</a>
                <a class="nav-link" href="<%=basePath%>/grade">成绩查询</a>
                <a class="nav-link disabled" href="#">你好，尊敬的会员：${username}</a>
                <a class="nav-link" href="<%=basePath%>/logout" onclick="logout()">登出</a>
            </nav>
        </div>
    </div>
    <img src="../../images/shijuan01.png" style="display: block;width: fit-content;margin: 20px auto 0">
    <div class="content-selectPaper">
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <button type="button" class="btn btn-secondary readonly">请选择试卷</button>
            </div>
            <select class="form-control" style="width: 960px" id="paperTitle">
                <option value="">请选择试卷</option>
                <c:forEach items="${papers}" var="item">
                    <option value="${item.id}">${item.name}</option>
                </c:forEach>
            </select>
            <div class="input-group-append">
               <button type="button" class="btn btn-success" onclick="onTest()">开始考试</button>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row" style="background-color: #f1faea;">
            <div class="col" style="padding: 20px 0 20px 20px;font-weight:bold">
                考场规定
            </div>
            <div class="col" style="padding: 20px 0 20px 20px; font-weight:bold ">
                考场提示
            </div>
        </div>
        <div class="row">
            <div class="col" style="padding-bottom: 200px">
                <div>1.不准携带手机,耳机</div>
                <div>2.不准交头接耳</div>
                <div>3.不准携带与考试无关物品</div>
            </div>
            <div class="col" style="padding-bottom: 200px">
                <div>1.考试发现违纪,本次考试作废</div>
                <div>2.如有问题,请举手</div>
                <div>3.保管好私人物品</div>
            </div>
        </div>
    </div>
    <script>
        function onTest() {
            var paperTitle = document.getElementById("paperTitle")
            //获取<select>节点的value值
            var value = paperTitle.value
            if(value != ""){
                //跳转到考试页面
                var paperPath = "<%=basePath%>" + "/exam?paper_id=" + value;
                window.location.href = paperPath
            }
        }
    </script>
    <script src="<%=basePath%>/js/common.js"></script>
</body>
</html>
