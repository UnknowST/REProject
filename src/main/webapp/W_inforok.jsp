<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%--已完成的维修单--%>
    <script>
        function evals(eval,comment) {
            if(eval=='0') alert("用户还没评价,请耐心等待!")
            else alert('\n本次服务，用户的打分是--'+eval+"分\n用户评价:"+comment);
        }
    </script>
</head>
<body>
<!--修改-->
<div id="div2" align="center">

    <p>&nbsp;&nbsp;
        <a id="id2" href="${pageContext.request.contextPath}/worker/allinfor?workerid=${workerid}&p=1">待维修</a>&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/worker/infor_ing?workerid=${workerid}&p=1">正在维修</a>&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/worker/infor_ok?workerid=${workerid}&p=1">已维修</a>&nbsp;&nbsp;&nbsp;
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
                    <td><a href="javascript:void(0)" onclick="evals('${infor.evaluate}','${infor.comment}')">查看评价</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/worker/infor_ok?workerid=${workerid}&p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
            <a href="${pageContext.request.contextPath}/worker/infor_ok?workerid=${workerid}&p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
            <a href="${pageContext.request.contextPath}/worker/infor_ok?workerid=${workerid}&p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/worker/infor_ok?userid=${workerid}&p=${page.lastPage}">最后页</a>
    </c:if>
</div>
</body>
</html>
