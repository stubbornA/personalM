<%--
  Created by IntelliJ IDEA.
  User: fangjiejie
  Date: 2018/4/18
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理审核注册</title>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/optiscroll.css">
    <style>
        body{
            /*padding: 15px;*/
            /*background: rgb(229, 243, 233);*/
        }
        .show{
            display: block;
        }
        .hide{
            display: none;
        }
        /*body{*/
        /*padding: 80px;*/
        /*}*/



        #presentAudit{
            margin-top: 20px;
            border: solid 4px #539a4a;
            box-shadow: 0px 0px 10px 6px #539a4a;
            border-radius: 20px;
            padding: 20px;
            background: #539a4a;
            color: #ffffff;
            opacity: 0.8;
            font-size: 20px;
        }
        #presentAudit .operate{
            padding-bottom: 20px;
        }
        #presentAudit .operate .btns{
            margin: 50px auto;
            /*display: none;*/
        }

        #manage{
            border: solid 4px  #ec971f;
            box-shadow: 0px 0px 10px 6px  #ec971f;
            border-radius: 20px;
            padding: 10px;
            margin-top: 20px;
            display: none;
            background: #ec971f;
            opacity: 0.8;
            /*background: rgba(236, 151, 31, 0.7);*/
        }
        #manage select{
            margin: 0 auto;
            border-radius: 5px;
            border: solid 1px #539a4a;
            box-shadow: 0px 0px 3px 1px #4e9a49;
            margin-bottom: 3px;
            background: #f7ecb5;
            font-size: 18px;
        }
        #manage .chooserole{
            /*display: none;*/
        }
        #manage .sendmsg{
            /*display: none;*/
        }
        button:hover{
            border: solid 1px #2a9a71;
            box-shadow: 0px 0px 3px 1px #2a9a71;
        }
    </style>
</head>
<body>
<canvas id="canvas" style="position:fixed;z-index:-1;height: 100%;width: 100%;"></canvas>
<div style="height: 100px"></div>
<div class="container" >
    <form action="http://localhost:8080/account/AccountAction_AccountAudit1" class="form-horizontal" role="form">
        <div class="row clearfix" id="presentAudit">
            <h2 class="text-center" style="color: #ffffff">详细信息</h2>
            <div class="col-md-8 column">
                <div  style="font-size: 18px;">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" name="username" >${account==null?"":account.username}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" name="password" >${account==null?"":account.password}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" name="oname" >${account==null?"":account.oname}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门代码</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" name="ocode">${account==null?"":account.ocode}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 column operate" >
                <div class="btns" style="width: 80%;">
                    <button type="button" id="passbtn" class="btn btn-warning btn-default btn-block active">通过并分配角色</button>
                    <button type="button" id="falsebtn" class="btn btn-danger btn-block btn-primary active"><a href="http://localhost:8080/account/AccountAction_AccountAudit2?aid=${account.aid}">不通过</a></button>
                </div>
            </div>
        </div>
        <div class="row clearfix" id="manage">
            <div class="row chooserole">
                <h2 class="text-center" style="color: #ffffff;margin:0 auto">角色分配</h2>
                <div class="roles col-sm-6">
                    <select name="roles" multiple="multiple" class="optiscroll center-block" id="roles" style=" width: 60%;height: 250px">
                       <s:iterator value="%{#request.rlist}" id="list" status="statusid">
                        <option name="rid" value="${list.rid}"> <s:property value="#list.rname"/></option>
                       </s:iterator>
                    </select>
                </div>
                <div class="row">
                    <input type="hidden" name="aid" value="${account==null?-1:account.aid}">
                    <button  type="submit"  class="btn center-block" id="rolesbtn" style="width: 150px;background: #286385;color: #fff">确定</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="/js/jquery/jquery-2.1.1.min.js"></script>
<script src="/js/bootstrap/bootstrap.min.js"></script>
<script src="/js/jquery/jquery.optiscroll.js"></script> <!--滚动条样式-->
<script src="/js/background/milkybg.js"></script>
<script>
    $(function () {
        $('#backbtn').on('click',function () {
            $('#presentAudit').removeClass('show').addClass('hide');
            $('#startbtn').removeClass('hide').addClass('show');
            $('#manage').removeClass('show').addClass('hide');
        })

        $('#passbtn').on('click',function () {
//            $('#btns').toggleClass('hide');
            $('#manage').removeClass('hide').addClass('show');
            $('#manage .chooserole').removeClass('hide').addClass('show');
            $('#manage .sendmsg').removeClass('show').addClass('hide');
        })
//        $('#falsebtn').on('click',function () {
////            $('#manage').removeClass('hide').addClass('show');
////            $('#manage .sendmsg').removeClass('hide').addClass('show');
//            $('#manage .chooserole').removeClass('show').addClass('hide');
//        })

        $('#add').on('click',function () {
            $('#roles option:selected').appendTo('#choosedroles');
        })
        $('#remove').on('click',function () {
            $('#choosedroles option:selected').appendTo('#roles');
        })
        $('#rolesbtn').on('click',function () {
            var list=$('#choosedroles option');
            var idlist=[];
            list.each(function (index) {
                idlist.push(list[index].value);
                console.log(list[index].value)
            })
            console.log(list);
            console.log(idlist);
        })
    })
</script>

</body>
</html>