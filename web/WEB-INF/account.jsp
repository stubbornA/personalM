<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>account</title>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <style>
        body{
            /*padding: 15px;*/
            /*background: #000000;*/
        }
        .form{
            width: 90%;
            margin: 100px auto;
            font-size: 20px;
            color: #ffffff;
        }
        .form input{
           height: 45px;
            filter:alpha(opacity=50); /*IE滤镜，透明度50%*/
            -moz-opacity:0.5; /*Firefox私有，透明度50%*/
            opacity:0.5;/*其他，透明度50%*/
        }
        .container{
            /*margin: 200px auto;*/
            /*margin-top: 200px;*/
            border: solid 4px #548b9a;
            box-shadow: 0px 0px 10px 6px #548b9a;
            border-radius: 18px;
            padding: 20px;
        }
       .mod{
           float: right;
       }
       #btn{
           display: none;
       }
       #form2{
           display: none;
       }
        .show{
            display: block;
        }
        .hide{
            display: none;
        }
    </style>
</head>
<body>
<canvas id="canvas" style="position:fixed;z-index:-1;height: 100%;width: 100%;"></canvas>
<div style="height: 100px"></div>
<div class="container">
    <div class="mod">
        <button id="modify" class="btn btn-info" >修改密码</button>
    </div>
<form class="form-horizontal form" id="form" role="form" >
    <div class="form-group">
        <label class="col-sm-2 control-label name">账号：</label>
        <div class="col-sm-9">
            <input type="text" class="form-control "  value="${account==null?"":account.username}" placeholder="" disabled/>
        </div>
    </div>
    <div class="form-group">
    <label  class="col-sm-2 control-label">密码：</label>
    <div class="col-sm-9">
        <input type="password" class="form-control"  value="${account==null?"":account.password}" placeholder="" disabled/>
    </div>
    </div>
</form>
<form class="form-horizontal form" action="http://localhost:8080/account/AccountAction_AccountUpdate" id="form2" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label name">账号：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control " name="username"  value="${account==null?"":account.username}" disabled/>
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">新密码：</label>
            <div class="col-sm-9">
                <input type="password" id="password" class="form-control"  name="password"  placeholder="" />
            </div>
        </div>
        <div class="form-group repass" >
            <label  class="col-sm-2 control-label relable">重复密码：</label>
            <div class="col-sm-9" >
                <input type="password" class="form-control"  name="repassword"  placeholder=""/>
            </div>
        </div>
    <div class="form-group" id="btn">
        <div class="col-sm-offset-3 col-sm-6">
            <input type="hidden" name="aid" value="${account==null?"":account.aid}">
            <button id="cancel" type="button" class="btn btn-info" style="float:left;width: 150px;">取消</button>
            <button id="submit" type="submit" class="btn btn-success" style="float: right;width: 150px">提交</button>
        </div>
    </div>
    </form>
</div>
<script src="/js/jquery/jquery-2.1.1.min.js"></script>
<script src="/js/bootstrap/bootstrap.min.js"></script>
<script src="/js/jquery/jquery.validate.js"></script>
<script src="/js/background/milkybg.js"></script> <!-- 背景-->
<script>
    $('#form2').validate({
        rules:{
            password: {
                required: true,
                minlength: 6,
                maxlength:10
            },
            repassword: {
                required: true,
                equalTo: "#password"
            }
        },
        messages:{
            password: {
                required: "请输入密码",
                minlength: jQuery.format("密码为6~10位")
            } ,
            repassword: {
                required: "请输入确认密码",
                equalTo: "两次输入密码不一致"
            }
        },
        errorPlacement: function (error, element) { //指定错误信息位置
            error.insertAfter( element).wrapInner('<span style="color: red;" class="errormsg"/>');
        }
    })
        $('#modify').on('click',function () {
           $('#form').addClass('hide');
            $('#form2').addClass('show');
            $(this).addClass('hide');
            $('#btn').addClass('show');
        })
        $('#cancel').on('click',function () {
            $('#form2').toggleClass('show');
            $('#form').toggleClass('hide');
            $('#btn').toggleClass('show');
            $('#modify').toggleClass('hide')
        })
</script>
</body>
</html>