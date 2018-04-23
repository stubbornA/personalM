<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>index</title>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/metisMenu/metisMenu.css">
    <link rel="stylesheet" href="/css/sideMenu.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/optiscroll.css">
    <link rel="stylesheet" href="/css/jquery.popuplayer.min.css"><!--主题控制-->
    <link rel="stylesheet" href="/css/iziToast.min.css"> <!--消息框-->
    <style>
        body{
            /*width: 80%;*/
            /*margin: 0 auto;*/
            background: #000000;
        }
        #bg{
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

    </style>
</head>
<body>
<div id="bg"></div>
<!--header-->
<div class="navbar sparkley" role="navigation" id="header">
    <div id="logo" class="">
        <a href="">
            <img src="/img/title.png " class="img-responsive" alt=""></a>
    </div>
    <nav id="topmenu">
        <div class="container-fluid">
            <div class="nav-header">
                <button type="button" class="navbar-toggle"  data-toggle="collapse" data-target="#topmenumain">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!--<a class="navbar-brand" href="#">菜鸟教程</a>-->
            </div>
        </div>
        <div class=" collapse navbar-collapse" id="topmenumain">
            <ul class=" nav navbar-nav navbar-right" >
                <li class="hidemenu"><a href="javascript:void(0)"><span class="glyphicon glyphicon-align-justify "></span></a></li>
                <li class="user"><a href="javascript:void(0)"><span class="glyphicon glyphicon-user icon-white"></span></a></li>
                <li id="search"><a href="#" ><span class="glyphicon glyphicon-search "></span></a></li>
                <li id="fullscreen"><a href="#" ><span class="glyphicon glyphicon-resize-full "></span></a></li>
                <li><a href="http://localhost:8080/account/AccountAction_loginOut" ><span class="glyphicon glyphicon-log-out "></span></a></li>
                <li id="msg" >
                    <a href="#"  data-container="body" data-toggle="popover" data-placement="bottom"
                       data-content="右侧的 Popover 中的一些内容" data-animation="true">
                        <span class="glyphicon glyphicon-bell "></span>
                        <span class="label label-danger " style="position:absolute;top:2px;left: 22px;display:inline-block;">3</span>
                    </a>
                </li>
                <li id="themecontrol"><a href="#" ><span class="glyphicon glyphicon-book "></span></a></li>
            </ul>
            <div id="topsearch" class="nav navbar-nav navbar-right">
                <div class="input-group">
                    <input type="text" class="form-control">
                    <span class="input-group-btn">
                        <button class="btn btn-info" type="button"><span class="glyphicon glyphicon-search "></span></button>
                    </span>
                </div>
            </div>
        </div>
    </nav>
</div>
       <ul class="list-group msglist">
            <li class="list-group-item"><a href=""><span class="glyphicon glyphicon-folder-open"></span>
                 <span> 新事件 </span> <small>2个新事件</small>
                 </a><span class="badge  right">新</span></li>
            <li class="list-group-item"><a href=""><span class="glyphicon glyphicon-envelope"></span>
                <span> 新邮件 </span> <small>您有10封信</small>
                </a><span class="badge right">新</span></li>
            <li class="list-group-item"><a href=""><span class="glyphicon glyphicon-tasks"></span>
                <span>当前任务 </span> <small>11条工作需要处理</small></a></li>
            <li class="list-group-item"><a href="msg_center.jsp" target="show">更多提醒</a><span class="label label-danger" style="float: right">14</span></li>
       </ul>
<!--<button class="send " style="position: fixed;right: 300px;">dgsd</button>                                     &lt;!&ndash;main&ndash;&gt;-->
<div id="main" class="container" >
    <!--sider-->
    <div id="sider">
        <aside class="sidebar">
            <div class="infor">
                     <div class="pic center-block">
                         <img src="/img/pic.png" class="img-responsive img-circle" alt="">
                     </div>
                     <div class="">
                         <h4 class="text-center">您好，${account.username}</h4>
                         <h5 class="text-center" style="color: #f5f5f5">${account.rname}</h5>
                     </div>
                <ul class="nav" >
                    <li class="sparkley"><a href="http://localhost:8080/account/AccountAction_getAccount" target="show">个人账户</a></li>
                    <li class="sparkley"><a href="http://localhost:8080/account/AccountAction_getAccountInfor" target="show">个人信息</a></li>
                </ul>
            </div>
            <div id="servicenav" class="optiscroll" >
                 <nav class="sidebar-nav sidemenu1">
                     <ul id="menu" class="metismenu menu" class="" style="height: 0px;" aria-expanded="true">
                         <%--<s:if test="%{account.rid==1}">--%>
                         <f:if test="${account.rid==1}">
                         <li class=""><a href="" aria-expanded="true" ><span class="glyphicon glyphicon-list-alt"></span> 部门
                             <i class="icon-chevron-right" style="float: right"></i> </a>
                             <ul class="" style="height: 0px;" aria-expanded="true">
                                 <li><a href="http://localhost:8080/organize/organizeAction_organizeList" target="show">部门管理</a></li>
                                 <li><a href="http://localhost:8080/organize/organizeAction_towardOrganizeAdd" target="show">部门新增</a></li>
                                 <!--<li><a href="page3.html" target="show">item 0.3</a></li>-->
                             </ul>
                         </li>
                         <li class=""><a href="" aria-expanded="true" ><span class="glyphicon glyphicon-star-empty"></span> 角色
                             <i class="icon-chevron-right" style="float: right"></i> </a>
                             <ul class="" style="height: 0px;" aria-expanded="true">
                                 <li><a href="http://localhost:8080/role/roleAction_roleList" target="show">角色管理</a></li>
                                 <li><a href="http://localhost:8080/role/roleAction_towardRoleAdd" target="show">角色新增</a></li>
                             </ul>
                         </li>
                         <li class=""><a href="#" aria-expanded="false" ><span class="glyphicon glyphicon-user"></span> 人员
                             <i class="icon-chevron-right" style="float: right"></i> </a>
                             <ul class="" style="height: 0px;" aria-expanded="true">
                                 <li><a href="http://localhost:8080/account/AccountAction_towardAccountList" target="show">人员管理</a></li>
                             </ul>
                         </li>
                         </f:if>
                         <%--</s:if>--%>
                         <li class=""><a href="#" aria-expanded="false" ><span class="glyphicon glyphicon-envelope"></span> 公告信息
                             <i class="icon-chevron-right" style="float: right"></i></a>
                             <ul class="" style="height: 0px;" aria-expanded="true">
                                 <li><a href="http://localhost:8080/message/messageAction_messageList" target="show">公告信息列表</a></li>
                                 <li><a href="http://localhost:8080/message/messageAction_towardMessageSend" target="show">信息发布</a></li>
                             </ul>
                         </li>
                         <li class=""><a href="#" aria-expanded="false" ><span class="glyphicon glyphicon-heart"></span> 其他
                             <i class="icon-chevron-right" style="float: right"></i></a>
                             <ul class="" style="height: 0px;" aria-expanded="true">
                                 <li><a href="#">item 5.1</a></li>
                                 <li><a href="#" aria-expanded="false">item 5.2 <i class="icon-chevron-right" style="float: right"></i></a>
                                     <ul class="" style="height: 0px;" aria-expanded="true">
                                         <li><a href="#">item 5.2.1</a></li>
                                         <li><a href="#">item 5.2.2</a></li>
                                         <li><a href="#">item 5.2.3</a></li>
                                         <li><a href="#">item 5.2.4</a></li>
                                     </ul>
                                 </li>
                                 <li><a href="#">item 5.3</a></li>
                                 <li><a href="#">item 5.4</a></li>
                             </ul>
                         </li>
                     </ul>

                 </nav>
            </div>
            <!--<a href="manageAudit.jsp" target="show">点击进入注册管理</a> <br>-->
        </aside>
    </div>
    <div id="content">
        <iframe src="http://localhost:8080/account/AccountAction_getAccount" id="contentiframe" name="show" width="100%"></iframe>
    </div>
  <div id="theme" >
      <h2 class="text-center" >设置</h2>
      <div class="themecolor">
          <h3 class="text-muted">主题</h3>
          <ul>
              <li onclick="changeBgColor(128,42,42)" style="background: rgb(128,42,42)"> 宝石红 </li>
              <li onclick="changeBgColor(0,51,17)" style="background: rgb(0,51,17)">暗绿色</li>
              <li onclick="changeBgColor(8,46,84)" style="background: rgb(8,46,84)">深蓝色</li>
              <li onclick="changeBgColor(5,5,14)" style="background: rgb(5,5,14)">默认色</li>
          </ul>
      </div>

  </div>

</div>
<script src="/js/jquery/jquery-2.1.1.min.js"></script>
<script src="/js/bootstrap/bootstrap.min.js"></script>
<script src="/js/jquery/jquery.cookie.js"></script>
<script src="/js/jquery/jquery.optiscroll.js"></script> <!--滚动条样式-->
<script src="/js/background/bling.js"></script>
<script src="/js/metisMenu/metisMenu.min.js"></script> <!--侧边菜单样式-->
<script src="/js/menu_data.js"></script><!--动态菜单数据-->
<script src="/js/index.js"></script>
<script src="/js/background/starbg.js"></script><!--星空点缀背景-->
<script>
    changeBgColor(5,5,14);
    function changeBgColor(r,g,b) {
        settings = {
            width: 800,
            height:800,
            autoResize: true,
            autoResizeMinWidth: 5,
            autoResizeMaxWidth: null,
            autoResizeMinHeight: null,
            autoResizeMaxHeight: null,
            addMouseControls: true,
            addTouchControls: true,
            hideContextMenu: true,
            starCount: 6666,
            starBgCount: 2222,
            starBgColor: { r:0, g:204, b:255 },
            starBgColorRangeMin: 20,
            starBgColorRangeMax: 80,
            starColor: { r:0, g:204, b:255 },
            starColorRangeMin: 50,
            starColorRangeMax: 100,
            starfieldBackgroundColor: {r:r,g:g,b:b},
            starDirection: 1,
            starSpeed: 20,
            starSpeedMax: 200,
            starSpeedAnimationDuration: 2,
            starFov: 300,
            starFovMin: 200,
            starFovAnimationDuration: 2,
            starRotationPermission: true,
            starRotationDirection: 1,
            starRotationSpeed: 0.0,
            starRotationSpeedMax: 1.0,
            starRotationAnimationDuration: 2,
            starWarpLineLength: 2.0,
            starWarpTunnelDiameter: 100,
            starFollowMouseSensitivity: 0.025,
            starFollowMouseXAxis: true,
            starFollowMouseYAxis: true
        };
        $('#bg>canvas').remove();
        WarpDrive(document.getElementById('bg'),settings);
    }
</script>
<script>
    if($.cookie('lock')=='lock'){
        lockscreen();
    }else{
        unlockscreen();
    }
    //控制全屏
    function enterfullscreen() {//进入全屏
        var docElm = document.documentElement;
//W3C
        if (docElm.requestFullscreen) {
            docElm.requestFullscreen();
        }
//FireFox
        else if (docElm.mozRequestFullScreen) {
            docElm.mozRequestFullScreen();
        }
//Chrome等
        else if (docElm.webkitRequestFullScreen) {
            docElm.webkitRequestFullScreen();
        }
//IE11
        else if (elem.msRequestFullscreen) {
            elem.msRequestFullscreen();
        }
    }
    function exitfullscreen() { //退出全屏
        if (document.exitFullscreen) {
            document.exitFullscreen();
        }
        else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        }
        else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        }
        else if (document.msExitFullscreen) {
            document.msExitFullscreen();
        }
    }
    var a=0;
    $('#fullscreen').on('click',function () {
        a++;
        a%2==1?enterfullscreen():exitfullscreen();
    })

//    //获取模块菜单
//    var str="";
//    function getMenu(data) {
//        str+="<ul class='metismenu' style='height: 0px;' aria-expanded='true'>";
//        $(data).each(function (index) {
//            var turn= data[index].target=="#"? "javascript:void(0)":data[index].target+".html";
//            str+="<li class=''><a href='"+turn+"' aria-expanded='true' target='show'>"
//                    +data[index].name
//                    +"</a>";
//            if(data[index].child!=null){
//                getMenu(data[index].child);
//            }
//            str+="</li>";
//        })
//        str+="</ul>";
//        return str;
//    }
//    $('#sider')
//    $.ajax({
//        url:"",
//        type:"post",
//        data:"",
//        contentType:"",
//        dataType:"",
//        success:function (data) {
//            var rs=getMenu(data);
//            $(".sidemenu2").append(rs);
//            $(".sidemenu1").append(rs);
//            $(".sidebar-nav>ul").addClass("menu");
//        }
//    })
//    var rs=getMenu(menu);
//    $(".sidemenu2").append(rs);
//    $(".sidemenu1").append(rs);
    $(".sidebar-nav>ul").addClass("menu");
    $('#sider .menu').metisMenu({
            toggle: false
        });
    //修改菜单栏滚动条样式
    var m1 = new Optiscroll(document.getElementById('servicenav'),
            { forceScrollbars: false });
    var m2=new Optiscroll(document.getElementById('functionnav'),
            { forceScrollbars: false
            })
</script>
<script src="/js/jquery.popuplayer.min.js"></script><!--主题控制弹出层-->
<script type="text/javascript">
    //主题控制弹出层
    $('#themecontrol').PopupLayer({
                content: "#theme", // 内容，可以传入纯文本或类名或html
                target: "body", // 把弹出层添加到的目标节点
                to: "left",   // 向哪个方向展开
                screenRatio: 0.2, // 占屏幕百分比
                heightOrWidth: 300, // 当且仅当screenRatio为0时生效
                blur: true, // 是否开启毛玻璃效果
                speed: 100,  // 动画速度
                color: "#000", // 文本颜色
                backgroundColor: "#fff", // 背景颜色
                contentToggle: false, // 点击content是否关闭弹出层
                closeBtn: null,  // 指定关闭按钮
                openCallback: null, // 展开的回调
                closeCallback: null // 关闭的回调
    })
</script>
</body>
</html>
