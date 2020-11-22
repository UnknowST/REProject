
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>abnormal</title>
    <%--用户查看维修异常的维修订单--%>
    <script src="${pageContext.request.contextPath}/Js/jquery-1.11.0.min.js"></script>
    <script>
        function showdetail(num1){

        <c:forEach items="${page.list }" var="infor" >
            if("${infor.num}"==num1){
                if("${infor.state}"=="维修失败"){
                    alert(
                        '维修师傅:   '+"${infor.workerid}"+
                        '\n\n详细信息:   '+"${infor.replay.detail}"
                    )
                }
                if("${infor.state}"=="退回"){
                    alert('\n原因:   '+"${infor.ad_replay}")
                }

            }
            </c:forEach>
        }
        $(function () {

        })
    </script>
</head>
<body>
<div align="center"  id="div1">
    <c:if test="${message.flag==0}">
        <p>${message.message}</p>
    </c:if>
    <c:if test="${message.flag==1}">
        <table border="1" cellspacing="0">
            <caption>全部异常维修单列表</caption>
            <tbody>
            <th>序号</th>
            <th>申报人账号</th>
            <th>地点</th>
            <th>设备</th>
            <th>详细信息</th>
            <th>填报时间</th>
            <th>维修单状态</th>
            <th>操作</th>
            <% int i=0;%>
            <c:forEach items="${page.list }" var="infor" varStatus="list">
                <tr>
                    <td>${i=i+1}</td>
                    <td>${infor.userid }</td>
                    <td>${infor.place }</td>
                    <td>${infor.equip }</td>
                    <td>${infor.detail }</td>

                    <td> <fmt:formatDate type="both"
                                         dateStyle="long" timeStyle="long"
                                         value="${infor.createdate}" /></td>
                    <td>${infor.state }</td>

                    <td>
                        <a  href="javascript:void(0)" onclick='showdetail("${infor.num}")' >查看原因</a>
                        </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <p>一共${page.pages}页;当前是${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/user/normalinfor?userid=${userid}&p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
            <a href="${pageContext.request.contextPath}/user/normalinfor?userid=${userid}&p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
            <a href="${pageContext.request.contextPath}/user/normalinfor?userid=${userid}&p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/user/normalinfor?userid=${userid}&p=${page.lastPage}">最后页</a>
    </c:if>
</div    >
</body>
</html>
