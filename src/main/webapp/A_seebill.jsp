
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<%--查看所有的用户信息--%>
<head>
    <title>seebill</title>
    <script src="${pageContext.request.contextPath}/Js/jquery-3.3.1.js"></script>
    <script>
        function deletebill(snum) {
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/deletebill',
                data:{"snum":snum},
                dataType:'json',
                async:false,
                success:function(message){
                    if(message.flag==1){
                        alert(message.message);
                        window.history.go(0);
                    }else {
                        alert(message.message)
                    }
                }
            })
        }

        $(function () {
            $("#btn1").click(function () {
                window.location.href='${pageContext.request.contextPath}/admin/searchbills?num='+$("#num").val()+'&place='+$("#place1").val() +
                    '&useing='+$("#useing1").val()+'&workerid='+$("#workerid").val()+'&p=1';
            })
        })
    </script>
</head>
<body>
<div align="center">
    <table align="center" >
        <tr>
            <td>单号:</td>
            <td><input type="text" id="num"></td>
            <td>填写人:</td>
            <td><input type="text" id="workerid"></td>
            <td rowspan="2"> <input type="button" id="btn1" value="搜索" ></td>
        </tr>

        <tr>
            <td>地点:</td>
            <td><input type="text" id="place1"></td>

            <td>用途:</td>
            <td><input type="text" id="useing1"></td>
        </tr>

    </table>
</div>

<div align="center">
    <table border="1" cellspacing="0">
        <caption>报销单列表</caption>
        <tbody>
        <th>序号</th>
        <th>单号</th>
        <th>填写人</th>
        <th>地点</th>
        <th>用途</th>
        <th>金额</th>
        <th>填写时间</th>
  
        <% int i=0;%>
        <c:forEach items="${page.list }" var="bill">
            <tr>
                <td>${i=i+1}</td>
                <td>${bill.num }</td>
                <td>${bill.workerid }</td>
                <td>${bill.place }</td>
                <td>${bill.useing }</td>
                <td>${bill.cost }</td>
                <td> <fmt:formatDate type="both"
                                     dateStyle="long" timeStyle="long"
                                     value="${bill.createdate}" /></td>
                <td><a onclick="deletebill(${bill.snum})" href="javascript:void(0)">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a onclick="xianshi('${bill.snum}','${bill.cost}','${bill.place}','${bill.useing}','${bill.workerid}','${bill.num}')" href="javascript:void(0)">修改</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--查询到的所有信息--%>
    <c:if test="${n==1}">
    <p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

    <a href="${pageContext.request.contextPath}/admin/billlist?p=${page.firstPage}">第一页</a>
    <c:if test="${page.nextPage==0}">
        <a href="javascript:void(0)">下一页</a>
    </c:if>
    <c:if test="${page.nextPage!=0}">
        <a href="${pageContext.request.contextPath}/admin/billlist?p=${page.nextPage}">下一页</a>
    </c:if>
    <c:if test="${page.prePage==0}">
        <a href="javascript:void(0)">上一页</a>
    </c:if>
    <c:if test="${page.prePage!=0}">
        <a href="${pageContext.request.contextPath}/admin/billlist?p=${page.prePage}">上一页</a>
    </c:if>
    <a href="${pageContext.request.contextPath}/admin/billlist?p=${page.lastPage}">最后页</a>
    </c:if>
    <%--搜索到的信息--%>
    <c:if test="${n==2}">
        <p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/admin/searchbills?num=${bill.num}&place=${bill.place}&useing=${bill.useing}
                                                    &workerid=${bill.workerid}&p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
            <a href="${pageContext.request.contextPath}/admin/searchbills?num=${bill.num}&place=${bill.place}&useing=${bill.useing}
                                                    &workerid=${bill.workerid}&p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
            <a href="${pageContext.request.contextPath}/admin/searchbills?num=${bill.num}&place=${bill.place}&useing=${bill.useing}
                                                    &workerid=${bill.workerid}&p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/admin/searchbills?num=${bill.num}&place=${bill.place}&useing=${bill.useing}
                                                    &workerid=${bill.workerid}&p=${page.lastPage}">最后页</a>
    </c:if>
</div>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/popup.css" />  <!--//引入css-->



<script>

    function xianshi(snum,cost,place,useing,workerid,num) {


        $("#td1").html(num);
        $("#td2").html(workerid);
        $("#place").val(place);
        $("#useing").val(useing);
        $("#cost").val(cost);

        document.getElementById('all_light').style.display = 'block';
        document.getElementById('contes').style.display = 'block';

        $("#atn2").click(function () {

            $.ajax({
                url:"${pageContext.request.contextPath}/admin/updatebill",
                type:"post",
                data:{'snum':snum,'place':$('#place').val(),'useing':$('#useing').val(),'cost':$('#cost').val()},
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

        <p align="centre">修改报销单信息</p>
        <hr>


        <form id="dai" >
            <table cellspacing="0" border="0" id="tb1" style="display: block" align="center">
                <tr>
                    <td>单号</td>
                    <td id="td1"></td>
                </tr>
                <tr>
                    <td>填写人</td>
                    <td id="td2"> </td>
                </tr>
                <tr>
                    <td>金额</td>
                    <td ><input type="number" id="cost"></td>
                </tr>
                <tr>
                    <td>地点</td>
                    <td > <input type="text" id="place"></td>
                </tr>
                <tr>
                    <td>用途</td>
                    <td > <input type="text" id="useing"></td>
                </tr>
                <tr>
                    <td align="center"><a id="atn2" href="javascript:void(0)" >确认修改</a></td>
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

