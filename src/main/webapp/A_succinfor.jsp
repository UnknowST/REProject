<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2020/10/26
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%--查看已维修的维修记录--%>
    <%--查看待分配的维修记录--%>
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
                        window.history.go(0); //刷新
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
            <th>维修工人</th>
            <th>填报时间</th>
            <th>操作</th>
            <% int i=0;%>
            <c:forEach items="${page.list }" var="infor">
                <tr>
                    <td>${i=i+1}</td>
                    <td>${infor.userid}</td>
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
                    <td>${infor.workerid }</td>
                    <td> <fmt:formatDate type="both"
                                         dateStyle="long" timeStyle="long"
                                         value="${infor.createdate}" /></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a onclick="state('${infor.num}')" href="javascript:void(0)" >删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <p>一共${page.pages}页;当前是${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/admin/succinfor?p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
            <a href="${pageContext.request.contextPath}/admin/succinfor?p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
            <a href="${pageContext.request.contextPath}/admin/succinfor?p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/admin/succinfor?p=${page.lastPage}">最后页</a>
    </c:if>
</div    >
</body>
</html>
