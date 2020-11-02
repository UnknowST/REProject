
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%--查看所有的用户信息--%>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/Js/jquery-3.3.1.js"></script>
    <script>
       function deleteuser(num,p) {
           $.ajax({
               url:'${pageContext.request.contextPath}/admin/deleteuser',
               data:{"num":num},
               dataType:'json',
               async:false,
               success:function(message){
                   if(message.flag==1){
                       alert(message.message);
                       window.location.href="${pageContext.request.contextPath}/admin/userlist?p="+p;

                   }else {
                       alert(message.message)
                   }
               }
           })

       }
        function resetpass(num,p){
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/resetpass',
                data:{"num":num},
                dataType:'json',
                async:false,
                success:function(message){
                    if(message.flag==1){
                        alert(message.message);
                        window.location.href="${pageContext.request.contextPath}/admin/userlist?p="+p;
                    }else {
                        alert(message.message)
                    }
                }
            })
        }
        $(function () {

        })
    </script>
</head>
<body>

<div align="center">
    <table border="1" cellspacing="0">
        <caption>用户列表</caption>
        <tbody>
            <th>序号</th>
            <th>账号</th>
            <th>学院</th>
            <th>姓名</th>
            <th>性别</th>
            <th>电话</th>
            <th>邮箱</th>
            <th>注册时间</th>
            <th>操作</th>
      <% int i=0;%>
        <c:forEach items="${page.list }" var="user">
            <tr>
                <td>${i=i+1}</td>
                <td>${user.userid }</td>
                <td>${user.collage }</td>
                <td>${user.name }</td>
                <td>${user.gender }</td>
                <td>${user.phone }</td>
                <td>${user.mail }</td>
                <td> <fmt:formatDate type="both"
                                     dateStyle="long" timeStyle="long"
                                     value="${user.createdate}" /></td>
                <td><a onclick="deleteuser(${user.num},${page.pageNum})" href="javascript:void(0)">删除账号</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a onclick="resetpass(${user.num},${page.pageNum})" href="javascript:void(0)">重置密码</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

    <a href="${pageContext.request.contextPath}/admin/userlist?p=${page.firstPage}">第一页</a>
    <c:if test="${page.nextPage==0}">
        <a href="javascript:void(0)">下一页</a>
    </c:if>
    <c:if test="${page.nextPage!=0}">
        <a href="${pageContext.request.contextPath}/admin/userlist?p=${page.nextPage}">下一页</a>
    </c:if>
    <c:if test="${page.prePage==0}">
        <a href="javascript:void(0)">上一页</a>
    </c:if>
    <c:if test="${page.prePage!=0}">
        <a href="${pageContext.request.contextPath}/admin/userlist?p=${page.prePage}">上一页</a>
    </c:if>
    <a href="${pageContext.request.contextPath}/admin/userlist?p=${page.lastPage}">最后页</a>
</div>
</body>
</html>
