<%@page import="dao.DbOperation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../controller/login/login_lock.jsp"%>
<%
 		int i = 0;
		String sql = "select * from room_strandard_table";
		ResultSet rs = DbOperation.getRs(sql);	
		int id[] = new int[10];
		
		String room_name [] = new String[10];
		float price[]  = new float [10];
		while(rs.next()){
			id[i] = rs.getInt("id");
			
			room_name[i] = rs.getString("room_name");
			price[i] = rs.getFloat("price");
			i++;			
		}
		rs.close();
		int m = 0;
		String sql2 = "select * from room_infor";
		ResultSet rs2 = DbOperation.getRs(sql2);
		String room_name2[]=new String[200];
		int id2[] = new int[200];
		int room_num [] = new int[200];
		int clean[] = new int[200];
		int guest [] = new int[200];
		
		while(rs2.next()){
			id2[m] = rs2.getInt("id");
			room_num[m] = rs2.getInt("room_num");
			clean[m] = rs2.getInt("clean");
			guest[m] = rs2.getInt("guest");
			room_name2[m] = rs2.getString("room_name");
			m++;			
		} 
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>添加订单</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />     
    <link rel="stylesheet" href="lib/layui/css/layui.css">
    <script src="lib/layui/layui.js"></script>
	<style type="text/css">
		form{margin-top:35px;margin-left:60px;}
		div{margin-bottom:20px;}
		span{margin-right:20px;font-size:18px;}
		input{width:400px;height:25px;}
		select{height:25px;}
		.radio{width:30px;height:18px;}
		.roomnum{margin-right:30px;display:none;}
	</style>
</head>
<body>
   
   <div class="layui-container" style="padding-top:10px;">
   
   <span style="font-size:20px;">添加订单</span> 
   <button class="layui-btn"  onclick="refresh()">刷新</button>
   <form action="../../controller/order/orderadd.jsp" method="post" >
   		<div>
   			<span>用户姓名</span>
   			<input type="text" name="guest_name" required  lay-verify="required"/>
   		</div>
   		<div>
   			<span>身份证号</span>
   			<input type="text" name="id_card"  maxlength="18" required  lay-verify="required"/>
   		</div>  		
   		<div>
   			<span>手机号码</span>
				<input type="text" name="phone_num"  maxlength="11" id="phone"  required  lay-verify="required"/>
   			 
   		</div>
   		<div>
   			<span>房间类型</span>
   		<%for(int j=0;j<i;j++){ %>	
   		
   		<label><input required  lay-verify="required" name="room_name" type="radio" value=<%=j %> class="radio" onclick="display(this)"/><%=room_name[j] %> </label>
		
		<%} %>
				
		 <%for(int j=0;j<i;j++){ %>	
		
			<select class="roomnum" name="roomnum" >			
				<%for(int k=0;k<m;k++){ %>	
				<%if (guest[k]==0 && room_name2[k].equals(room_name[j])) {%>	
		   			<option name="room_num" value =<%=k %>><%=room_num[k] %></option>
		   			
                <%} %>
               
                <%} %>
            </select>					
		<%} %> 
   		</div>
   		<div>
   			<span>入住时间</span>
   			
   			<input name="enter_time" id="start"  autocomplete="off" required  lay-verify="required">
   		</div>
   		<div>
   			<span>退房时间</span>
   			<input name="quit_time" id="end"  autocomplete="off" required  lay-verify="required" >
   		</div>
   		<!-- <div>
   			<span>应付金额</span>
   			<input type="text" name="money" required  lay-verify="required" />
   		</div>
   		<div>
   			<span>支付状态</span>
   			<select name="pay_state" required  lay-verify="required">			
				<option  required  lay-verify="required" value ="0">未支付</option>
				<option  required  lay-verify="required"  value ="1">已支付</option>			
			</select>	
   		</div> -->
   	   		<div class="layui-form-item layui-container">
                <div class="layui-input-block">
                  <button class="layui-btn" lay-submit lay-filter="formDemo" onclick="yanzheng()">立即提交</button>
                </div>
            </div>       
   		
   </form>
     
    
</body>
<script type="text/javascript">
function refresh(){
	window.location.reload();
}
 
 Date.prototype.Format = function (fmt) {  
    var o = {  
        "M+": this.getMonth() + 1, //月份   
        "d+": this.getDate(), //日   
              
    };  
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
    for (var k in o)  
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));  
    return fmt;  
}

var enter_time = document.getElementById("start");
enter_time.value = new Date().Format("yyyy-MM-dd"); 
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
	function display(e){
		var a = document.getElementsByClassName("radio");
		var b = document.getElementsByClassName("roomnum");
		for(var i=0;i<a.length;i++){
			if(e.value!=a[i].value){
				 b[i].style.display = "none";	
				 
				
			}	
			else{
				b[i].style.display = "block";	
			}
			
		}
		
	}
	
</script>
</html>
