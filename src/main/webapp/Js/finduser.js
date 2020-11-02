
    function getuser(){
    var user=null;
        $.ajax({
            url:'login/finduser',
            type:'get',
            dataType:'json',
            async:false,
            success:function (user1) {
                user=user1;
            }
        })
        return user;

    }

    function getworker(){
    var worker=null;
        $.ajax({
            url:'login/findworker',
            type:'get',
            dataType:'json',
            async:false,
            success:function (worker1) {
              worker=worker1;
            }
        })
        return worker;
    }
/*获取url中的参数*/
    function getnum(qs) {
        var s=location.href;
        s=s.replace("?","?&").split("&");
        var re="";
        for (i=1;i<s.length;i++){
            if(s[i].indexOf(qs+"=")==0){
                re=s[i].replace(qs+"=","");
            }
        }
        return re;
    }

    /*获取数据库中的工种表*/
    function getworkertype(){
        var typelist=null;
        $.ajax({
            url:'admin/typelist',
            type:'get',
            dataType:'json',
            async:false,
            success:function (list) {
                typelist=list;
                console.log("111"+typelist);
                return typelist;
            }
        })
        return typelist;
    }

