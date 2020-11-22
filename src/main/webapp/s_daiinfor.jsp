
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>daifenpei</title>
    <script src="${pageContext.request.contextPath}/Js/jquery-3.3.1.js"></script>
    <script>
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
                        self.location=document.referrer;    //回退上一页
                    }
                    else{
                        alert(message.message);
                    }
                }
            })
        }
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
                        <a onclick="state('${infor.num}')" href="javascript:void(0)" >删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <p>一共${page.pages}页;当前是${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/user/infor_dai?userid=${page.list[0].userid}&p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
            <a href="${pageContext.request.contextPath}/user/infor_dai?userid=${page.list[0].userid}&p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
            <a href="${pageContext.request.contextPath}/user/infor_dai?userid=${page.list[0].userid}&p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/user/infor_dai?userid=${page.list[0].userid}&p=${page.lastPage}">最后页</a>
    </c:if>
</div    >
</body>
</html>
