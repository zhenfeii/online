<%--
   考试页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String socketPath = request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>考试页面</title>
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

        .exam-explain {
            background-color: #f5f5f5;
            padding-left: 47px;
            font-size: 15px;
            color: #337ab7;
        }

        .main-content {
            width: 1172px;
            margin: auto;
            background-color: #fcf8e3;
        }

        .main-content-title {
            width: fit-content;
            margin: auto;
            padding: 30px 0 30px 0;
            color: #337ab7;
            font-size: 24px;
        }

        .test-question {
            margin: 22px 15px;
        }

        .test-question .question {
            padding-left: 15px;
            background-color: #dff0d8;
            line-height: 58px;
            font-size: 18px;
            font-weight: 500;
            color: #000000;
        }

        .test-question .answer {
            padding-left: 25px;
            line-height: 36px;
            font-size: 16px;
        }

        .exam-time {
            position: fixed;
            left: 0;
            top: 30%;
        }

        .exam-time .text {
            padding: 10px 15px;
            border: 1px solid #d6e9c6;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            background-color: #dff0d8;
            line-height: 1.5;
            font-weight: 400;
            font-size: 14px;
            color: #3c763d;
            width: 120px;
            height: 40px;
        }

        .exam-time .value {
            padding: 10px 15px;
            border: 1px solid #d6e9c6;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            background-color: #ffffff;
            line-height: 1.5;
            font-weight: 400;
            font-size: 14px;
            color: #23527c;
            width: 120px;
            height: 40px;
        }
        .exam-time .value span{
            color: red;
        }

        .answer-sheet {
            position: fixed;
            right: 0;
            top: 30%;
            width: 290px;
        }

        .answer-sheet .title {
            padding: 10px 15px;
            background-color: #dff0d8;
            line-height: 1.5;
            font-weight: 400;
            font-size: 14px;
            color: #3c763d;
            border: 1px solid #d6e9c6;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .answer-sheet .body {
            border: 1px solid #d6e9c6;
        }

        .answer-sheet .submit {
            padding: 10px 0 0 116px;
            height: 62px;
            background-color: #f5f5f5;
            border: 1px solid #d6e9c6;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .answer-sheet td {
            border: 1px solid #ddd;
            width: 45px;
            height: 40px;
        }

        .answer-sheet-a {
            display: block;
            width: 25px;
            height: 20px;
            padding: 1px 0 0 8px;
            font-size: 15px;
            border-radius: 3px;
            background-color: #5bc0de;
            margin: auto;
            color: #ffffff;
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
            <a class="nav-link active" href="<%=basePath%>grade">首页</a>
            <a class="nav-link" href="<%=basePath%>kskm" style="color: green;border-bottom: 3px solid green">在线考试</a>
            <a class="nav-link" href="<%=basePath%>grade">成绩查询</a>
            <a class="nav-link disabled" href="#">你好，尊敬的会员：${username}</a>
            <a class="nav-link" href="<%=basePath%>/logout" onclick="logout()">登出</a>
        </nav>
    </div>
</div>
<div class="main-content">
    <form id="exam" action="<%=basePath%>exam" method="post">
        <div class="main-content-title">长春代数试题(卷一)</div>

        <div class="exam-explain">
            <div style="font-weight: bolder;">试卷说明:</div>
            <div>1、本卷共分为三大题100小题,作答时间为120分钟,总分100分.</div>
            <div>2、试题年份:2018</div>
            <div>3、试卷来源:考试资料网在线考试中心.</div>
            <div>4、鼠标左键双击标题可在答题卡制作标记.</div>
        </div>

        <div class="test-question">
            <c:forEach items="${paperContents}" var="item" varStatus="vs">
                <div class="test-question-item">
                    <a name="a${vs.index }" id="#a${vs.index}"></a>
                    <div class="question">
                            ${vs.index+1}.${item.title}
                        <a href="javascript:void(0)" onclick="onfirmAnswer(${vs.index})">【答题标志】</a>
                    </div>
                    <div class="answer">
                        <input type="radio" name="title${vs.index + 1}-answer" value="A">
                        A.${item.option1}
                    </div>
                    <div class="answer">
                        <input type="radio" name="title${vs.index + 1}-answer" value="B">
                        B.${item.option2}
                    </div>
                    <div class="answer">
                        <input type="radio" name="title${vs.index + 1}-answer" value="C">
                        C.${item.option3}
                    </div>
                    <div class="answer">
                        <input type="radio" name="title${vs.index + 1}-answer" value="D">
                        D.${item.option4}
                    </div>
                </div>
            </c:forEach>
        </div>
    </form>
</div>
<div class="exam-time">
    <div class="text">考试剩余时间</div>
    <div class="value"><span id="exam_time_m"></span>分<span id="exam_time_s"></span>秒</div>
</div>
<%--答题卡--%>
<div class="answer-sheet">
    <div class="title">答题卡</div>
    <div class="body">
        <table style="margin: 14px">
            <c:forEach items="${paperContents }" var="item" varStatus="vs">
                <c:if test="${vs.index % 6 == 0 }">
                    <c:set var="flagIndex" value="${vs.index + 6}"></c:set>
                    <tr>
                </c:if>
                <td>
                    <a id="answer-sheet${vs.index}" class="answer-sheet-a" href="javascript:void(0);"
                       onclick="getIndex(${vs.index})">${vs.index + 1}</a>
                </td>
                <c:if test="${(vs.index eq flagIndex)||vs.last}">
                    </tr>
                </c:if>
            </c:forEach>

        </table>
    </div>
    <div class="submit">
        <button type="button" class="btn btn-success btn-sm" style="background-color: #5cb85c;line-height: 1;"
                onclick="onSubmit()">交卷
        </button>
    </div>
</div>
<script>
    var basePath = '<%=basePath%>';
    var socketPath = '<%=socketPath%>';


    countTime(1 * 60 * 30)

    //30分钟的倒计时
    function countTime(leftTime) {
        //单位：秒
        // var leftTime = 1 * 60 * 30;
        if (leftTime >= 0) {
            m = parseInt(leftTime / 60)  //保留整数部分
            s = leftTime % 60          //取余灵敏部分
            document.getElementById("exam_time_m").innerText = m
            document.getElementById("exam_time_s").innerText = s
        }else {
            onSubmit()
        }
        leftTime--
        setTimeout(countTime, 1000 * 1,leftTime);
    }


    //疑问：window.location.hash 与window.location.href的区别
    function getIndex(flag) {
        window.location.href = "#a" + flag;
    }

    function onSubmit() {
        document.getElementById("exam").submit()
    }

    function onfirmAnswer(index) {
        var id = "answer-sheet" + index
        var answerSheet = document.getElementById(id)
        if (answerSheet.classList.contains("answer-sheet-a-comfirm")) {
            answerSheet.classList.remove("answer-sheet-a-comfirm")
        } else {
            answerSheet.classList.add("answer-sheet-a-comfirm")
        }
    }


    /**
     * web socket 的东西，还没有搞懂！暂时省略
     */
    //判断当前浏览器是否支持WebSocket
    /*if ('WebSocket' in window) {
        websocket = new WebSocket("ws://" + socketPath + "mysocket");
    }
    else {
        alert('Not support websocket')
    }

    websocket.onerror = function (ev) {
        console.log("websocket connect error!")
    }

    websocket.onopen = function (ev) {
        send("start")
        console.log("send('start')")
    }

    websocket.onmessage = function (ev) {
        console.log("web server message: " + ev.data)
    }

    function send(message) {
        websocket.send(message)
    }*/


</script>
<script src="<%=basePath%>js/common.js"></script>
</body>
</html>
