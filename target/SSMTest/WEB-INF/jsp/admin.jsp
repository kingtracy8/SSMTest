<%--
  Created by IntelliJ IDEA.
  User: linsong.wei
  Date: 2017/10/14
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title> LayStudy Manager</title>
    <link rel="stylesheet" href="../../style/layui.css">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>

</head>
<body class="layui-layout-body">

<%
    String userName = (String) request.getSession().getAttribute("userName");
%>

<div class="layui-layout layui-layout-admin ">
    <div class="layui-header ">
        <div class="layui-logo">LayStudy Manager</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left ">
            <li class="layui-nav-item"><a href="#">控制台</a></li>
            <li class="layui-nav-item"><a href="">系统管理</a></li>
            <!--<li class="layui-nav-item"><a href="">用户</a></li>-->
            <li class="layui-nav-item">
                <a href="javascript:void(0)">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a  href="javascript:;">
                    <img src="../../images/me.jpg" class="layui-nav-img">
                    <span id="user"><%=userName%></span>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">数据管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">学生管理</a></dd>
                        <dd><a href="javascript:;">课程管理</a></dd>
                        <dd><a href="javascript:;">题库管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="error.html">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">关于</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">

        <div class="layui-tab layui-tab-brief" lay-filter="demo">
            <ul class="layui-tab-title">
                <li class="layui-this">欢迎</li>
                <li>日期</li>
                <li>分页</li>
                <li>上传</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">

                    <div class="layui-carousel" id="test1">
                        <div carousel-item>
                            <div><p class="layui-bg-green demo-carousel">Hi,欢迎您来到LayStudy后台管理系统！</p></div>
                            <div><p class="layui-bg-red demo-carousel">在数据管理中可以对一些基础数据进行操作</p></div>
                            <div><p class="layui-bg-blue demo-carousel">你也可以点击顶层导航来进入相应的管理页面</p></div>
                            <div><p class="layui-bg-orange demo-carousel">还可以在导航栏右侧设置管理员信息</p></div>
                            <div><p class="layui-bg-cyan demo-carousel">祝您工作顺利，生活愉快！</p></div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div id="laydateDemo"></div>
                </div>
                <div class="layui-tab-item">
                    <div id="pageDemo"></div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-upload-drag" id="uploadDemo">
                        <i class="layui-icon"></i>
                        <p>点击上传，或将文件拖拽到此处</p>
                    </div>
                </div>
            </div>
        </div>
        <blockquote class="layui-elem-quote layui-quote-nm">layui 2.0 提供强力驱动</blockquote>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="../../js/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
        layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element; //元素操作

        //向世界问个好
        layer.msg('Hi,欢迎您来到LayStudy后台管理系统！');

        //监听Tab切换
        element.on('tab(demo)', function(data){
            layer.msg('切换了：'+ this.innerHTML);
            console.log(data);
        });


        //执行一个轮播实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,height: 200
            ,arrow: 'none' //不显示箭头
            ,anim: 'fade' //切换动画方式
        });

        //将日期直接嵌套在指定容器中
        var dateIns = laydate.render({
            elem: '#laydateDemo'
            ,position: 'static'
            ,calendar: true //是否开启公历重要节日
            ,mark: { //标记重要日子
                '0-9-1': '开学'
                ,'2017-9-15': ''
                ,'2017-9-16': ''
            }
            ,done: function(value, date, endDate){
                if(date.year == 2017 && date.month == 9 && date.date == 15){
                    dateIns.hint('明天不上班');
                }
            }
            ,change: function(value, date, endDate){
                layer.msg(value)
            }
        });

        //分页
        laypage.render({
            elem: 'pageDemo' //分页容器的id
            ,count: 100 //总页数
            ,skin: '#1E9FFF' //自定义选中色值
            //,skip: true //开启跳页
            ,jump: function(obj, first){
                if(!first){
                    layer.msg('第'+ obj.curr +'页');
                }
            }
        });

        //上传
        upload.render({
            elem: '#uploadDemo'
            ,url: '' //上传接口
            ,done: function(res){
                console.log(res)
            }
        });
     //   window.location.href="../../html/admin.html";


    });
</script>
<script src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js">
    //alert($('#user'));
</script>
</body>
</html>
