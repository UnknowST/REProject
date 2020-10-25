<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2020/10/24
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%--正在维修的维修单--%>
    <script src="${pageContext.request.contextPath}/Js/jquery-3.3.1.js"></script>
    <script>
        function successinfor(num) {
            $.ajax({
                url:'${pageContext.request.contextPath}/worker/success_infor?num='+num,
                type:'post',
                dataType:'json',
                async:false,
                success:function (message) {
                    if(message.flag==1){
                        alert(message.message)
                        window.history.go(0)
                    }else alert(message.message);
                }
            })
        }
    </script>
</head>
<body>
<!--修改-->
<div id="div2" align="center">

    <p>&nbsp;&nbsp;
        <a id="id2" href="${pageContext.request.contextPath}/worker/allinfor?workerid=${workerid}&p=1">待维修</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)">正在维修</a>&nbsp;&nbsp;&nbsp;
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
                    <c:if test="${infor.imagepath!=null}">
                        <td><img src="${infor.imagepath }" width="100px" height="120px" alt="诶呀！图片不小心走丢了..." ></td>
                    </c:if>
                    <c:if test="${infor.imagepath==null}">
                        <td>该用户没有上传图片说明...</td>
                    </c:if>
                    <td>${infor.state }</td>
                    <td>${infor.createdate }</td>
                    <td><a href="javascript:void(0)" onclick="successinfor('${infor.num}')">完成维修</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/worker/infor_ing?workerid=${workerid}&p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
            <a href="${pageContext.request.contextPath}/worker/infor_ing?userid=${page.list[0].userid}&p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
            <a href="${pageContext.request.contextPath}/worker/infor_ing?userid=${page.list[0].userid}&p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/worker/infor_ing?userid=${workerid}&p=${page.lastPage}">最后页</a>
    </c:if>
</div    >
</body>
</html>
