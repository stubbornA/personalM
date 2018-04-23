/**
 * Created by fangjiejie on 2017/8/10.
 */
$(function () {
    $('.carousel').carousel({
        interval:3000
    })
    var $loginform=$('#loginform');
    $loginform.validate({
        rules:{
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 6,
                maxlength:10
            }
        },
        messages:{
            email: {
                required: "请输入邮箱",
                email: "请输入正确的邮箱地址"
            },
            password: {
                required: "请输入密码",
                minlength: jQuery.format("密码为6~10位")
            }
        },
        errorPlacement: function (error, element) { //指定错误信息位置
                error.insertAfter( element).wrapInner('<span class="errormsg"/>');
        }
    })
    var msgtip=function (state) {
        var str="";
        if(state==-1){
            str="您的账号或密码输入错误,请重新输入"
        }
        else if(state==0){
            str="您申请的账号待审核，请耐心等待..."
        }else if(state==2){
            str="您申请的账号未通过审核，请重新注册"
        }else if(state==1){
            str="登陆正常，等待跳转";
            if($('input[name|="sun"]').is(':checked'))
            {
            $.cookie('email',$('#email').val(),{expires:7});
            $.cookie('password',$('#password').val(),{expires:7})
            }
            window.location="index.jsp";
        }
        iziToast.show({
            color: '#c83c32',//#c93756
            icon: 'icon-contacts',
            title: '提示',
            message:str,
            close:true,
            transitionIn: 'flipInX',
            transitionOut: 'flipOutX',
            pauseOnHover:true,
            target:'.msg',
            timeout:20000,
            progressBar:'true',
            progressBarColor: '#44cef6',
            layout:2,
            position:'bottomRight',
            onClose: function(){
                console.info('onClose');
            }, iconColor: 'rgb(0, 255, 184)'
        });
    }
    $("#submit").on('click',function () {

        // $.ajax({
        //     type:"POST",
        //     url:"",
        //     data:"",
        //     success:function (data) {
        //         var jsondata = eval("("+data+")");
        //         msgtip(parseInt(jsondata));
        //     }
        //
        // })
    })
})
