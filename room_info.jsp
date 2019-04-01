<%@page import="dao.DbOperation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../controller/login/login_lock.jsp"%>
<%
 		int i = 0;
		String sql = "select * from room_infor";
		ResultSet rs = DbOperation.getRs(sql);	
		int id[] = new int[200];
		String room_name [] = new String[200];
		int room_num [] = new int[200];
		int floor [] = new int[200];
		int clean[] = new int[200];
		int guest [] = new int[200];
		
		while(rs.next()){
			id[i] = rs.getInt("id");
			room_name[i] = rs.getString("room_name");
			room_num[i] = rs.getInt("room_num");
			floor[i] = rs.getInt("floor");
			clean[i] = rs.getInt("clean");
			guest[i] = rs.getInt("guest");
			i++;			
		} 
		
%>

<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body class="layui-anim layui-anim-up" style="margin-top:10px;">
      <xblock>
        <a href="room_info-add.jsp"><button class="layui-btn" ><i class="layui-icon"></i>添加房间信息</button></a>
        <span class="x-right" style="line-height:40px">共有数据：<%=i%> 条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>类型</th>
            <th>房间号</th>
            <th>楼层</th>
            <th>是否清洁</th>
            <th>是否有客</th>
            <th>操作</th></tr>
        </thead>
        <tbody>
        <% for(int j = 0;j<i;j++){ %>
          <tr>
            <td><%=id[j] %></td>
            <td><%=room_name[j] %></td>
            <td><%=room_num[j] %></td>
            <td><%=floor[j] %></td>
            <td class="td-status">
            <% 	if(clean[j] == 1){          	
            %>
              	<a  href="../../controller/room/clean_state.jsp?id=<%=id[j] %>"><span class="layui-btn layui-btn-normal layui-btn-mini">是</span></a></td>
            <% } 
            else{
            %>
            	<a  href="../../controller/room/clean_state.jsp?id=<%=id[j] %>"><span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">否</span></a></td>
             <%} %>	
             </td>
            <td class="td-status">
            <% 	if(guest[j] == 1){          	
            %>
              	<a  href="../../controller/room/guest_state.jsp?id=<%=id[j] %>"><span class="layui-btn layui-btn-normal layui-btn-mini">是</span></a></td>
            <% } 
            else{
            %>
            	<a  href="../../controller/room/guest_state.jsp?id=<%=id[j] %>"><span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">否</span></a></td>
             <%} %> </td>
            <td class="td-manage">
              <a title="编辑"  onclick="x_admin_show('编辑','member-edit.html',600,400)" href="room_info-edit.jsp?id=<%=id[j] %>">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除" onclick="member_del(this,'要删除的id')" href="../../controller/room/roominfo_del.jsp?id=<%=id[j] %>">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
           <%} %>
        </tbody>
      </table>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });
      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }
      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>