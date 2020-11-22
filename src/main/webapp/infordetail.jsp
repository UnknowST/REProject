
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        function removeimg(i) {
            id='#divv'+i;   //删除原本上传的图片
           $(id).remove();
           imgSrc.pop(i);
        }
        function a1() {
            $("#tb1").css("display","none");
            $("#div2").css("display","block");
            src=[]
         <c:if test="${infor.imagepaths.size()!=0}">
          <c:forEach var="i" begin="0" end="${infor.imagepaths.size()-1}">
                 imgSrc.push("${infor.imagepaths.get(i)}");

         </c:forEach>
         </c:if>
        for(var i=0;i<imgSrc.length;i++){
            $("#imgBox").append('<div id="divv'+i+'" class="imgContainer"><img  src="'+imgSrc[i] +'" onclick="imgDisplay(this)"> <p onclick="removeimg('+i+')" class="imgDelete">删除</p></div>')
        }

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
                    data:{"num":${infor.num},"fenshu":$('input:radio[name="fenshu"]:checked').val(),"workerid":${infor.workerid},comment:$("#comment").val()},
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
        <table cellspacing="0" border="0" id="tb1" style="display: block" align="center">
            <tr>
                <td>报修人:</td>
                <td>${infor.userid}</td>
            </tr>
            <tr>
                <td>地点:</td>
                <td>${infor.place}</td>
            </tr>
            <tr>
                <td>设备:</td>
                <td>${infor.equip}</td>
            </tr>
            <tr>
                <td>详细信息:</td>
                <td>${infor.detail}</td>
            </tr>

            <c:if test="${infor.imagepaths.size()==0}">
                <tr>
                    <td>图片说明:</td>
                    <td>该用户没有上传图片说明</td>
                </tr>

            </c:if>

            <c:if test="${infor.imagepaths.size()!=0}">
                <tr>
                    <td>图片说明:</td></tr>
                    <tr><td>
                <c:if test="${infor.imagepaths.size()<=3}">
                    <c:forEach var="i" begin="0" end="${infor.imagepaths.size()-1}">
                        <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">
                    </c:forEach>
                    </td></tr>
                </c:if>
                <c:if test="${infor.imagepaths.size()>3}">
                    <c:forEach  var="i" begin="0" end="2">

                        <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">

                    </c:forEach>
                    </td></tr><tr><td>
                    <c:forEach  var="i" begin="3" end="${infor.imagepaths.size()-1}">
                        <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">

                    </c:forEach>
                    </td></tr>

                </c:if>

            </c:if>
            <tr>
                <td>时间:</td>
                <td> <fmt:formatDate type="both"
                                     dateStyle="long" timeStyle="long"
                                     value="${infor.createdate}" /></td>
            </tr>
            <tr>
               <td><a href="javascript:void(0)" onclick="delete1()">删除</a></td>
                <td><a onclick="a1()" href="javascript:void(0)">修改</a></td>
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

                <tr>
                    <td>时间</td>
                    <td> <fmt:formatDate type="both"
                                         dateStyle="long" timeStyle="long"
                                         value="${infor.createdate}" /></td>
                </tr>
                <tr>
                    <div id="inputBox">



                        <input type="file" title="请选择图片" id="file" name="file" multiple accept="image/png,image/jpg,image/gif,image/JPEG"/>点击选择图片</div>
                    <div id="imgBox">
                    </div>
                </tr>
                <tr>
                    <td align="center"><a href="${pageContext.request.contextPath}/user/infor_num?num=${infor.num}">返回</a></td>
                    <td align="center"><a href="javascript:void(0)" id="aa1">确认修改</a></td>
                </tr>


            </table>
            </div>
        </div>


</form>
            <script>
                imgUpload({
                    inputId:'file', //input框id
                    imgBox:'imgBox', //图片容器id
                    buttonId:'aa1', //提交按钮id
                    upUrl:'${pageContext.request.contextPath}/user/update_infor',  //提交地址
                    data:'file' //参数名
                })


                //选择图片
                function imgUpload(obj) {
                    var oInput = '#' + obj.inputId;
                    var imgBox = '#' + obj.imgBox;
                    var btn = '#' + obj.buttonId;
                    $(oInput).on("change", function() {
                        var fileImg = $(oInput)[0];
                        var fileList = fileImg.files;
                        for(var i = 0; i < fileList.length; i++) {
                            var imgSrcI = getObjectURL(fileList[i]);
                            imgName.push(fileList[i].name);
                            imgSrc.push(imgSrcI);
                            console.log(imgSrc)
                            imgFile.push(fileList[i]);
                        }

                        addNewContent(imgBox);
                    })
                    $(btn).on('click', function() {
                        var data = new Object;
                        data[obj.data] = imgFile;
                        submitPicture(obj.upUrl, data);
                    })

                }

                function submitPicture(url,data) {

                    var formData = new FormData();
                    $.each(imgFile, function(i, file) {
                        formData.append('file', file);
                    });
                    formData.append("num",${infor.num});
                    formData.append("userid",${infor.userid});
                    formData.append("place",$("#place").val())
                    formData.append("equip",$("#equip").val())
                    formData.append(("detail"),$("#detail").val())
                    console.log(formData)
                    $.ajax({
                        type: "post",
                        url: url,
                        async: false,
                        data: formData,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function(message) {
                            if (message.flag==1){
                                window.history.go(-1);
                                alert(message.message);
                            }else {
                                alert(message.message);
                            }
                        }

                    })


                }
            </script>
        </c:when>
        <c:when test="${infor.state == '待维修'}">
            <table cellspacing="0" border="0">
                <tr>
                    <td>报修人:</td>
                    <td>${infor.userid}</td>
                </tr>
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
                <c:if test="${infor.imagepaths.size()==0}">
                    <tr>
                        <td>图片说明:</td>
                        <td>该用户没有上传图片说明</td>
                    </tr>

                </c:if>

                <c:if test="${infor.imagepaths.size()!=0}">
                    <tr>
                        <td>图片说明:</td></tr>
                    <tr><td>
                    <c:if test="${infor.imagepaths.size()<=3}">
                        <c:forEach var="i" begin="0" end="${infor.imagepaths.size()-1}">
                            <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">
                        </c:forEach>
                        </td></tr>
                    </c:if>
                    <c:if test="${infor.imagepaths.size()>3}">
                        <c:forEach  var="i" begin="0" end="2">

                            <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">

                        </c:forEach>
                        </td></tr><tr><td>
                        <c:forEach  var="i" begin="3" end="${infor.imagepaths.size()-1}">
                            <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">

                        </c:forEach>
                        </td></tr>

                    </c:if>

                </c:if>
                <tr>
                    <td>时间</td>
                    <td> <fmt:formatDate type="both"
                                         dateStyle="long" timeStyle="long"
                                         value="${infor.createdate}" /></td>
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
                    <td>报修人:</td>
                    <td>${infor.userid}</td>
                </tr>
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
                <c:if test="${infor.imagepaths.size()==0}">
                    <tr>
                        <td>图片说明:</td>
                        <td>该用户没有上传图片说明</td>
                    </tr>

                </c:if>

                <c:if test="${infor.imagepaths.size()!=0}">
                    <tr>
                        <td>图片说明:</td></tr>
                    <tr><td>
                    <c:if test="${infor.imagepaths.size()<=3}">
                        <c:forEach var="i" begin="0" end="${infor.imagepaths.size()-1}">
                            <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">
                        </c:forEach>
                        </td></tr>
                    </c:if>
                    <c:if test="${infor.imagepaths.size()>3}">
                        <c:forEach  var="i" begin="0" end="2">

                            <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">

                        </c:forEach>
                        </td></tr><tr><td>
                        <c:forEach  var="i" begin="3" end="${infor.imagepaths.size()-1}">
                            <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">

                        </c:forEach>
                        </td></tr>

                    </c:if>

                </c:if>
                <tr>
                    <td>时间</td>
                    <td> <fmt:formatDate type="both"
                                         dateStyle="long" timeStyle="long"
                                         value="${infor.createdate}" /></td>
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
                    <td>报修人:</td>
                    <td>${infor.userid}</td>
                </tr>
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
                <c:if test="${infor.imagepaths.size()==0}">
                    <tr>
                        <td>图片说明:</td>
                        <td>该用户没有上传图片说明</td>
                    </tr>

                </c:if>

                <c:if test="${infor.imagepaths.size()!=0}">
                    <tr>
                        <td>图片说明:</td></tr>
                    <tr><td>
                    <c:if test="${infor.imagepaths.size()<=3}">
                        <c:forEach var="i" begin="0" end="${infor.imagepaths.size()-1}">
                            <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">
                        </c:forEach>
                        </td></tr>
                    </c:if>
                    <c:if test="${infor.imagepaths.size()>3}">
                        <c:forEach  var="i" begin="0" end="2">

                            <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">

                        </c:forEach>
                        </td></tr><tr><td>
                        <c:forEach  var="i" begin="3" end="${infor.imagepaths.size()-1}">
                            <img src="${infor.imagepaths.get(i)}" alt="图片不小心走丢了。。。" height="150px" width="100px">

                        </c:forEach>
                        </td></tr>

                    </c:if>

                </c:if>
                <tr>
                    <td>时间</td>
                    <td> <fmt:formatDate type="both"
                                         dateStyle="long" timeStyle="long"
                                         value="${infor.createdate}" /></td>
                </tr>

                <tr>
                    <td>维修师傅:</td>
                    <td>${infor.workerid}</td>
                </tr>
                <tr>
                    <td>使用设备编号:</td>
                    <td>${infor.replay.eid}</td>
                </tr>
                <tr>
                    <td>使用设备数量:</td>
                    <td>${infor.replay.numbers}</td>
                </tr>
                <tr>
                    <td>师傅留言:</td>
                    <td>${infor.replay.detail}</td>
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
                        <td>评价:</td>
                        <td><textarea id="comment"></textarea></td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center"><input type="button" value="确认完成维修" id="btn2"></td>
                    </tr>
                </c:if>
                <c:if test="${infor.evaluate!=0}">
                    <tr>
                        <td>得分:</td>
                        <td>${infor.evaluate}</td>
                    </tr>
                    <tr>
                        <td>评价:</td>
                        <td>${infor.comment}</td>
                    </tr>
                </c:if>
            </table>
        </c:when>
    </c:choose>

</div>
</body>
</html>
