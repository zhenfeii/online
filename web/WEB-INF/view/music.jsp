<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML  4.0 Transitional//EN">
<html>
<head>
    <title>Title</title>
</head>
<body>
<input type="file" id="file" onchange="onInputFileChange()" multiple="multiple">
<audio id="audio_id" controls autoplay loop>Your browser can't support HTML5 Audio</audio>
<script>
    function onInputFileChange() {
        var file = document.getElementById('file').files[0];
        var url = URL.createObjectURL(file);
        console.log(url);
        document.getElementById("audio_id").src = "blob:http://localhost:6060/5bf11c27-7f3b-4576-a293-c51b669abc7d";
    }

</script>
</body>
</html>
