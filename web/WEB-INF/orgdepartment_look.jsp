<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>orgdepartment_look</title>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/uploadfile/jquery.filer.css">
    <link rel="stylesheet" href="/css/uploadfile/jquery.filer-dragdropbox-theme.css">
    <style>
        body{
            /*padding: 30px;*/
            /*background: rgb(229, 243, 233);*/
        }
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
        form{
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }
        #basicform{
            background: rgba(255,255,255,0.8);
            padding: 20px;
        }
        #additionmains{
            background: rgba(255,255,255,0.8);
            padding: 20px;
        }

    </style>
</head>
<body>
<canvas id="canvas" style="position:fixed;z-index:-1;height: 100%;width: 100%;"></canvas>
<div class="container">
    <!--<div style="height: 100px"></div>-->
    <div class="row">
        <div class="col-sm-12 contenttop">
            <h4 style="float: left;">基本信息</h4>
            <div class="btn-group btns" style="float: right;font-size: 15px;">
                <button type="button" class="btn btn-default copy" data-clipboard-target="#basicform"><span class="glyphicon glyphicon-tags"></span> 复制</button>
                <!--<button type="button" class="btn btn-default csv">CSV</button>-->
                <button type="button" class="btn btn-default print" ><span class="glyphicon glyphicon-print"></span> 打印</button>
            </div>
        </div>
        <div  class="col-sm-12 formpart" id="basicform" role="form">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label text-left">部门名称</label>
                            <div class="col-sm-8">
                                <input name="" class="form-control" value="${organize==null?"":organize.oname}" type="text" AUTOCOMPLETE=OFF disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label text-left">负责人</label>
                            <div class="col-sm-8">
                                <input name=""  class="form-control" value="${organize==null?"":organize.director}" type="text" AUTOCOMPLETE=OFF disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label text-left">电话</label>
                            <div class="col-sm-8">
                                <input  name="" class="form-control" value="${organize==null?"":organize.phone}" type="text" AUTOCOMPLETE=OFF disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label text-left">详细地址</label>
                            <div class="col-sm-8">
                                <input name="" class="form-control" value="${organize==null?"":organize.adress}" type="text" AUTOCOMPLETE=OFF disabled/>
                            </div>
                        </div>


                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label text-left">部门代码</label>
                            <div class="col-sm-8">
                                <input name="" class="form-control" value="${organize==null?"":organize.ocode}" type="text" AUTOCOMPLETE=OFF disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label text-left">员工数量</label>
                            <div class="col-sm-8">
                                <input name="" class="form-control" value="${organize==null?"":organize.pnumber}" type="text" AUTOCOMPLETE=OFF disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label text-left">部门标语</label>
                            <div class="col-sm-8">
                                <input  name="" class="form-control" value="${organize==null?"":organize.orgnote}" type="text" AUTOCOMPLETE=OFF disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label text-left">邮箱</label>
                            <div class="col-sm-8">
                                <input  name="" class="form-control" value="${organize==null?"":organize.email}" type="text" AUTOCOMPLETE=OFF disabled/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <div class="col-sm-12 contenttop" style="margin-top: 15px">
            <h4 style="float: left">附件资料</h4>
        </div>
        <div action="" class="col-sm-12 formpart" id="additionmains">
                <div class="row">
                    <div class="col-md-12">
                        <input type="file" name="files[]"  id="filer_input" multiple="multiple">
                            <!--<input type="submit" value="Submit">-->
                        <%--<button type="submit" class="btn btn-info center-block" value="Submit" style="width: 100px;font-size: 15px;">提交</button>--%>
                    </div>
                </div>
        </div>
        <div class="col-sm-12" style="margin-top: 15px">
                <button type="button" id="backbtn" class="btn btn-default center-block">&nbsp;<span class="glyphicon glyphicon-circle-arrow-left"></span> 返回&nbsp;</button>
        </div>
    </div>
</div>
<script src="/js/jquery/jquery-2.1.1.min.js"></script>
<script src="/js/bootstrap/bootstrap.min.js"></script>
<script src="/js/background/milkybg.js"></script>
<script src="/js/table/jQuery.print.js"></script><!--打印-->
<script  src="/js/table/clipboard.min.js"></script><!--复制-->
<script src="/js/uploadfile/jquery.filer.min.js"></script>
<script>
    //        <!--打印-->
    $('.print').on('click',function () {
        $("form").print({
            globalStyles: false,
            iframe:false,
            noPrintSelector: "caption",
            stylesheet:"/css/bootstrap/bootstrap.min.css"
        });
    })
    //        <!--复制-->
    var clipboard = new Clipboard('.copy');
    clipboard.on('success', function(e) {
        alert("文字已复制到剪贴板中");
    });
    clipboard.on('error', function(e) {
    });
    $('#backbtn').on('click',function () {
        history.go(-1);
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