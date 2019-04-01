<%@page import="dao.DbOperation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../controller/login/login_lock.jsp"%>
<%
    String id = request.getParameter("id");
	String sql = "select * from room_strandard_table where id='"+id+"'";
	ResultSet rs = DbOperation.getRs(sql);	
	float room_area=0;
	float price=0;
	int bed_num=0 ;
	int aircondition=0;
	int bathroom=0;
	int wifi=0;
	String room_name=null;
	
	while(rs.next()){
		room_area = rs.getFloat("room_area");
		bed_num= rs.getInt("bed_num");
		aircondition = rs.getInt("aircondition");
		bathroom = rs.getInt("bathroom");
		wifi = rs.getInt("wifi");
		room_name = rs.getString("room_name");
		price = rs.getFloat("price");
} 
%>
<!doctype html>
<html lang="">
<head>
	<meta charset="UTF-8">
	<title>修改房间类型</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />     
    <link rel="stylesheet" href="lib/layui/css/layui.css">
    <script src="lib/layui/layui.js"></script>
    

</head>
<body 	>
<a href="room_strandard.jsp" >
	   <button class="layui-btn layui-btn-sm">
	  		<i class="layui-icon layui-icon-left "></i> 返回上一级
	  	</button>
  	</a>
   <div class="layui-container" style="padding-top:10px;">
   
   <span style="font-size:20px;">修改房间类型</span> 
        <form action="../../controller/room/roomstrandard_edit.jsp" method="post" style="margin-top:30px;">
             <input type="text" hidden name="id" value=<%=id%>>
            <div class="layui-form-item">
                <label class="layui-form-label">房型名</label>
                <div class="layui-input-block">
                    <input type="text"  required  lay-verify="required"  autocomplete="off" class="layui-input" name="room_name" value=<%=room_name%> disabled>
                    <input type="text"  required  lay-verify="required"  autocomplete="off" class="layui-input" name="room_name" value=<%=room_name%> style="display:none;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">面&nbsp;&nbsp;&nbsp;&nbsp;积</label>
                <div class="layui-input-block">
                    <input type="text"  required  lay-verify="required"  autocomplete="off" class="layui-input" name="room_area" value=<%=room_area%>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">床&nbsp;&nbsp;&nbsp;&nbsp;数</label>
                <div class="layui-input-block">
                    <input type="text"  required  lay-verify="required"  autocomplete="off" class="layui-input" name="bed_num" value=<%=bed_num%>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">价&nbsp;&nbsp;&nbsp;&nbsp;格</label>
                <div class="layui-input-block">
                    <input type="text"  required  lay-verify="required"  autocomplete="off" class="layui-input" name="price" value=<%=price%>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">空&nbsp;&nbsp;&nbsp;&nbsp;调</label>
                <div class="layui-input-block" style="padding-top:11px;">
                 <%if(aircondition==1){ %>
                    <input type="radio"  checked="checked"   name="aircondition" value="1">有
                     <input type="radio"   name="aircondition" value="0">无
                    <%} %>
                    <%if(aircondition==0){ %>
                    <input type="radio"   name="aircondition" value="1">有
                    <input type="radio"  checked="checked"   name="aircondition" value="0">无
                     <%} %>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">独&nbsp;&nbsp;&nbsp;&nbsp;卫</label>
                <div class="layui-input-block" style="padding-top:11px;">
                     <%if(bathroom==1){ %>
                    <input type="radio"  checked="checked"   name="bathroom" value="1">有
                     <input type="radio"   name="bathroom" value="0">无
                    <%} %>
                    <%if(bathroom==0){ %>
                    <input type="radio"   name="bathroom" value="1">有
                    <input type="radio"  checked="checked"   name="bathroom" value="0">无
                     <%} %>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">&nbsp;&nbsp;wifi&nbsp;&nbsp;</label>
                <div class="layui-input-block" style="padding-top:11px;">
                  <%if(wifi==1){ %>
                    <input type="radio"  checked="checked"   name="wifi" value="1">有
                     <input type="radio"   name="wifi" value="0">无
                    <%} %>
                    <%if(wifi==0){ %>
                    <input type="radio"   name="wifi" value="1">有
                    <input type="radio"  checked="checked"   name="wifi" value="0">无
                     <%} %>
                </div>
            </div>
            <div class="layui-form-item layui-container">
                <div class="layui-input-block">
                  <button class="layui-btn" lay-submit lay-filter="formDemo" >提交</button>
                  
                </div>
            </div>           
        </form>
</body>
</html>