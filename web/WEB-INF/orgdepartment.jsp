<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/table/table.css">
</head>
<body>
<canvas id="canvas" style="position:fixed;z-index:-1;height: 100%;width: 100%;"></canvas>
<div class="container">
    <!--<div style="height: 100px"></div>-->
<div class="row">
    <div class="col-md-12" id="record">
        <div class="title">部门档案</div>
        <div class="topcontent">
            <button type="button" class="btn recordbtn"><a href="http://localhost:8080/organize/organizeAction_towardOrganizeAdd"><span class="glyphicon glyphicon-plus"></span> 新增</a></button>
        </div>
    </div>
    <div class="col-md-12" >
                        <div class="table-responsive" id="contentmain" >
                            <table  class="table table-bordered filter-table">
                                <div style="width: 100%;margin-bottom: 10px">
                                    <div class="contentcontrol">
                                        <div class="number">
                                            <select name="recordnumber" >
                                                <option value="">10</option>
                                                <option value="">25</option>
                                                <option value="">50</option>
                                                <option value="">100</option>
                                            </select><span style="color: white"> 条记录</span>
                                        </div>
                                        <div style="float: right">
                                            <div class="btn-group" style="float: right">
                                                <button type="button" class="btn btn-default dropdown-toggle"
                                                        data-toggle="dropdown">
                                                    显示/隐藏列 <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="javascript:void(0)"><input type="checkbox" checked="checked"> 序号</a></li>
                                                    <li><a href="javascript:void(0)"><input type="checkbox" checked="checked"> 部门名称</a></li>
                                                    <li><a href="javascript:void(0)"><input type="checkbox" checked="checked"> 负责人</a></li>
                                                    <li><a href="javascript:void(0)"><input type="checkbox" checked="checked"> 部门地址</a></li>
                                                    <li><a href="javascript:void(0)"><input type="checkbox" checked="checked"> 电话</a></li>
                                                    <li><a href="javascript:void(0)"><input type="checkbox" checked="checked"> 操作</a></li>
                                                </ul>
                                            </div>
                                            <div class="btn-group btns" style="float: right;font-size: 15px;">
                                                <button type="button" class="btn btn-default copy" data-clipboard-target="#basicform"><span class="glyphicon glyphicon-tags"></span> 复制</button>
                                                <button type="button" class="btn btn-default print" ><span class="glyphicon glyphicon-print"></span> 打印</button>
                                            </div>
                                            <div class="input-group search" style="width: 300px;float: right">
                                                               <span class="input-group-btn">
                                                              <button class="btn btn-default" type="button" ><span class="glyphicon glyphicon-search"></span> 搜索</button>
                                                               </span>
                                                <input type="text" class="form-control" id="searbtn-input">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <thead>
                                <tr>
                                    <th style="width:10%">序号</th>
                                    <th style="width:10%">部门名称</th>
                                    <th style="width:10%">负责人</th>
                                    <th style="width:10%">部门地址</th>
                                    <th style="width:10%">电话</th>
                                    <th style="width:20%" class="btns">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="%{#request.olist}" id="list" status="statusid">
                                <tr>
                                    <td><s:property value="%{#statusid.index+1}"/></td>
                                    <td><s:property value="#list.oname" /></td>
                                    <td><s:property value="#list.director" /></td>
                                    <td><s:property value="#list.adress" /></td>
                                    <td><s:property value="#list.phone" /></td>
                                    <td class="btns">
                                    <div class="btn-group center-block">
                                        <button type="button" class="btn btn-info"><a href="http://localhost:8080/organize/organizeAction_organizeLook?oid=${list.oid}"> <span class="glyphicon glyphicon-search"></span> 查看</a></button>
                                        <button type="button" class="btn btn-success"><a href="http://localhost:8080/organize/organizeAction_towardOrganizeUpdate?oid=${list.oid}"><span class="glyphicon glyphicon-ok-circle"></span> 编辑</a></button>
                                        <button type="button" class="btn btn-danger"><a href="http://localhost:8080/organize/organizeAction_OrganizeDelete?oid=${list.oid}"><span class="glyphicon glyphicon-trash"></span> 删除</a></button>
                                    </div>
                                    </td>
                                </tr>
                                </s:iterator>
                                </tbody>
                            </table>
                            <ul class="pagination" id="page" style="float: right">
                                <li><a href="#">&laquo;</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                        </div>
    </div>
    </div>
</div>
<script src="/js/jquery/jquery-1.11.0.min.js"></script>
<script src="/js/bootstrap/bootstrap.min.js"></script>
<script src="/js/background/milkybg.js"></script>
<script src="/js/table/jquery.filtertable.js"></script><!--表格过滤-->
<script src="/js/table/jQuery.print.js"></script><!--打印-->
<script  src="/js/table/clipboard.min.js"></script><!--复制-->
<script src="/js/table/export/xlsx.core.min.js"></script><!--输出表格-->
<script src="/js/table/export/blob.js"></script><!--输出表格-->
<script src="/js/table/export/FileSaver.min.js"></script><!--输出表格-->
<script src="/js/table/export/tableexport.min.js"></script><!--输出表格-->
<script type="text/javascript">
//        显示隐藏列
    var $table=$('table');
    function showOrhidden(index){
        $('table tr').find('th:eq('+index+')').toggle();
        $('table tr').find('td:eq('+index+')').toggle();
    }
    $('input:checkbox').on('click',function () {
        index=$(this).parents("li").index();
        showOrhidden(index);
    })


//        <!--表格过滤-->
    $('table').filterTable({
        inputSelector: '#searbtn-input',
        minRows:1
    });
//    <!--输出表格-->
    $(function(){
        $("table").tableExport({
            headings: true,
            footers: true,
            formats: [ "xlsx","xls","csv","txt"],
            fileName: "部门单位管理表",
            bootstrap: true,
            position: "bottom",
            ignoreRows: null,
            ignoreCols: null});
//        <!--打印-->
        $('.print').on('click',function () {
            $("table").print({
                globalStyles: false,
                iframe:false,
                noPrintSelector: "caption,.btns",
                stylesheet:"css/bootstrap/bootstrap.min.css"
            });
        })
//         <!--复制-->
        var clipboard = new Clipboard('.copy');
        clipboard.on('success', function(e) {
            alert("文字已复制到剪贴板中");
        });
        clipboard.on('error', function(e) {
        });
    })
</script>
</body>
</html>