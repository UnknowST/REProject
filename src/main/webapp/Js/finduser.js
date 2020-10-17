
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


