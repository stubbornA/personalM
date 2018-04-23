<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>orgdepartment_add</title>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/uploadfile/jquery.filer.css">
    <link rel="stylesheet" href="/css/uploadfile/jquery.filer-dragdropbox-theme.css">
    <style>
        /*body{*/
        /*padding: 30px;*/
        /*background: rgb(229, 243, 233);*/
        /*}*/
        .contenttop{
            height: 40px;
            background: rgba(255,255,255,0.5);
            color: #ffffff;
            padding: 2px;
            border-radius: 5px;
            margin-bottom: 1px;
        }
        .form-group{
            font-size: 18px;
        }
        .form-group input{
            margin-bottom: 10px;
        }
        .formpart{
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }
        .basic{
            background: #e5e5e5;
            padding: 20px;
        }
        #mainform .additions{
            background: #e5e5e5;
            padding: 20px;
        }
        input.error { border: 1px solid red; }
        label.error {
            padding-left: 16px;

            padding-bottom: 2px;

            font-weight: bold;
            font-size: 10px;

            color: #EA5200;
        }
    </style>
</head>
<body>
<canvas id="canvas" style="position:fixed;z-index:-1;height: 100%;width: 100%;"></canvas>
<div class="container">
    <!--<div style="height: 100px"></div>-->
    <form class="row" id="mainform" action="http://localhost:8080/role/roleAction_roleAdd">
        <div class="col-sm-12 contenttop">
            <h4 style="float: left;">基本信息</h4>
            <div class="btn-group btns" style="float: right;font-size: 15px;">
                <button type="button" class="btn btn-default copy" data-clipboard-target="#basicform"><span class="glyphicon glyphicon-tags"></span> 复制</button>
                <button type="button" class="btn btn-default print" ><span class="glyphicon glyphicon-print"></span> 打印</button>
            </div>
        </div>
        <div  class="col-sm-12 formpart basic">
            <div class="row">
                    <div class="form-group">
                        <label for="" class="col-sm-3 control-label text-left">角色名称</label>
                        <div class="col-sm-8">
                            <input  name="rname" id="rname" class="form-control" type="text" AUTOCOMPLETE=OFF />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 control-label text-left">角色描述</label>
                        <div class="col-sm-8">
                            <input type="text" name="rdescribe" class="form-control" AUTOCOMPLETE=OFF >
                        </div>
                    </div>
            </div>
        </div>
        <div class="col-sm-12" style="margin-top: 15px">
            <div class="btn-group center-block" style="width: 160px">
                <button type="button" id="backbtn" class="btn btn-default center-block">&nbsp;<span class="glyphicon glyphicon-circle-arrow-left"></span> 返回&nbsp;</button>
                <button type="submit" class="btn btn-success center-block" id="formsubmit">&nbsp;<span class="glyphicon glyphicon-saved"></span> 添加&nbsp;</button>
            </div>
        </div>
    </form>
</div>
<script src="/js/jquery/jquery-2.1.1.min.js"></script>
<script src="/js/bootstrap/bootstrap.min.js"></script>
<script src="/js/background/milkybg.js"></script>
<script src="/js/jquery/jquery.validate.js"></script>
<script src="/js/table/jQuery.print.js"></script><!--打印-->
<script  src="/js/table/clipboard.min.js"></script><!--复制-->
<script src="/js/uploadfile/jquery.filer.min.js"></script><!--上传文件-->
<script src="/js/placechoose/distpicker.data.js"></script>
<script src="/js/placechoose/distpicker.js"></script>
<script>
    $('#formsubmit').on('click',function () {
        var files=$('#filer_input');
        console.log(files);
    })
    $('#chooseplace').distpicker({
        autoSelect: false
    });
    //        <!--打印-->
    $('.print').on('click',function () {
        $("form").print({
            globalStyles: false,
            iframe:false,
            noPrintSelector: "caption",
            stylesheet:"css/bootstrap/bootstrap.min.css"
        });
    })
    //        <!--复制-->
    var clipboard = new Clipboard('.copy');
    clipboard.on('success', function(e) {
        alert("文字已复制到剪贴板中");
    });
    clipboard.on('error', function(e) {
    });

    //    $('[name=email]').on('blur',function () {
    //        var email=$(this).val();
    //        alert(email);
    //        $.ajax({
    //            url:"",
    //            dataType:"post",
    //            data:"",
    //            type:"",
    //            contentType:"",
    //            success:function (data) {
    //
    //            }
    //        })
    //    })
    $('#backbtn').on('click',function () {
        history.go(-1);
    })
    $('#mainform').validate({
        rules: {
            cmp_code: {
                required: true,
            },
            cmp_name: {
                required: true,
            },
            cmp_address: {
                required: true,
            },
            law_person:{
                required:true
            },
//            phone:{
//                required:true,
//            },
            email: {
                required: true,
                email:true
            },
            employee_number:{
                digits:true
            },
            province:{
                required: true,
            },
            city: {
                required: true,
            },
            district:{
                required: true,
            }
        },
        messages: {
            cmp_code: {
                required: "请输入单位编码",
            },
            cmp_name: {
                required: "请输入名称",
            },
            cmp_address: {
                required: "请输入详细地址",
            },
            law_person:{
                required:"请输入法人"
            },
//            phone:{
//                required:"请输入电话",
//            },
            email: {
                required: "请输入邮箱",
                email:"请注意邮箱格式"
            },
            employee_number:{
                digits:"请填写整数"
            },
            province:{
                required: "请选择省份",
            },
            city: {
                required: "请选择市区",
            },
            district:{
                required: "请选择县/镇",
            }
        },
        errorPlacement: function (error, element) { //指定错误信息位置
            if (element.is(':radio') || element.is(':checkbox')) { //如果是radio或checkbox
                var eid = element.attr('name'); //获取元素的name属性
                error.insertAfter('[value="female"]'); //将错误信息添加当前元素的父结点后面
            } else {
                error.insertAfter( element).wrapInner('<span class="errormsg"/>');
            }
        }
    })

    $('#filer_input').filer({
        showThumbs: true,
        templates: {
            box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
            item: '<li class="jFiler-item">\
                    <div class="jFiler-item-container">\
                        <div class="jFiler-item-inner">\
                            <div class="jFiler-item-thumb">\
                                <div class="jFiler-item-status"></div>\
                                <div class="jFiler-item-info">\
                                    <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
                                    <span class="jFiler-item-others">{{fi-size2}}</span>\
                                </div>\
                                {{fi-image}}\
                            </div>\
                            <div class="jFiler-item-assets jFiler-row">\
                                <ul class="list-inline pull-left">\
                                    <li>{{fi-progressBar}}</li>\
                                </ul>\
                                <ul class="list-inline pull-right">\
                                    <li><span class="glyphicon glyphicon-trash jFiler-item-trash-action"></span></li>\
                                </ul>\
                            </div>\
                        </div>\
                    </div>\
                </li>',
            itemAppend: '<li class="jFiler-item">\
                        <div class="jFiler-item-container">\
                            <div class="jFiler-item-inner">\
                                <div class="jFiler-item-thumb">\
                                    <div class="jFiler-item-status"></div>\
                                    <div class="jFiler-item-info">\
                                        <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
                                        <span class="jFiler-item-others">{{fi-size2}}</span>\
                                    </div>\
                                    {{fi-image}}\
                                </div>\
                                <div class="jFiler-item-assets jFiler-row">\
                                    <ul class="list-inline pull-left">\
                                        <li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
                                    </ul>\
                                    <ul class="list-inline pull-right">\
                                        <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
                                    </ul>\
                                </div>\
                            </div>\
                        </div>\
                    </li>',
            progressBar: '<div class="bar"></div>',
            itemAppendToEnd: false,
            removeConfirmation: true,
            _selectors: {
                list: '.jFiler-items-list',
                item: '.jFiler-item',
                progressBar: '.bar',
                remove: '.jFiler-item-trash-action'
            }
        },
        uploadFile: {
            url: "",
            data: null,
            type: 'POST',
            enctype: 'multipart/form-data',
            beforeSend: function(){},
            success: function(data, el){
                var parent = el.find(".jFiler-jProgressBar").parent();
                el.find(".jFiler-jProgressBar").fadeOut("slow", function(){
                    $("<div class=\"jFiler-item-others text-success\"><span class=\"glyphicon glyphicon-ok-circle\"></span> Success</div>").hide().appendTo(parent).fadeIn("slow");
                });
            },
            error: function(el){
                var parent = el.find(".jFiler-jProgressBar").parent();
                el.find(".jFiler-jProgressBar").fadeOut("slow", function(){
                    $("<div class=\"jFiler-item-others text-error\"><span class=\"glyphicon glyphicon-remove-circle\"></span> Error</div>").hide().appendTo(parent).fadeIn("slow");
                });
            },
            statusCode: null,
            onProgress: null,
            onComplete: null
        },
        onRemove: function(itemEl, file){
            var file = file.name;
            $.post('', {file: file});
        }
    });
</script>
</body>
</html>