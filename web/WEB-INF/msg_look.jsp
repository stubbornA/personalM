<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>消息发送</title>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/editor/font-awesome.css">
    <link rel="stylesheet" href="/css/editor/editor.css">
    <style>
        label{
            color: #f1f1f1;
            font-size: 20px;
        }
        /*#editor{*/
            /*background: rgba(255,255,255,0.5);*/
        /*}*/
    </style>
</head>
<body>
<canvas id="canvas" style="position:fixed;z-index:-1;height: 100%;width: 100%;"></canvas>
<div style="height: 20px"></div>
<div class="container">
    <form class="row">
        <div class="col-md-12" id="title">
            <div class="form-group">
                <label  class="col-md-1 control-label">标题:</label>
                <div class="col-md-11">
                    <input type="text" class="form-control" value="${message==null?"":message.mtitle}" disabled/>
                </div>
            </div>
        </div>
        <div class="col-md-12" id="editor">
            <div class="form-group">
                <label  class="col-md-1 control-label">正文:</label>
                <div class="col-md-11">
                    <textarea style="color: black;width: 100%;height: 400px" disabled>${message==null?"":message.mcontent}</textarea>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="/js/jquery/jquery-2.1.0.min.js"></script>
<script src="/js/bootstrap/bootstrap.min.js"></script>
<script src="/js/background/milkybg.js"></script> <!-- 背景-->
<script src="/js/editor/editor.js"></script>
<script>
    $(function () {
        $("#txtEditor").Editor();
        $('.backbtn').on('click',function () {
            history.back();
        })
    })
</script>
</body>
</html>