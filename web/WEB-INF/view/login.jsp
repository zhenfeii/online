<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>五邑大学在线考试系统</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <%-- 引入 Font Awesome --%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css"
          integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
    <style>
        .backgroup {
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background-color: #6699ff;
        }

        .login-title {
            margin: 200px auto 0;
            width: 500px;
            height: 100px;
            background-color: #293D66;
            text-align: center;
            line-height: 4;
            font-size: 25px;
            font-weight: 300;
            color: #ffffff;
        }

        .login-body {
            width: 500px;
            height: 300px;
            margin: 0 auto;
            background-color: #C2D3FF;
        }

        .loginBtn {
            margin: auto;
        }
    </style>
</head>
<body>
<div>
    <div class="login-title">
        五邑大学在线考试系统
    </div>
    <div class="login-body">
        <form action="<%=basePath%>login" method="post" id="login-form">
            <div class="input-group mb-3" style="padding: 50px 20px 0 20px">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" placeholder="用户名" name="username">
            </div>
            <div class="input-group mb-3" style="padding: 10px 20px 0 20px">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon2"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control" placeholder="密码" name="password" id="password">
            </div>
            <div class="input-group mb-3">
                <button type="button" class="btn btn-sm btn-info loginBtn" id="loginBtn" onclick="login()">
                    <i class="fab fa-angellist"></i>
                    登录
                </button>
            </div>
            <div class="input-group mb-3" style="width: fit-content;margin: auto">
                <c:choose>
                    <c:when test="${not empty errMsg}">
                        <div style="color: red">登录失败：${errMsg}</div>
                    </c:when>
                </c:choose>
            </div>
        </form>
    </div>
</div>
<div class="backgroup"></div>
<script>
    var password = document.getElementById("password")
    password.addEventListener("keyup", function (ev) {
        ev.preventDefault()
        // Number 13 is the "Enter" key on the keyboard
        if (ev.keyCode === 13) {
            login()
        }
    })

    function login() {
        document.getElementById("login-form").submit()
    }
</script>
</body>
</html>
