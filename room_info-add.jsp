<%@page import="dao.DbOperation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../controller/login/login_lock.jsp"%>
<!doctype html>
<html lang="">
<head>
	<meta charset="UTF-8">
	<title>添加房间</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />     
    <link rel="stylesheet" href="lib/layui/css/layui.css">
    <script src="lib/layui/layui.js"></script>
    

</head>
<body>
<a href="room_info.jsp" >
	   <button class="layui-btn layui-btn-sm">
	  		<i class="layui-icon layui-icon-left "></i> 返回上一级
	  	</button>
  	</a>
   <div class="layui-container" style="padding-top:10px;">
   
   <span style="font-size:20px;">添加房间信息</span> 
        <form action="../../controller/room/roominfo_add.jsp" method="post" style="margin-top:30px;">
            <div class="layui-form-item">
                <label class="layui-form-label">房&nbsp;型&nbsp;名</label>
                <div class="layui-input-block">
                    <input type="text"  required  lay-verify="required"  autocomplete="off" class="layui-input" name="room_name">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">房&nbsp;间&nbsp;号</label>
                <div class="layui-input-block">
                    <input type="text"  required  lay-verify="required"  autocomplete="off" class="layui-input" name="room_num">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">楼&nbsp;&nbsp;&nbsp;&nbsp;层</label>
                <div class="layui-input-block">
                    <input type="text"  required  lay-verify="required"  autocomplete="off" class="layui-input" name="floor">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否清理</label>
                <div class="layui-input-block" style="padding-top:11px;">
                    <input type="radio"    name="clean" value="1">有
                    <input type="radio"    name="clean" value="0">无
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否有客</label>
                <div class="layui-input-block" style="padding-top:11px;">
                    <input type="radio"   name="guest" value="1">有
                    <input type="radio"   name="guest" value="0">无
                </div>
            </div>
            <div class="layui-form-item layui-container">
                <div class="layui-input-block">
                  <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                </div>
            </div>           
        </form>
</body>
</html>