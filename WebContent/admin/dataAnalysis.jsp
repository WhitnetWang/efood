<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">
	<head>
		<title>吃了么菜品数据分析管理</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
		<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/uniform.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/select2.css" />		
		<link rel="stylesheet" href="<%=path%>/admin/css/unicorn.main.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/unicorn.grey.css" class="skin-color" />
		<script src="<%=path%>/admin/js/jquery.min.js"></script>
        <script src="<%=path%>/admin/js/jquery.ui.custom.js"></script>
        <script src="<%=path%>/admin/js/bootstrap.min.js"></script>
        <script src="<%=path%>/admin/js/jquery.uniform.js"></script>
        <script src="<%=path%>/admin/js/select2.min.js"></script>
        <script src="<%=path%>/admin/js/jquery.validate.js"></script>
        <script src="<%=path%>/admin/js/unicorn.js"></script>
        <script src="<%=path%>/admin/js/unicorn.form_validation.js"></script>
        <script src="<%=path%>/js/echarts.common.min.js"></script>
        <script type="text/javascript">
    	
		    	$(function(){
		    		//发送ajax请求
		    		$.ajax({
					   type: "POST",
					   url: "${pageContext.request.contextPath}/getOrderData",
					   success: function(data){
						   var array = new Array();
					       var nums = new Array();
					       
					       //var length = data2.length;
					       var jsonData = eval('(' + data + ')');
					       
						   for(var i = 0; i < jsonData.length; i++){
						    	 array[i] = jsonData[i].name;
						    	 //console.log(i + " " + array[i]);
						    	 nums[i] = jsonData[i].num;
						   }
					     
						// 基于准备好的dom，初始化echarts实例
				            var myChart = echarts.init(document.getElementById('main'));
						
				            // 指定图表的配置项和数据
				            var option = {
				                title: {
				                    text: '吃了么  菜品数据分析'
				                },
				                tooltip: {},
				                legend: {
				                    data:['销量']
				                },
				                xAxis: {
				                    data: array
				                },
				                yAxis: {},
				                series: [{
				                    name: '销量',
				                    type: 'bar',
				                    data: nums
				                }]
				            };
		
				            // 使用刚指定的配置项和数据显示图表。
				            myChart.setOption(option);
					     
					   }
		    		
		    		});
		    		
		    	});
        
    </script>
	<body>
		<jsp:include page="/admin/optionsBar.jsp"/>
		<div id="content">
			<div id="content-header">
				<h1>菜品数据分析</h1>
			</div>
			
			<div id="breadcrumb">
				<a href="<%=path%>/admin/index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
				<a href="#" class="current">菜品数据分析</a>
			</div>
			
			<div class="widget-box">
				<div id="main" style="height:600px">
				</div>
			</div>
				
			</div>
				
			<div class="row-fluid">
		</div>
	</body>
</html>
