<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>成绩查询</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
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
        .grade-img{
            width: fit-content;
            margin: 20px auto 0;
        }
        .grade-body{
            width: fit-content;
            margin: 40px auto 0;
        }
        table{
            margin-left: 12px;
            background-color: #f1faea;
        }
        table td{
            padding-left: 100px;
            border: 1px solid #dddddd;
            line-height: 40px;
            font-size: 15px;
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
                <a class="nav-link active" href="<%=basePath%>main">首页</a>
                <a class="nav-link" href="<%=basePath%>kskm">在线考试</a>
                <a class="nav-link" href="<%=basePath%>grade" style="color: green;border-bottom: 3px solid green">成绩查询</a>
                <a class="nav-link disabled" href="#">你好，尊敬的会员：${username}</a>
                <a class="nav-link" href="<%=basePath%>/logout" onclick="logout()">登出</a>
            </nav>
        </div>
    </div>
    <div class="grade-img">
        <img src="<%=basePath%>images/chaxun03.png">
    </div>
    <div class="grade-body">
        <img src="<%=basePath%>images/chaxun01.png">
        <table>
            <col width="300">
            <col width="300">
            <col width="300">
            <col width="300">
            <tr style="font-weight: bold">
                <td>序列</td>
                <td>所属课程</td>
                <td>考卷发布日期</td>
                <td>考试分数</td>
            </tr>
            <c:forEach items="${grades}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.subject}</td>
                    <td>${item.release_time}</td>
                    <td>${item.score}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <script src="<%=basePath%>/js/common.js"></script>
</body>
</html>
