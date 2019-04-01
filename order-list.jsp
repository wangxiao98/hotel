<%@page import="dao.DbOperation"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../controller/login/login_lock.jsp"%>
<%
	int i = 0;
	request.setCharacterEncoding("utf-8");   
	String date= request.getParameter("start");
	String phone= request.getParameter("phone_num");
	String sql = "select * from guest_order";
	ResultSet rs = DbOperation.getRs(sql);	
	int id[] = new int[200];
	String guest_name[] = new String[200];
	String phone_num [] = new String[200];
	int room_num[] = new int[100];
	Date enter_time[]=new Date[200];
	Date quit_time[] =new Date[200];
	float money[]=new float[200];
	int pay_state[]=new int[200];
	int is_exit[]=new int[200];
	int count=0;
	while(rs.next()){
		id[i] = rs.getInt("id");
		guest_name[i] = rs.getString("guest_name");
		phone_num[i] = rs.getString("phone_num");
		room_num[i] = rs.getInt("room_num");
		enter_time[i] = rs.getDate("enter_time");
		quit_time[i] = rs.getDate("quit_time");
		pay_state[i] = rs.getInt("pay_state");
		money[i] = rs.getFloat("money");
		is_exit[i]=rs.getInt("is_exit");
		if(is_exit[i]==0)
			count++;
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
  
  <body>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="" method="post">
          <input class="layui-input" placeholder="入住日期" name="start" id="start" autocomplete="off">
          <input type="text" name="phone_num"  placeholder="请输入手机号码" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
          <button class="layui-btn"  onclick="refresh()">刷新</button>
        </form>
      </div>
      <xblock>
        <span class="x-right" style="line-height:40px">共有数据：<%=count %> 条</span>
      </xblock>
      <table class="layui-table">
        <thead>
            <tr>
	            <th>订单编号</th>
	            <th>顾客名</th>
	            <th>手机号码</th>
	            <th>房间号</th>
	            <th>应付金额</th>
	            <th>支付状态</th>
	            <th>入住时间</th>
	            <th>退房时间</th>
	            <th>操作</th>
	            
            </tr>
        </thead>
        <tbody>
        <% for(int j=0;j<i;j++){ %>
        <%if(is_exit[j]==0) { %>
          <tr>
            <td><%=id[j] %></td>
            <td><%=guest_name[j] %></td>
            <td><%=phone_num[j] %></td>
            <td><%=room_num[j] %></td>
            <td contentEditable="true" ><%=money[j] %></td>
            <td class="td-status">
            <% 	if(pay_state[j] == 1){          	
            %>
              	<a  href="../../controller/order/pay_state.jsp?id=<%=id[j] %>"><span class="layui-btn layui-btn-normal layui-btn-mini">已支付</span></a></td>
            <% } 
            else{
            %>
            	<a  href="../../controller/order/pay_state.jsp?id=<%=id[j] %>"><span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">未支付</span></a></td>
             <%} %>	
             </td>
            <td><%=enter_time[j] %></td>
            <td><%=quit_time[j] %></td>
            <td class="td-status">
          
            	<a  href="../../controller/order/is_exit.jsp?id=<%=id[j] %>"><span class="layui-btn layui-btn-normal layui-btn-mini ">退房</span></a></td>
             
             </td>
           
          </tr>
            <%} %>
          <%} %>
        </tbody>
      </table>

    </div>
    <script>
      
    function refresh(){
    	window.location.reload();
    }
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

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
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