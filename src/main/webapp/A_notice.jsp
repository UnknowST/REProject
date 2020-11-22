
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>notice</title>
    <script src="${pageContext.request.contextPath}/Js/jquery-1.11.0.min.js"></script>
    <style>
        td{
            word-wrap:break-word;
            word-break:break-all;
        }
    </style>
    <script>
        function deletenotice(num) {
            var q=confirm("确认要删除该公告吗？");
            if(q){
                $.ajax({
                    url:'${pageContext.request.contextPath}/admin/deletenotice',
                    dataType:'json',
                    data:{num:num},
                    async:false,
                    type:'post',
                    success:function (message) {
                        if(message.flag==1){
                            alert(message.message);
                            window.history.go(0);
                        }else {
                            alert(message.message);
                        }
                    }
                })}
        }

    </script>

</head>
<body>
<div align="center">
    <c:if test="${message.flag==0}">
        <p align="center">${message.message}</p>
        <p align="center"><a href="javascript:coud(0)" onclick="xianshi2()">添加公告记录</a></p>
    </c:if>
    <c:if test="${message.flag==1}">


        <table border="1" cellspacing="0">
            <caption>公告栏记录表</caption>
            <th>序号</th>
            <th>内容</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>创建时间</th>
            <th>操作</th>
            <% int i = 0;%>
            <c:forEach items="${page.list}" var="notice">
                <tr>
                    <td>${i=i+1}</td>
                    <td >${notice.news}</td>
                    <td><fmt:formatDate type="both"
                                        dateStyle="long" timeStyle="long"
                                        value="${notice.startime}"/>
                    </td>
                    <td><fmt:formatDate type="both"
                                        dateStyle="long" timeStyle="long"
                                        value="${notice.endtime}"/>
                    </td>
                    <td><fmt:formatDate type="both"
                                        dateStyle="long" timeStyle="long"
                                        value="${notice.createdate}"/>
                    </td>
                    <td>
                        <a href="javascript:void(0)" onclick="xianshi('${notice.num}')">修改内容</a>
                        <a href="javascript:void(0)" onclick="deletenotice('${notice.num}')"> 删除</a>
                    </td>

                </tr>
            </c:forEach>
        </table>

        <p align="center"><a href="javascript:coud(0)" onclick="xianshi2()">添加公告记录</a></p>
        <p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/admin/noticelist?p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
            <a href="${pageContext.request.contextPath}/admin/noticelist?p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
            <a href="${pageContext.request.contextPath}/admin/noticelist?p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/admin/noticelist?p=${page.lastPage}">最后页</a>
    </c:if>
</div>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/popup.css"/>  <!--//引入css-->
<script>

    function xianshi(num) {
        document.getElementById('all_light').style.display = 'block';
        document.getElementById('contes').style.display = 'block';

        <c:forEach items="${page.list}" var="notice">
        if("${notice.num}"==num){
            $("#news").val("${notice.news}");

           // var startime=Date.parse("${notice.startime}",'yyyy-MM-ddTHH:mm:ss');

          /* console.log("<fmt:formatDate value="${notice.endtime}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>");*/
            $("#startime").val("<fmt:formatDate value="${notice.startime}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>");
            $("#endtime").val("<fmt:formatDate value="${notice.endtime}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>")
        }
        </c:forEach>
        $("#btn2").click(function () {


            $.ajax({
                url: '${pageContext.request.contextPath}/admin/updatenotice',
                dataType: 'json',
                type: 'post',
                data: {
                    num:num,
                    news: $("#news").val(),
                    startime: $("#startime").val(),
                    endtime: $("#endtime").val()
                },
                async: false,
                success: function (message) {
                   if(message.flag==1){
                       alert(message.message);
                       window.history.go(0);
                   }else   alert(message.message);
                }
            })
        })

        }





    function close1() {
        document.getElementById('all_light').style.display = 'none';
        document.getElementById('contes').style.display = 'none';
    }

    function xianshi2() {
        document.getElementById('all_light1').style.display = 'block';
        document.getElementById('contes1').style.display = 'block';
        var timestamp = Date.parse(new Date());
        <jsp:useBean id="now" class="java.util.Date" scope="page"/>
        $("#startime1").val("<fmt:formatDate value="${now}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>");
        $("#endtime1").val("<fmt:formatDate value="${now}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>")


        $("#btn21").click(function () {
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/insertnotice',
                dataType: 'json',
                type: 'post',
                data:{
                         news: $("#news1").val(), startime:
                        $("#startime1").val(), endtime:
                        $("#endtime1").val()
                },
                async: false,
                success:function (message) {
                    if(message.flag==1){
                        alert(message.message);
                        window.history.go(0);
                    }else   alert(message.message);
                }
            })
        })
    }

    function close2() {
        document.getElementById('all_light1').style.display = 'none';
        document.getElementById('contes1').style.display = 'none';
    }
</script>
<div4 id="contes" style="">

    <div5 style="width:500px;height:40px;">

        <p align="centre">修改公告信息</p>
        <hr>
        <table>

            <tr>
                <td>内容:</td>
                <td><textarea id="news" style="width: 200px;height: 150px;font-size: 16px"></textarea></td>
            </tr>
            <tr>
                <td>开始时间:</td>
                <td><input type="datetime-local" id="startime"></td>
            </tr>
            <tr>
                <td>结束时间</td>
                <td><input type="datetime-local" id="endtime"></td>
            </tr>
            <tr>
                <td><input type="button" value="返回" id="btn1" onclick="close1()"></td>
                <td><input type="button" value="提交" id="btn2"></td>
            </tr>


        </table>


    </div5>

</div4>
<div6 id="all_light">
</div6>


<div4 id="contes1" style="">

    <div5 style="width:500px;height:40px;">

        <p align="centre">添加记录</p>
        <hr>

        <table>
            <tr>
                <td>内容:</td>
                <td><textarea id="news1" style="width: 200px;height: 150px;font-size: 16px"></textarea></td>
            </tr>
            <tr>
                <td>开始时间:</td>
                <td><input type="datetime-local" id="startime1"></td>
            </tr>
            <tr>
                <td>结束时间</td>
                <td><input type="datetime-local" id="endtime1"></td>
            </tr>
            <tr>
                <td><input type="button" value="返回" id="btn11" onclick="close2()"></td>
                <td><input type="button" value="提交" id="btn21"></td>
            </tr>


        </table>


    </div5>

</div4>
<div6 id="all_light1">
</div6>
</body>
</html>
