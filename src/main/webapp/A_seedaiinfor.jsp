
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%--查看待分配的维修记录--%>

    <script src="${pageContext.request.contextPath}/Js/jquery-3.3.1.js"></script>

</head>
<body>

<!--修改-->
<div id="div2" align="center">

    <p>
        <a href="${pageContext.request.contextPath}/admin/daiinfor?p=1">待分配</a>&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/admin/waitinfor?p=1">待维修</a>&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/admin/inginfor?p=1">正在维修</a>&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/admin/succinfor?p=1">已维修</a>&nbsp;&nbsp;&nbsp;


</div>
<%--全部维修单--%>
<div align="center"  id="div1">
    <c:if test="${message.flag==0}">
        <p>${message.message}</p>
    </c:if>
    <c:if test="${message.flag==1}">
        <table border="1" cellspacing="0">
            <caption>全部维修单列表</caption>
            <tbody>
            <th>序号</th>
            <th>申报人账号</th>
            <th>地点</th>
            <th>设备</th>
            <th>详细信息</th>
            <th>图片说明</th>
            <th>状态</th>
            <th>填报时间</th>
            <th>操作</th>
            <% int i=0;%>
            <c:forEach items="${page.list }" var="infor" varStatus="list">
                <tr>
                    <td>${i=i+1}</td>
                    <td>${infor.userid }</td>
                    <td>${infor.place }</td>
                    <td>${infor.equip }</td>
                    <td>${infor.detail }</td>
                    <c:if test="${infor.imagepaths.size()==0}">
                        <td>该用户没有上传图片说明...</td>
                    </c:if>
                    <c:if test="${infor.imagepaths.size()!=0}">
                        <td><img src="${infor.imagepaths.get(0) }" width="100px" height="120px" alt="诶呀！图片不小心走丢了..." ></td>
                    </c:if>
                    <td>${infor.state }</td>
                    <td> <fmt:formatDate type="both"
                                         dateStyle="long" timeStyle="long"
                                         value="${infor.createdate}" /></td>

                    <td>
                        <a href="javascript:void(0)" onclick="xianshi('${infor.num}')" >分配</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0)" onclick="backinfor('${infor.num}')">退回</a>&nbsp;&nbsp;
                        <a onclick="state('${infor.num}')" href="javascript:void(0)" >删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <p>一共${page.pages}页;当前是${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/admin/daiinfor?p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
            <a href="${pageContext.request.contextPath}/admin/daiinfor?p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
            <a href="${pageContext.request.contextPath}/admin/daiinfor?p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/admin/daiinfor?p=${page.lastPage}">最后页</a>
    </c:if>
</div    >

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/popup.css" />  <!--//引入css-->

<script>
    function backinfor(num){

        var st=prompt("退回原因：");
        if(st){
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/backinfor',
                dataType:'json',
                type:'get',
                async:false,
                data:{num:num,ad_replay:st},
                success:function(message){
                    if(message.flag==1){
                        alert(message.message);
                        window.history.go(0);
                    }else alert(message.message);
                }
            })
        }
    }

    $(function () {
        //获取所有的工人种类
        var typelist=null;
        $.ajax({
            url:'${pageContext.request.contextPath}/admin/typelist',
            type:'get',
            dataType:'json',
            async:false,
            success:function (list) {
                typelist=list;
            }
        })

        var tou1='<select id="type"> <option id="-1">---请选择---</option>'
        var wei1='</select>';
        var d1=" ";
        var tou2='<select id="workerid"><option id="-1">---请选择---</option>'
        var wei2='</select>';
        var d2=" ";
        $("#td2").html(tou2+d2+wei2);
        for(var i=0;i<typelist.length;i++){
            d1+='<option value="'+typelist[i].num+'">'+typelist[i].type+'</option>'
        }
        $("#div3").html(tou1+d1+wei1);
        $("#type").change(function () {
            var type=$("#type option:selected").val();
            //
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/listworker',
                type:'GET',
                dataType:'json',
                async:false,
                success:function (workerlist) {

                    var tou2='<select id="workerid"><option id="-1">---请选择---</option>'
                    var wei2='</select>';
                    var d2=" ";
                    $("#td2").html(tou2+d2+wei2);
                    //生成第一组数据
                    for(var i=0;i<workerlist.length;i++){

                        if(workerlist[i].type_worker==type){
                            d2+='<option id="'+workerlist[i].num+'">'+workerlist[i].userid+'</option>'
                        }
                    }
                    if(d2==" ") d2='<option>--当前没有该类型的工人-- </option>'
                    $("#td2").html(tou2+d2+wei2);
                    //监听账号选择
                    $("#workerid").change(function () {
                        //获取账号
                        var workerid=$("#workerid option:selected").text();

                        //获取工人现在待维修的订单数
                        $.ajax({
                            url:'${pageContext.request.contextPath}/admin/suminfor',
                            type:'get',
                            data:{"workerid":workerid},
                            dataType:'json',
                            async:'false',
                            success:function (num) {

                                $("#td3").html("当前该工人账号下有"+num+"个待维修的维修单");
                            }
                        })
                    })

                }
            })

        })
        //获取 对应工人的账号
        //对应账号下面对应的待维修订单数量
    })
    /*确认分配对应函数*/

    /*删除对应函数*/
    function state(num) {
        $.ajax({
            url:'${pageContext.request.contextPath}/user/delete_infor?num='+num,
            type: "post",
            dataType: 'json',
            async:false,
            success:function (message) {
                console.log(message)
                if(message.flag==1) {
                    alert(message.message);
                    window.history.go(0); //刷新
                }
                else{
                    alert(message.message);
                }
            }
        })
    }
</script>
<script>

    function xianshi(num1) {

        document.getElementById('all_light').style.display = 'block';
        document.getElementById('contes').style.display = 'block';
        $("#atn2").click(function () {

            $.ajax({
                url:"${pageContext.request.contextPath}/admin/uiworker",
                type:"post",
                data:{"num":num1,"workerid":$("#workerid option:selected").val()},
                dataType:"json",
                async: false,
                success:function (message) {
                    if(message.flag==1) {
                        alert(message.message);
                        window.history.go(0);  //刷新
                    }else {
                        alert(message.message);
                    }
                }
            })
        })
    }


    function close1()

    {
        document.getElementById('all_light').style.display = 'none';
        document.getElementById('contes').style.display = 'none';
    }
</script>
<div4 id="contes" style="" align="center">

    <div5 style="width:500px;height:40px;">

        <p align="centre">详细信息</p>
        <hr>


        <form id="dai" >
            <table cellspacing="0" border="0" id="tb1" style="display: block" align="center">
                <tr>
                    <td>选择工种:</td>
                    <td id="div3"></td>
                </tr>
                <tr>
                    <td>选择工人账号:</td>
                    <td id="td2"></td>
                </tr>
                <tr>
                    <td>当前工人的待维修数量</td>
                    <td id="td3"></td>
                </tr>
                <tr>
                    <td align="center"><a id="atn2" href="javascript:void(0)" >确认分配</a></td>
                    <td align="center"><a href="javascript:void(0)" onclick="close1()">返回</a></td>
                </tr>
            </table>
        </form>

    </div5>

</div4>
<div6 id="all_light">
</div6>
</body>
</html>
