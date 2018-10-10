<%--
  考试科目
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>考试科目</title>
    <%-- 引入 bootstrap --%>
    <%--<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">--%>
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

        .content-grid {
            display: block;
            width: fit-content;
            margin: 66px auto 0;
        }

        .content-table {
            max-width: 1200px;
            border: 1px solid #dddddd;
        }

        .content-table td {
            border: 1px solid #dddddd;
        }

        /* table 科目样式 */
        .table-kskm {
            display: block;
            margin: 35px 0 0 46px;
            font-weight: bold;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #a94442;
        }

        /* table 监考字体 */
        .table-jiankao {
            width: 280px;
            margin: 35px 20px 10px 20px;
            padding: 0px 0 0px 26px;
            background-color: #F1FAEA
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
                <a class="nav-link active" href="<%=basePath%>/main">首页</a>
                <a class="nav-link" href="<%=basePath%>/kskm" style="color: green;border-bottom: 3px solid green">在线考试</a>
                <a class="nav-link" href="<%=basePath%>/grade">成绩查询</a>
                <a class="nav-link disabled" href="#">你好，尊敬的会员：${username}</a>
                <a class="nav-link" href="<%=basePath%>/logout" onclick="logout()">登出</a>
            </nav>
        </div>
    </div>
    <img src="images/fenlei01.png" style="display: block;width: fit-content;margin: 66px auto 0">

    <div class="content-grid">
        <img src="images/fenlei02.png" style="margin-left: -29px">
        <table class="content-table">
            <c:choose>
                <c:when test="${not empty subjects }">
                    <c:forEach items="${subjects }" var="subject" varStatus="vs">
                        <c:if test="${vs.index % 4 == 0 }">
                            <c:set var="flagIndex" value="${vs.index + 4}"></c:set>
                            <tr>
                        </c:if>
                        <td>
                            <a class="table-kskm" style="color: #a94442"
                               href="<%=basePath%>/paper?subjectid=${subject.id}">${subject.subject}</a>
                            <div class="table-jiankao">监考老师—${subject.teacher}</div>
                        </td>
                        <c:if test="${(vs.index eq flagIndex)||vs.last}">
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:when>
            </c:choose>
        </table>
    </div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
    <script src="<%=basePath%>/js/common.js"></script>
</body>
</html>
