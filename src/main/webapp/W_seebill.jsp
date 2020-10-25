<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2020/10/25
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>seebill</title>
    <%--工人查看自己申报的报销单--%>
</head>
<body>
<table align="center" cellspacing="0" border="1">

    <th>序号</th>
    <th>单号</th>
    <th>地点</th>
    <th>用途</th>
    <th>花费</th>
    <th>填写人</th>
    <th>填写时间</th>

    <% int i=0;%>
    <c:forEach items="${page.list}" var="bill">
        <tr>
            <td>${i=i+1}</td>
            <td>${bill.num}</td>
            <td>${bill.place}</td>
            <td>${bill.useing}</td>
            <td>${bill.cost}</td>
            <td>${bill.workerid}</td>
            <td>${bill.createdate}</td>
        </tr>
    </c:forEach>

</table>
<div align="center">
<p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

<a href="${pageContext.request.contextPath}/worker/listbill?workerid=${workerid}&p=${page.firstPage}">第一页</a>
<c:if test="${page.nextPage==0}">
    <a href="javascript:void(0)">下一页</a>
</c:if>
<c:if test="${page.nextPage!=0}">
    <a href="${pageContext.request.contextPath}/worker/listbill?workerid=${workerid}&p=${page.nextPage}">下一页</a>
</c:if>
<c:if test="${page.prePage==0}">
    <a href="javascript:void(0)">上一页</a>
</c:if>
<c:if test="${page.prePage!=0}">
    <a href="${pageContext.request.contextPath}/worker/listbill?workerid=${workerid}&p=${page.prePage}">上一页</a>
</c:if>
<a href="${pageContext.request.contextPath}/worker/listbill?workerid=${workerid}&p=${page.lastPage}">最后页</a>
</div>
</body>
</html>
