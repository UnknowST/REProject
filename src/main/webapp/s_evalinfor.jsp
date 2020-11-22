
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>eval_infor</title>
    <script src="${pageContext.request.contextPath}/Js/jquery-1.11.0.min.js"></script>
    <script>

    </script>
</head>


<body>
<!--修改-->
<div id="div2" align="center">

    <p><a id="id1" href="${pageContext.request.contextPath}/user/allinfor?userid=${userid}&p=1">全部维修单</a>&nbsp;&nbsp;&nbsp;
        <a id="id2" href="${pageContext.request.contextPath}/user/infor_dai?userid=${userid}&p=1">待分配</a>&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/user/infor_wait?userid=${userid}&p=1">待维修</a>&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/user/infor_ing?userid=${userid}&p=1">正在维修</a>&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/user/infor_eval?userid=${userid}&p=1">维修完成待确认</a>&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/user/infor_ok?userid=${userid}&p=1">已确认完成</a>
    </p>
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
            <th>地点</th>
            <th>设备</th>
            <th>详细信息</th>
            <th>图片说明</th>
            <th>状态</th>
            <th>填报时间</th>
            <th>操作</th>
            <% int i=0;%>
            <c:forEach items="${page.list }" var="infor">
                <tr>
                    <td>${i=i+1}</td>
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
                    <td><a href="${pageContext.request.contextPath}/user/infor_num?num=${infor.num}">详细查看</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a onclick='show("${infor.num}","${infor.workerid}")' href="javascript:void(0)" >确认完成</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/user/infor_eval?userid=${page.list[0].userid}&p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
        <a href="${pageContext.request.contextPath}/user/infor_eval?userid=${page.list[0].userid}&p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
        <a href="${pageContext.request.contextPath}/user/infor_eval?userid=${page.list[0].userid}&p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/user/infor_eval?userid=${page.list[0].userid}&p=${page.lastPage}">最后页</a>
    </c:if>
</div    >

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/popup.css" />  <!--//引入css-->
<script>
    function show(num,workerid) {

        document.getElementById('all_light').style.display = 'block';
        document.getElementById('contes').style.display = 'block';

        $("#btn1").click(function () {
            $.ajax({
                url:'${pageContext.request.contextPath}/user/eval',
                data:{fenshu:$("#startP").val(),"comment":$("#comment").val(),num:num,workerid:workerid},
                dataType:'json',
                async:false,
                method:'post',
                success:function (message) {
                    if(message.flag==1) {
                        alert(message.message);
                        window.history.go(0);
                    }else alert(message.message);
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
<div4 id="contes" style="">

    <div5 style="width:500px;height:40px;">

        <p align="centre">确认维修完成</p>
        <hr>

        <style>
            *{
                margin:0;
                padding:0;
            }
            .starts{
                padding-left: 10%;
                padding-top:80px;
            }
            .starts ul{
                float:left;
            }
            .starts ul li{
                list-style: none;
                width:32px;
                height:21px;
                float:left;
                background:url(${pageContext.request.contextPath}/img/stark2.png) no-repeat ;

            }
            .starts ul li.on{
                background:url(${pageContext.request.contextPath}/img/stars2.png) no-repeat;
            }
            .starts ul span{
                display:inline;
                float:left;
                padding-left:10px;
                height:21px;
                line-height:21px;
            }
        </style>




        <div class="starts">
            <p style="font-size: medium">请为本次维修打分</p>
            <ul id = "pingStar">
                <li rel = "1" title = "给1分"></li>
                <li rel = "2" title = "给2分"></li>
                <li rel = "3" title = "给3分"></li>
                <li rel = "4" title = "给4分"></li>
                <li rel = "5" title = "给5分"></li>
                <li rel = "6" title = "给6分"></li>
                <li rel = "7" title = "给7分"></li>
                <li rel = "8" title = "给8分"></li>
                <li rel = "9" title = "给9分"></li>
                <li rel = "10" title = "给10分"></li>
                <span id="dir"></span>
            </ul>
            <input type="hidden" value="" id = "startP" />
        </div>

        <br ><lable style="padding-left: 10%;padding-top: 120%">评价：</lable></br>
        <textarea id="comment" style="padding-left: 10%"></textarea>
        <br>
        <input type="button" value="确认完成" id="btn1" style="padding-left: 10%">
        <input type="button" value="返回" id="btn2" onclick="close1()" style="padding-left: 50%">

        <script>
            window.onload = function(){
                var s = document.getElementById("pingStar");
                m = document.getElementById("dir"),
                    n = s.getElementsByTagName("li"),
                    input = document.getElementById("startP");//保存所选值
                clearAll = function(){
                    for(var i = 0;i < n.length;i++){
                        n[i].className = "";
                    }
                }
                for(var i = 0;i < n.length;i++){
                    n[i].onclick = function(){
                        var q = this.getAttribute("rel");
                        clearAll();
                        input.value = q;
                        for(var i = 0;i < q;i++){
                            n[i].className = "on";
                        }
                        m.innerHTML = this.getAttribute("title");
                    }
                    n[i].onmouseover = function(){
                        var q = this.getAttribute("rel");

                        clearAll();
                        for(var i = 0;i < q;i++){
                            n[i].className = "on";
                        }
                        m.innerHTML = this.getAttribute("title");
                    }
                    n[i].onmouseout = function(){
                        clearAll();
                        for(var i = 0;i < input.value;i++){
                            n[i].className = "on";
                        }


                    }
                }




            }

        </script>

    </div5>

</div4>
<div6 id="all_light">
</div6>
</body>
</html>
