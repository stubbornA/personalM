<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        input, select {
            /*font-size:0.9em;*/
        }

        table {
            margin-top:-10px;
            margin-left:7px;
        }

        h4 {
            /*font-size:1.1em;*/
            text-decoration:none;
            font-weight:normal;
            color:#23A4FF;
        }

        a {
            color:#23A4FF;
        }

        #container {
            /*width: 1000px;*/
            height: 1000px;
            /*margin:0 auto;*/
            position:relative;
        }
        #right-container, #center-container {
            /*height:1000px;*/
        }
        #right-container {
            color:#ffffff;
            text-align: left;
            overflow: auto;
            background-color:rgba(0,0,0,0.4);
            padding: 20px;
            padding-top: 100px;
        }
        #right-container {
            background-position:center left;
        }
        #right-container h4{
            text-indent:8px;
        }
        #center-container {
            font-size: 20px;
            background-color:rgba(0,0,0,0.4);
            color:#ccc;
        }
        .tree {
            background:rgba(0,0,0,0);
            border: none;
            min-height:20px;
            padding:19px;
        }
        .tree li {
            list-style-type:none;
            margin:0;
            padding:10px 5px 0 5px;
            position:relative
        }
        .tree li::before, .tree li::after {
            content:'';
            left:-20px;
            position:absolute;
            right:auto
        }
        .tree li::before {
            border-left:1px solid #999;
            bottom:50px;
            height:100%;
            top:0;
            width:1px
        }
        .tree li::after {
            border-top:1px solid #999;
            height:20px;
            top:25px;
            width:25px
        }
        .tree li span {
            -moz-border-radius:5px;
            -webkit-border-radius:5px;
            border:1px solid #999;
            border-radius:5px;
            display:inline-block;
            padding:3px 8px;
            text-decoration:none
        }
        .tree li.parent_li>span {
            cursor:pointer
        }
        .tree>ul>li::before, .tree>ul>li::after {
            border:0
        }
        .tree li:last-child::before {
            height:30px
        }
        .tree li.parent_li>span:hover, .tree li.parent_li>span:hover+ul li span {
            background:#eee;
            border:1px solid #94a0b4;
            color:#000
        }
        .size{
            font-size: 20px;
        }
        li{
            font-size: 20px;
        }
        /*li span{*/
        /*font-size: 15px;*/
        /*}*/
    </style>
    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
</head>
<body>
<canvas id="canvas" style="position:fixed;z-index:-1;height: 100%;width: 100%;"></canvas>
<div class="container">
    <div class="row">
        <div id="container">
            <div id="center-container" class="col-md-8">
                <div class="tree well" style="background: rgba(0,0,0,0);border: none">

                    <ul id="rootUL">

                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
<script src="js/jquery/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/background/milkybg.js"></script>
<script type="text/javascript">
    $(function () {

        $('#backbtn').on('click',function () {
            history.go(-1);
        })
        var json = ${queryStr};
        var json1=[
            {},
            {},
            {}
        ]
        console.log("json"+json);
        function tree(data) {
            for (var i = 0; i < data.length; i++) {
                console.log(data[i].pid);
                var data2 = data[i];
                if (data[i].pid == -1) {
//                    console.log("dddd");
                    $("#rootUL").append("<li data-name='" + data[i].id + "' style='font-size: 20px'> <span class='glyphicon glyphicon-plus' > " + data[i].name + "</span></li>");
                } else {

                    var children = $("li[data-name='" + data[i].pid + "']").children("ul");
                    if (children.length == 0) {
                        $("li[data-name='" + data[i].pid + "']").append("<ul></ul>")
                    }
                    $("li[data-name='" + data[i].pid + "'] > ul").append(
                            "<li data-name='" + data[i].id + "'>" +
                            "<span class=''>" +
                            data[i].name +
                            "</span>" +
                            "</li>")

                }
                for (var j = 0; j < data[i].child.length; j++) {
                    var child = data[i].child[j];
                    var children = $("li[data-name='" + child.pid + "']").children("ul");
                    if (children.length == 0) {
                        $("li[data-name='" + child.pid + "']").append("<ul></ul>")
                    }
                    $("li[data-name='" + child.pid + "'] > ul").append(
                            "<li data-name='" + child.id + "'>" +
                            "<span class=''  > " +
                            child.name +
                            "</span>" +
                            "</li>")

                    var child2 = data[i].child[j].child;
                    tree(child2);
                }
                tree(data[i]);
            }

        }

        tree(json);


        $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', '关闭');
        $('.tree li.parent_li > span').on('click', function (e) {
            var children = $(this).parent('li.parent_li').find(' > ul > li');
            if (children.is(":visible")) {
                children.hide('fast');
                $(this).attr('title', '展开').addClass('size glyphicon glyphicon-minus').removeClass('glyphicon glyphicon-plus');
            } else {
                children.show('fast');
                $(this).attr('title', '关闭').addClass('size glyphicon glyphicon-plus').removeClass('glyphicon glyphicon-minus');
            }
            e.stopPropagation();
        });
        $('.tree li.parent_li > span').addClass('size glyphicon glyphicon-plus').removeClass('glyphicon glyphicon-minus');
    });
</script>
<script>
    $('#lsubmit').on('click',function () {

        var json=JSON.stringify($("#orgName"));
        var value=$("#orgName").val();

        $.ajax({
            type:"POST",
            url:"OrganizationManager_checkHasOrg.do?orgName="+value,
            contentType:"application/json",
            dataType:"html json",
            async:false,
            data:json,
            success:function (data) {
                var jsonStr=data;
                var jsonObj =  JSON.parse(jsonStr);
                console.log(jsonObj.state);
                if(jsonObj.state==0){//验证码正确
                    $('#orgName').next().html("");
                    alert("选择成功!");
                    $('#mainform').submit();
                }else{//验证码错误
                    $('#orgName').next().html("组织不存在");
                    alert("请正确填写组织名称！");
                    return;
                }

            }
        })

    })
</script>
</html>