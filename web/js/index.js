// /**
//  * Created by fangjiejie on 2017/8/8.
//  */
//点击个人信息
$('#header .user').on('click',function () {
    $('#sider .infor').slideToggle('slow',function () {
    })
})
$('#header .lockscreen').on('click',function () {
    lockscreen();
})
function lockscreen() {
    $('#bg').css("z-index","2");
    $('#lock').addClass('show');
    $.cookie('lock','lock');
}
function unlockscreen() {
    $('#bg').css("z-index","-1");
    $('#lock').removeClass('show');
    $.cookie('lock','unlock');
}
$('#lock .unlock .switch-box').on('click',function () {
    if($('.switch-box-input').val()=="on"){
        alert("checked=on");
        $.ajax
    }
})
//点击收缩菜单
$('#header .hidemenu').on('click',function () {
    $('#sider').toggle('slow',function () {
    })
})
//点击消息提示
$('#msg').on('click',function () {
    var mpos=$(this).position();
    $('.msglist').css({
        left:mpos.left-$(this).width()*3.5,
        top:mpos.top+50
    }).addClass('show').toggleClass('turn');
})
//点击出现搜索栏
$('#search').on('click',function () {
    
    $('#topsearch').toggle('slow',function () {
        $(this).css({
            height:50
        })
    })
})

