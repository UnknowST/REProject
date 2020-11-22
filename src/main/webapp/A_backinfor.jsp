
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>A_backinfor</title>
    <script src="${pageContext.request.contextPath}/Js/jquery-1.11.0.min.js"></script>
    <script>
        function showstate(num1){
            <c:forEach items="${page.list }" var="infor">
            if("${infor.num}"==num1){
                alert("\n退回原因:"+"${infor.ad_replay}")
            }
            </c:forEach>
        }
        function return1(num) {
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/revoke',
                dataType:'json',
                type:'post',
                data:{num:num},
                async:false,
                success:function (message) {
                    if(message.flag==1){
                        alert(message.message);
                        window.history.go(0);
                    }else alert(message.message);
                }
            })
        }
    </script>
</head>
<body>
<!--修改-->
<div id="div2" align="center">

    <p>
        <a href="${pageContext.request.contextPath}/admin/failinfor?p=1">维修失败</a>&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/admin/a_backinfor?p=1">被退回</a>&nbsp;&nbsp;&nbsp;
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
                    <td>${infor.workerid }</td>
                    <td> <fmt:formatDate type="both"
                                         dateStyle="long" timeStyle="long"
                                         value="${infor.createdate}" /></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a onclick="return1('${infor.num}')" href="javascript:void(0)" >撤销</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0)" onclick="showstate('${infor.num}')">查看原因</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <p>一共${page.pages}页;当前是${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/admin/a_backinfor?p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
            <a href="${pageContext.request.contextPath}/admin/a_backinfor?p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
            <a href="${pageContext.request.contextPath}/admin/a_backinfor?p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/admin/a_backinfor?p=${page.lastPage}">最后页</a>
    </c:if>
</div>
</body>
</html>
