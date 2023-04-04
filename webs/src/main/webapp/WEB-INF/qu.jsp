<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/jquery-3.6.0.js"></script>
<script type="text/javascript" src="scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">

	$(function(){



		$(".delete").click(function(){
			var pageNo = $("#pageNo").val();
			var pageSize =  $("#pageSize").val();

			var href=$(this).attr("href");
			$("#deleteForm").attr("action",href+"?pageNo="+pageNo+"&pageSize=" + pageSize).submit();



			return false;
		})


		$("#qqqq").change(function() {
			
		
			window.location.href="types?locale="+$(this).val();


		})



		//首页
		$("#firstPage").click(function(){

			var pageSize =  $("#pageSize").val();

			window.location.href="query?pageSize="+pageSize;
		})



		//上页
		$("#topPage").click(function(){

			var pageNo = $("#pageNo").val();
			var pageSize =  $("#pageSize").val();

			window.location.href="shangye?pageNo="+pageNo+"&pageSize="+pageSize;
		})

		//下页
		$("#nextPage").click(function(){


            var pageNo = $("#pageNo").val();
			var pageSize =  $("#pageSize").val();


			 window.location.href="xiaye?pageNo="+pageNo+"&pageSize="+pageSize;

		})


		//尾页
		$("#endPage").click(function(){
			var pageCount = $("#zhonggong").text();
			var pageSize =  $("#pageSize").val();
			window.location.href="weiye?pageNo="+pageCount+"&pageSize="+pageSize;

		})

		$("#meiye").change(function(){

			var pageSize = $(this).val();	  //5


			$("#pageSize").val(pageSize);  	  //5

			window.location.href="query?pageNo="+0+"&pageSize="+pageSize;




		})


		function fuzhi(){

			var pageNo = $("#pageNo").val();
			var jie1 = parseInt(pageNo) + 1  ;
			$("#dijiye").text(parseInt(jie1));

			var sums = '${sum}';
			$("#zhonggong").text(sums);

			if(jie1 == sums){

			 $("#nextPage").hide()
			}



			var pageSize =  $("#pageSize").val();
			$(".yi").val(parseInt(pageSize));
			$(".yi").text(parseInt(pageSize));


		}

	fuzhi()





	})
	


</script> 
</head>
<body>




<form action="" method="POST" id="deleteForm">
	<input type="hidden" name="_method" value="DELETE">
</form>
 
 
	
	<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<td>empid</td>
		<td><fmt:message key="user.name"></fmt:message></td>
		<td><fmt:message key="user.sex"></fmt:message></td>
		<td><fmt:message key="user.addr"></fmt:message></td>
		<td><fmt:message key="user.password"></fmt:message></td>
		<td>gsid</td>
 
		<td><fmt:message key="user.birth"></fmt:message></td>
		<td><fmt:message key="user.delete"></fmt:message></td>
		<td><fmt:message key="user.update"></fmt:message></td>
		<td>head</td>
	</tr>
	

	<c:forEach items="${requestScope.querys}" var="emp">
		<tr>
			<td>${emp.id}</td>
			<td>${emp.name}</td> 
			<td>${emp.sex == 0? '男' : '女' }</td>
			<td>${emp.addr}</td>
			<td>${emp.password}</td>
			<td>${emp.gs_id}</td>
	 
			<td><fmt:formatDate value="${emp.birth}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		
			<td><a class="delete" href="emp/${emp.id}">删除</a></td>
			 <td><a href="emp/${emp.id}">修改</a></td> 
			 
			 <c:set var="hs" scope="request" value="${emp.head}"></c:set> 
			<td>
			<img alt="" height="50px" width="50px" src="xiazaizai?path=<%=java.net.URLEncoder.encode(String.valueOf(request.getAttribute("hs")))%>"> 
			</td>
			
		</tr>




	</c:forEach>
	</table>
 <br><br>
      <a href="emp">添加</a>
<br>
<br>

点击导出：<form action="daochu" method="post">
	<input type="submit">
</form>
<br>
<br>

直接导入：<form action="ru" method="post">
	<%--<input type="" name="daoru"><br>--%>
	<input type="submit">
</form>
<br>
<br>
选择导入：<form action="daorus" method="post" enctype="multipart/form-data">
	<input type="file" name="daoru">
	<input type="submit">
</form>
      
      
    <%--  <form action="qws" method="post">
      	<input type="submit" value="导出">
      </form>


        <form action="import" method="post" enctype="multipart/form-data">
		<input type="file" name="import">
		<input type="submit" value="导入数据库">
      </form>--%>

      
   <select id="qqqq">
      <option value="zh_CN">中文</option>
      <option value="en_US" <c:if test="${qqqq=='en_US'}">selected</c:if> > English</option>
      </select>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



<br>
<c:set var="limit" scope="request" value="${requestScope.limits}"></c:set>

<a href="#" id="firstPage" >首页</a>&nbsp;&nbsp;
	<c:if test="${limit != 0}">
<a href="#" id="topPage">上页</a>&nbsp;&nbsp;
	</c:if>

<a href="#" id="nextPage">下页</a>&nbsp;&nbsp;

<a href="#" id="endPage" class="wei">尾页</a>&nbsp;&nbsp;

当前是第<font color="red" id="dijiye"></font>页&nbsp;&nbsp;


总共<font color="red" id="zhonggong" value=""></font>页&nbsp;&nbsp;
<!-- &nbsp;&nbsp; 每页<font color="red" id="meiye"></font>页 -->


<!-- &nbsp;&nbsp; 每页<font color="red" id="meiye"></font>页 -->
每页查:
<select id="meiye">
	<option value="" class="yi"></option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>

</select>
条
<br>
<br>
<br>
<br>


<c:set var="pseize" scope="request" value="${requestScope.sizes}"></c:set>
<input type="hidden" name="pageSize" id="pageSize" value="${pseize}"> <!-- 一页显示多少行 -->


<input type="hidden" name="pageNo" id="pageNo" value="${limit}">  <!-- 当前第几页 -->



 
</body>
</html>