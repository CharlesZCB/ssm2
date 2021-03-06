<%@page import="com.cn.bean.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());

%>

<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/My97DatePicker/WdatePicker.js"></script>
<script src="${path }/static/down/js/jquery.editable-select.js" ></script>
<link  rel="stylesheet"  type="text/css"  href="${path }/static/down/css/jquery.editable-select.css"/>

<style type="text/css">


.b{
    border:1px 
    width:500px;
    height:40px;
    position:absolute;
    left:50%;
    bottom:0%;
    margin-left:-170px;
   /* margin-top:-190px;*/

}
</style>
<link rel="stylesheet" type="text/css" href="${path }/static/css/selectFilter.css" />
<style type="text/css">
	.item {
		width: 240px;
		height: 32px;
		margin: 100px auto;
	}
</style>

</head>

<body style="overflow-x: hidden">
<div class="row" style="background-color: #dcdc;">
<div class="col-md-2">
<jsp:include page="/WEB-INF/jsp/page/navbar_left.jsp"></jsp:include>
</div>

<div class="col-md-10">
<div>
<jsp:include page="/WEB-INF/jsp/page/navbar_top.jsp"></jsp:include>
<div id="time" style="float: right; margin-right: 100px;"></div>
</div>
</div>
</div>



<div style="margin-left: 200px;margin-right: 50px;">

<h3>添加班级管理</h3>

<!-- 显示年份 -->

<form action="addclass" accept-charset="UTF-8" method="post">

<table class="table table-bordered">
<tr>
<td style="text-align: center;"><label>所属级别：</label></td>
<td style="text-align: center;"><input onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy'})" type="text" name="jibie" required="required"/></td>
</tr>

<tr>
<td style="text-align: center;"><label>班级名：</label></td>
<td style="text-align: center;">
<select name="classname">
		    <option value="" selected="selected">--请选择开设班级--</option>
			<option value="软件工程">软件工程</option>
			<option value="软件技术">软件技术</option>
			<option value="计算机科学与技术">计算机科学与技术</option>
			<option value="物联网工程">物联网工程</option>
			<option value="日语专业">日语专业</option>
			<option value="微电子科技与技术">微电子科学与技术</option>
			<option value="微电子科技与技术">数据挖掘与数据分析</option>
			<option value="微电子科技与技术">智能集成</option>
		</select>
</td>
</tr>

<tr>
<td style="text-align: center;"><label>班主任：</label></td>
<td style="text-align: center;">
<select id="editable-select" name="daoyuan" required="required">
		<option value="" selected="selected">请选择老师</option>
		<c:forEach var="lists" items="${list }"> 
		    <option value="${lists.tcode }">${lists.tname }</option> 
		 </c:forEach>
		</select> 
</td>
</tr>
<tr>
<td></td>
<td colspan="1" style="text-align: center;">
<button type="submit" class="btn btn-default" style="margin-right: 10px;">
<span class="glyphicon glyphicon-ok"></span>
提交数据库</button>
<button type="button" class="btn btn-default" onclick="backpage()">
 <span class="glyphicon glyphicon-share-alt"></span>  
返回前页
</button>
</td>
</tr>
</table>
</form>
</div>


<script type="text/javascript" src="${path }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path }/static/js/selectFilter.js"></script>
<script type="text/javascript">
	
	//这里是初始化
	$('.filter-box').selectFilter({
		callBack : function (val){
			//返回选择的值
			console.log(val+'-是返回的值')
		}
	});
</script>
<script type="text/javascript">
		$('#editable-select').editableSelect({ 
		    bg_iframe: true,

	       case_sensitive: false, 
	       items_then_scroll: 10 ,
	       isFilter:false
		}); 
		
		function backpage(){
			window.history.back(-1);
		}
	</script>
</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>
