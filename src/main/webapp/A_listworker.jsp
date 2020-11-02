<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2020/11/1
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%--查看工人信息--%>
    <script src="${pageContext.request.contextPath}/Js/jquery-3.3.1.js"></script>

    <script>
        function deleteworker(num) {
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/deleteworker',
                data:{"num":num},
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
        function resetworker(num,p){
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/resetworker',
                data:{"num":num},
                dataType:'json',
                async:false,
                success:function(message){
                    if(message.flag==1){
                        alert(message.message);
                    }else {
                        alert(message.message)
                    }
                }
            })
        }
        $(function () {
            var tou='<select id="type1"> <option value="-1">---请选择---</option>'
            var wei='</select>';
            var d1=" ";
            <c:forEach items="${type}" var="type">
            d1+='<option value=${type.num}>${type.type}</option>'
            </c:forEach>

            $("#td4").html(tou+d1+wei);
            //监听搜索按钮
            $("#btn1").click(function () {
                window.location.href='${pageContext.request.contextPath}/admin/searchworkers?userid='+$("#userid").val()+'&type_worker='+$("#type1 option:selected").val() +
                    '&position='+$("#position1").val()+'&workstate='+$("#workstate1").val()+'&p=1';
            })

        })
    </script>
</head>
<body>

<div align="center">
    <table align="center" >
        <tr>
            <td>账号:</td>
            <td><input type="text" id="userid"></td>
            <td>职位:</td>
            <td><input type="text" id="position1"></td>
            <td rowspan="2"> <input type="button" id="btn1" value="搜索" ></td>   <%--//待修改--%>
        </tr>

        <tr>
            <td>当班状态:</td>
            <td><select id="workstate1">
                <option value="">--请选择--</option>
                <option value="Y">Y</option>
                <option value="N">N</option>
            </select></td>
            <td>工种:</td>
            <td id="td4"></td>
        </tr>

    </table>
</div>

<div align="center">
    <table border="1" cellspacing="0">
        <caption>维修师傅列表</caption>
        <tbody>
        <th>序号</th>
        <th>账号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>电话</th>
        <th>邮箱</th>
        <th>职位</th>
        <th>工种</th>
        <th>当班状态</th>
        <th>注册时间</th>
        <th>操作</th>
        <% int i=0;%>
        <c:forEach items="${page.list }" var="worker">
            <tr>
                <td>${i=i+1}</td>
                <td>${worker.userid }</td>
                <td>${worker.name }</td>
                <td>${worker.gender }</td>
                <td>${worker.phone }</td>
                <td>${worker.mail }</td>
                <td>${worker.position }</td>
                <c:forEach items="${type}" var="type">
                    <c:if test="${type.num==worker.type_worker}">
                        <td>${type.type }</td>
                    </c:if>
                </c:forEach>

                <td>${worker.workstate }</td>
                <td> <fmt:formatDate type="both"
                                     dateStyle="long" timeStyle="long"
                                     value="${worker.createdate}" /></td>
                <td><a onclick="deleteworker(${worker.num})" href="javascript:void(0)">删除账号</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a onclick="resetworker(${worker.num},${page.pageNum})" href="javascript:void(0)">重置密码</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;<a onclick='modifworker(${worker.num})' href="javascript:void(0)">修改信息</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--查看所有信息--%>
    <c:if test="${n==1}">
    <p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

    <a href="${pageContext.request.contextPath}/admin/listworkers?p=${page.firstPage}">第一页</a>
    <c:if test="${page.nextPage==0}">
        <a href="javascript:void(0)">下一页</a>
    </c:if>
    <c:if test="${page.nextPage!=0}">
        <a href="${pageContext.request.contextPath}/admin/listworkers?p=${page.nextPage}">下一页</a>
    </c:if>
    <c:if test="${page.prePage==0}">
        <a href="javascript:void(0)">上一页</a>
    </c:if>
    <c:if test="${page.prePage!=0}">
        <a href="${pageContext.request.contextPath}/admin/listworkers?p=${page.prePage}">上一页</a>
    </c:if>
    <a href="${pageContext.request.contextPath}/admin/listworkers?p=${page.lastPage}">最后页</a>

    </c:if>
    <%--查看搜索到的信息--%>
    <c:if test="${n==2}">
        <p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

        <a href="${pageContext.request.contextPath}/admin/searchworkers?userid=${worker.userid}&position=${worker.position}&type_worker=${worker.type_worker}
                                                    &workstate=${worker.workstate}&p=${page.firstPage}">第一页</a>
        <c:if test="${page.nextPage==0}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <c:if test="${page.nextPage!=0}">
            <a href="${pageContext.request.contextPath}/admin/searchworkers?userid=${worker.userid}&position=${worker.position}&type_worker=${worker.type_worker}
                                                    &workstate=${worker.workstate}&p=${page.nextPage}">下一页</a>
        </c:if>
        <c:if test="${page.prePage==0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.prePage!=0}">
            <a href="${pageContext.request.contextPath}/admin/searchworkers?userid=${worker.userid}&position=${worker.position}&type_worker=${worker.type_worker}
                                                    &workstate=${worker.workstate}&p=${page.prePage}">上一页</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/admin/searchworkers?userid=${worker.userid}&position=${worker.position}&type_worker=${worker.type_worker}
                                                    &workstate=${worker.workstate}&p=${page.lastPage}">最后页</a>
    </c:if>
</div>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/popup.css" />  <!--//引入css-->
<script>

    function modifworker(num) {

        var tou='<select id="type"> <option value="-1">---请选择---</option>'
        var wei='</select>';
        var d1=" ";
        <c:forEach items="${type}" var="type">
        d1+='<option value=${type.num}>${type.type}</option>'
        </c:forEach>

        $("#td2").html(tou+d1+wei);
        <c:forEach items="${workerlist}" var="worker">
        var num1=${worker.num}
        if(num1==num){

           $("#td1").html(${worker.userid});
            $("#type").find('option[value=${worker.type_worker}]').attr("selected",true);
            $("#workstate").find('option[value=${worker.workstate}]').attr("selected",true);
            $("#position").val("${worker.position}");
        }
        </c:forEach>


        document.getElementById('all_light').style.display = 'block';
        document.getElementById('contes').style.display = 'block';

        $("#atn2").click(function () {

         $.ajax({
                url:"${pageContext.request.contextPath}/admin/updateworker",
                type:"post",
                data:{'num':num,'position':$('#position').val(),'type_worker':$('#type option:selected').val(),'workstate':$('#workstate option:selected').val()},
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

        <p align="centre">修改维修师傅信息</p>
        <hr>


        <form id="dai" >
            <table cellspacing="0" border="0" id="tb1" style="display: block" align="center">
                <tr>
                    <td>账号</td>
                    <td id="td1"></td>
                </tr>
                <tr>
                    <td>工种</td>
                    <td id="td2"> </td>
                </tr>
                <tr>
                    <td>职位</td>
                    <td ><input type="text" id="position"></td>
                </tr>
                <tr>
                    <td>当班状态</td>
                    <td > <select id="workstate">
                        <option value="">--请选择--</option>
                        <option value="Y">Y</option>
                        <option value="N">N</option>
                    </select></td>
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
