<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>设备管理</title>
    <script src="${pageContext.request.contextPath}/Js/jquery-1.11.0.min.js"></script>
    <script>
        function deleteequip(snum) {
            var q=confirm("确认要删除该设备吗？");
            if(q){
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/deleteequipment',
                dataType:'json',
                data:{snum:snum},
                async:false,
                type:'post',
                success:function (message) {
                    if(message.flag==1){
                        alert(message.message);
                        window.history.go(0);
                    }else {
                        alert(message.message);
                    }
                }
            })}
        }

        function addequip(snum) {
            var nb=prompt("请输入入库数量:");
            if(nb){
                var que=confirm("确认该设备入库"+nb+"个吗？");
               if(que){
                   $.ajax({
                       url:'${pageContext.request.contextPath}/admin/addequip',
                       dataType:'json',
                       data:{snum:snum,num:nb},
                       type:'post',
                       async:false,
                       success:function (message) {
                           if(message.flag==1){
                               alert(message.message);
                               window.history.go(0);
                           }else  alert(message.message);
                       }
                   })
               }
            }

        }

        function subequip(snum) {
            var nb1=prompt("请输入出库数量:");
            if(nb1){
                var que1=confirm("确认该设备出库"+nb1+"个吗？");
                if(que1){
                    $.ajax({
                        url:'${pageContext.request.contextPath}/admin/subequip',
                        dataType:'json',
                        data:{snum:snum,num:nb1},
                        type:'post',
                        async:false,
                        success:function (message) {
                            if(message.flag==1){
                                alert(message.message);
                                window.history.go(0);
                            }else  alert(message.message);
                        }
                    })
                }
            }
        }
    </script>
</head>
<body>
<div align="center">
    <c:if test="${message.flag==0}">
        <p align="center">${message.message}</p>
        <p align="center"><a href="javascript:coud(0)" onclick="xianshi2()">添加设备</a></p>
    </c:if>
    <c:if test="${message.flag==1}">


    <table border="1" cellspacing="0">
        <caption>设备信息表</caption>
        <th>序号</th>
        <th>编号</th>
        <th>名称</th>
        <th>型号</th>
        <th>公司名称</th>
        <th>价格</th>
        <th>库存数量</th>
        <th>入库时间</th>
        <th>操作</th>
        <% int i = 0;%>
        <c:forEach items="${page.list}" var="equip">
            <tr>
                <td>${i=i+1}</td>
                <td>${equip.eid}</td>
                <td>${equip.eqname}</td>
                <td>${equip.model}</td>
                <td>${equip.company_name}</td>
                <td>${equip.price}</td>
                <td>${equip.number}</td>
                <td><fmt:formatDate type="both"
                                    dateStyle="long" timeStyle="long"
                                    value="${equip.createdate}"/>
                </td>
                <td>
                    <a href="javascript:void(0)" onclick="xianshi('${equip.snum}')">修改信息</a>
                    <a href="javascript:void(0)" onclick="deleteequip('${equip.snum}')"> 删除</a>
                    <a href="javascript:void(0)" onclick="addequip('${equip.snum}')">入库</a>
                    <a href="javascript:void(0)" onclick="subequip('${equip.snum}')">出库</a>
                </td>

            </tr>
        </c:forEach>
    </table>

    <p align="center"><a href="javascript:coud(0)" onclick="xianshi2()">添加设备</a></p>
    <p>一共${page.pages}页;当前为${page.pageNum}页;每页${page.pageSize}条数据</p>

    <a href="${pageContext.request.contextPath}/admin/equipmentlist?p=${page.firstPage}">第一页</a>
    <c:if test="${page.nextPage==0}">
        <a href="javascript:void(0)">下一页</a>
    </c:if>
    <c:if test="${page.nextPage!=0}">
        <a href="${pageContext.request.contextPath}/admin/equipmentlist?p=${page.nextPage}">下一页</a>
    </c:if>
    <c:if test="${page.prePage==0}">
        <a href="javascript:void(0)">上一页</a>
    </c:if>
    <c:if test="${page.prePage!=0}">
        <a href="${pageContext.request.contextPath}/admin/equipmentlist?p=${page.prePage}">上一页</a>
    </c:if>
    <a href="${pageContext.request.contextPath}/admin/equipmentlist?p=${page.lastPage}">最后页</a>
    </c:if>
</div>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/popup.css"/>  <!--//引入css-->
<script>

    function xianshi(snum) {
        document.getElementById('all_light').style.display = 'block';
        document.getElementById('contes').style.display = 'block';
        <c:forEach items="${page.list}" var="equip">
        if ("${equip.snum}" == snum) {
            $("#td1").html(${equip.eid})
            $("#eqname").val("${equip.eqname}")
            $("#model").val("${equip.model}")
            $("#price").val("${equip.price}")
            $("#company_name").val("${equip.company_name}")
            $("#number").val("${equip.number}")
        }
        </c:forEach>
        $("#btn2").click(function () {
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/updateequipment',
                dataType: 'json',
                type: 'get',
                data: {
                    snum: snum, eqname: $("#eqname").val(), model:
                        $("#model").val(), price:
                        $("#price").val(), company_name:
                        $("#company_name").val(), number:
                        $("#number").val()
                },
                async:false,
                success:function (message) {
                    if(message.flag==1){
                        alert(message.message);
                        window.history.go(0);
                    }else  alert(message.message);
                }
            })
        })
    }

    function close1() {
        document.getElementById('all_light').style.display = 'none';
        document.getElementById('contes').style.display = 'none';
    }

    function xianshi2() {
        document.getElementById('all_light1').style.display = 'block';
        document.getElementById('contes1').style.display = 'block';
        //先获取最大的订单值:
    /*    var eid=0;
        <c:forEach items="${equipmentlist}" var="equip">
            if("${equip.eid}">eid) eid="${equip.eid}"
        </c:forEach>
        eid=eid+1;*/
        $("#td2").html("${maxeid}");
        $("#btn21").click(function () {
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/insertequipment',
                dataType: 'json',
                type: 'post',
                data:{
                   eid: "${maxeid}", eqname: $("#eqname1").val(), model:
                        $("#model1").val(), price:
                        $("#price1").val(), company_name:
                        $("#company_name1").val(), number:
                        $("#number1").val()
                },
                async: false,
                success:function (message) {
                    alert(message.message);
                }
            })
        })
    }

    function close2() {
        document.getElementById('all_light1').style.display = 'none';
        document.getElementById('contes1').style.display = 'none';
    }
</script>
<div4 id="contes" style="">

    <div5 style="width:500px;height:40px;">

        <p align="centre">修改信息</p>
        <hr>
        <table>
            <tr>
                <td>编号:</td>
                <td id="td1"></td>
            </tr>
            <tr>
                <td>名称:</td>
                <td><input type="text" id="eqname"></td>
            </tr>
            <tr>
                <td>型号:</td>
                <td><input type="text" id="model"></td>
            </tr>
            <tr>
                <td>库存数量:</td>
                <td><input type="number" id="number"></td>
            </tr>
            <tr>
                <td>价格:</td>
                <td><input type="text" id="price"></td>
            </tr>
            <tr>
                <td>公司名称:</td>
                <td><input type="text" id="company_name"></td>
            </tr>
            <tr>
                <td><input type="button" value="返回" id="btn1" onclick="close1()"></td>
                <td><input type="button" value="提交" id="btn2"></td>
            </tr>


        </table>


    </div5>

</div4>
<div6 id="all_light">
</div6>


<div4 id="contes1" style="">

    <div5 style="width:500px;height:40px;">

        <p align="centre">添加记录</p>
        <hr>

        <table>
            <tr>
                <td>编号:</td>
                <td id="td2"></td>
            </tr>
            <tr>
                <td>名称:</td>
                <td><input type="text" id="eqname1"></td>
            </tr>
            <tr>
                <td>型号:</td>
                <td><input type="text" id="model1"></td>
            </tr>
            <tr>
                <td>库存数量:</td>
                <td><input type="number" id="number1"></td>
            </tr>
            <tr>
                <td>价格:</td>
                <td><input type="text" id="price1"></td>
            </tr>
            <tr>
                <td>公司名称:</td>
                <td><input type="text" id="company_name1"></td>
            </tr>
            <tr>
                <td><input type="button" value="返回" id="btn11" onclick="close2()"></td>
                <td><input type="button" value="提交" id="btn21"></td>
            </tr>


        </table>


    </div5>

</div4>
<div6 id="all_light1">
</div6>
</body>
</html>
