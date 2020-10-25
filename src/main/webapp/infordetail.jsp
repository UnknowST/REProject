<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2020/10/24
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>infordetail</title>
    <%--查看维修单的详细信息--%>
    <script src="${pageContext.request.contextPath}/Js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/Js/uploadimag.js"></script>
    <!--修改-->
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        #upBox{
            text-align: center;
            width:500px;
            padding: 20px;
            border: 1px solid #666;
            margin: auto;
            margin-top: 150px;
            margin-bottom: 200px;
            position: relative;
            border-radius: 10px;
        }
        #inputBox{
            width: 100%;
            height: 40px;
            border: 1px solid cornflowerblue;
            color: cornflowerblue;
            border-radius: 20px;
            position: relative;
            text-align: center;
            line-height: 40px;
            overflow: hidden;
            font-size: 16px;
        }
        #inputBox input{
            width: 114%;
            height: 40px;
            opacity: 0;
            cursor: pointer;
            position: absolute;
            top: 0;
            left: -14%;

        }
        #imgBox{
            text-align: left;
        }
        .imgContainer{
            display: inline-block;
            width: 32%;
            height: 150px;
            margin-left: 1%;
            border: 1px solid #666666;
            position: relative;
            margin-top: 30px;
            box-sizing: border-box;
        }
        .imgContainer img{
            width: 100%;
            height: 150px;
            cursor: pointer;
        }
        .imgContainer p{
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 30px;
            background: black;
            text-align: center;
            line-height: 30px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            display: none;
        }
        .imgContainer:hover p{
            display: block;
        }
        #btn{
            outline: none;
            width: 100px;
            height: 30px;
            background: cornflowerblue;
            border: 1px solid cornflowerblue;
            color: white;
            cursor: pointer;
            margin-top: 30px;
            border-radius: 5px;
        }
    </style>
    <script>
        function a1() {
            $("#tb1").css("display","none");
            $("#div2").css("display","block");
            //确认修改
            $("#aa1").click(function () {
                var data=new FormData(document.getElementById("f1"))
                data.append("num",${infor.num});
                data.append("place",$("#place").val())
                data.append("equip",$("#equip").val())
                data.append(("detail"),$("#detail").val())
                $.ajax(
                    {
                        type: "POST",

                        url: '${pageContext.request.contextPath}/user/update_infor',
                        data: data,
                        async:false,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (data) {
                            if(data.flag==1){
                                console.log(data)
                                alert(data.message);
                                //修改成功 回退
                                window.location.href="${pageContext.request.contextPath}/user/infor_num?num=${infor.num}";
                            }else{
                                alert(data.message)
                            }
                        }

                    }
                )
            })




        }

        function delete1() {
            $.ajax({
                url:'${pageContext.request.contextPath}/user/delete_infor?num='+${infor.num},
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
        $(function () {
            $("#btn2").click(function () {
                $.ajax({
                    url:'${pageContext.request.contextPath}/user/eval',
                    data:{"num":${infor.num},"fenshu":$('input:radio[name="fenshu"]:checked').val(),"workerid":${infor.workerid}},
                    dataType: 'json',
                    type:'post',
                    async:false,
                    success:function (message) {
                        if(message.flag==1){
                            alert(message.message);
                            window.history.go(0);

                        }else alert(message.message);

                    }
                })

            })
        })
    </script>
</head>
<body>

<div align="center">
    <c:choose>
        <c:when test="${infor.state == '待分配'}">
        <table cellspacing="0" border="0" id="tb1" style="display: block">
            <tr>
                <td>地点</td>
                <td>${infor.place}</td>
            </tr>
            <tr>
                <td>设备</td>
                <td>${infor.equip}</td>
            </tr>
            <tr>
                <td>详细信息</td>
                <td>${infor.detail}</td>
            </tr>
            <c:if test="${infor.imagepath!=null}">
            <tr>
                <td>图片</td>
                <td><img src="${infor.imagepath}" width="100px" height="120px" alt="诶呀.图片不小心走丢了..."></td>
            </tr>
            </c:if>
            <c:if test="${infor.imagepath==null}">
                <tr>
                    <td>图片</td>
                    <td>该用户没有上传图片...</td>
                </tr>
            </c:if>
            <tr>
                <td>时间</td>
                <td>${infor.createdate}</td>
            </tr>
            <tr>
               <td><a href="javascript:void(0)" onclick="delete1()">删除</a></td>
                <td><a onclick="a1()">修改</a></td>
            </tr>
        </table>


        <form id="f1" enctype="multipart/form-data" method="post">
        <div style="width: 100%;height: 100vh;position: relative;display: none;" align="center" id="div2">
            <div id="upBox">

            <table cellspacing="0" border="0"  id="tb2">
                <tr>
                    <td>地点</td>
                    <td><input type="text" id="place" value="${infor.place}"></td>
                </tr>
                <tr>
                    <td>设备</td>
                    <td><input type="text" id="equip" value="${infor.equip}"></td>
                </tr>
                <tr>
                    <td>详细信息</td>
                    <td><input type="text" id="detail" value="${infor.detail}"></td>
                </tr>
                <c:if test="${infor.imagepath!=null}">
                    <tr>
                        <td>图片</td>
                        <td><img src="${infor.imagepath}" width="100px" height="120px" alt="诶呀.图片不小心走丢了..."></td>
                    </tr>
                </c:if>
                <c:if test="${infor.imagepath==null}">
                    <tr>
                        <td>图片</td>
                        <td>该用户没有上传图片...</td>
                    </tr>

                </c:if>
                <tr>
                    <td>时间</td>
                    <td>${infor.createdate}</td>
                </tr>
                <tr>
                    <div id="inputBox">



                        <input type="file" title="请选择图片" id="file" name="file" multiple accept="image/png,image/jpg,image/gif,image/JPEG"/>点击选择图片</div>
                    <div id="imgBox">
                </tr>
                <tr>
                    <td align="center"><a href="${pageContext.request.contextPath}/user/infor_num?num=${infor.num}">返回</a></td>
                    <td align="center"><a href="javascript:void(0)" id="aa1">确认修改</a></td>
                </tr>

                </div>

            </div>
        </div>

            </table>
</form>
            <script>
                imgUpload({
                    inputId:'file', //input框id
                    imgBox:'imgBox', //图片容器id
                    buttonId:'btn', //提交按钮id
                    upUrl:'user/update_infor',  //提交地址
                    data:'file1' //参数名
                })
            </script>
        </c:when>
        <c:when test="${infor.state == '待维修'}">
            <table cellspacing="0" border="0">
                <tr>
                    <td>地点</td>
                    <td>${infor.place}</td>
                </tr>
                <tr>
                    <td>设备</td>
                    <td>${infor.equip}</td>
                </tr>
                <tr>
                    <td>详细信息</td>
                    <td>${infor.detail}</td>
                </tr>
                <c:if test="${infor.imagepath!=null}">
                    <tr>
                        <td>图片</td>
                        <td><img src="${infor.imagepath}" width="100px" height="120px" alt="诶呀.图片不小心走丢了..."></td>
                    </tr>
                </c:if>
                <c:if test="${infor.imagepath==null}">
                    <tr>
                        <td>图片</td>
                        <td>该用户没有上传图片...</td>
                    </tr>
                </c:if>
                <tr>
                    <td>时间</td>
                    <td>${infor.createdate}</td>
                </tr>
                <tr>
                    <td>维修师傅</td>
                    <td>${infor.workerid}</td>
                </tr>
            </table>
        </c:when>
        <c:when test="${infor.state == '正在维修'}">
            <table cellspacing="0" border="0">
                <tr>
                    <td>地点</td>
                    <td>${infor.place}</td>
                </tr>
                <tr>
                    <td>设备</td>
                    <td>${infor.equip}</td>
                </tr>
                <tr>
                    <td>详细信息</td>
                    <td>${infor.detail}</td>
                </tr>
                <c:if test="${infor.imagepath!=null}">
                    <tr>
                        <td>图片</td>
                        <td><img src="${infor.imagepath}" width="100px" height="120px" alt="诶呀.图片不小心走丢了..."></td>
                    </tr>
                </c:if>
                <c:if test="${infor.imagepath==null}">
                    <tr>
                        <td>图片</td>
                        <td>该用户没有上传图片...</td>
                    </tr>
                </c:if>
                <tr>
                    <td>时间</td>
                    <td>${infor.createdate}</td>
                </tr>
                <tr>
                    <td>维修师傅</td>
                    <td>${infor.workerid}</td>
                </tr>
            </table>
        </c:when>
        <c:when test="${infor.state == '已维修'}">
            <table cellspacing="0" border="0">
                <tr>
                    <td>地点</td>
                    <td>${infor.place}</td>
                </tr>
                <tr>
                    <td>设备</td>
                    <td>${infor.equip}</td>
                </tr>
                <tr>
                    <td>详细信息</td>
                    <td>${infor.detail}</td>
                </tr>
                <c:if test="${infor.imagepath!=null}">
                    <tr>
                        <td>图片</td>
                        <td><img src="${infor.imagepath}" width="100px" height="120px" alt="诶呀.图片不小心走丢了..."></td>
                    </tr>
                </c:if>
                <c:if test="${infor.imagepath==null}">
                    <tr>
                        <td>图片</td>
                        <td>该用户没有上传图片...</td>
                    </tr>
                </c:if>
                <tr>
                    <td>时间</td>
                    <td>${infor.createdate}</td>
                </tr>
                <tr>
                    <td>维修师傅</td>
                    <td>${infor.workerid}</td>
                </tr>
                <c:if test="${infor.evaluate==0}">
                <tr>
                    <td>请你为本次服务打分</td>
                    <td>     '<input type="radio" id="radio" name="fenshu" value="1">1
                        <input type="radio" id="radio" name="fenshu" value="2">2
                        <input type="radio" id="radio" name="fenshu" value="3">3
                        <input type="radio" id="radio" name="fenshu" value="4">4
                        <input type="radio" id="radio" name="fenshu" value="4">4
                        <input type="radio" id="radio" name="fenshu" value="6">6
                        <input type="radio" id="radio" name="fenshu" value="7">7
                        <input type="radio" id="radio" name="fenshu" value="8">8
                        <input type="radio" id="radio" name="fenshu" value="9">9
                        <input type="radio" id="radio" name="fenshu" value="10">10
                    </td>
                </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="button" value="确认评价" id="btn2"></td>
                    </tr>
                </c:if>
                <c:if test="${infor.evaluate!=0}">
                    <tr>
                        <td>您对本次服务的打分是:</td>
                        <td>${infor.evaluate}</td>
                    </tr>
                </c:if>
            </table>
        </c:when>
    </c:choose>

</div>
</body>
</html>
