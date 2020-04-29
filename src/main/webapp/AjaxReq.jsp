<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<link rel="stylesheet" href="static/bootstrap-3.3.7/css/bootstrap.css">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="static/bootstrap-3.3.7/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="static/bootstrap-3.3.7/js/bootstrap.js"></script>

<%	pageContext.setAttribute("Path", request.getContextPath());
%>
</head>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-4 column col-md-offset-3"><h1>SSM-CRUD</h1></div>
		</div>
		<div class="row clearfix">
			<div class="col-md-4 column col-md-offset-7">
				<button type="button" class="btn btn-success">新增</button>
				<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<form action="">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Gender</th>
								<th>Email</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${pInfo.list }" var="emp" varStatus="num">
						<c:choose>
							<c:when test="${num.count == 2}"> <tr class="info"></c:when>
							<c:when test="${num.count == 4}"> <tr class="success"></c:when>
						</c:choose>	
							
								<td>${emp.empId }</td>
								<td>${emp.empName }</td>
								<td>${emp.gender }</td>
								<td>${emp.email }</td>
								<td>
									<button type="button" class="btn btn-primary btn-xs">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										编辑
									</button>

									<button type="button" class="btn btn-danger btn-xs">
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										删除
									</button>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-3 col-md-offset-1">
				当前${pInfo.pageNum }页,总${pInfo.pages }页,总${pInfo.total }条记录
			</div>
			<div class="col-md-5 col-md-offset-6">
				<nav aria-label="Page navigation">
				<ul class="pagination pagination">
					<li><a href="${Path}/emps?pNum=1"> 首页 </a></li>
					<c:if test="${pInfo.hasPreviousPage }">
					<li><a href="${Path}/emps?pNum=${pInfo.pageNum-1 }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:forEach items="${pInfo.navigatepageNums }" var="pNum">
						<c:if test="${pInfo.pageNum == pNum}">
							<li class="active"><span>${pNum }<span class="sr-only">(current)</span></span></li>
						</c:if>
						<c:if test="${pInfo.pageNum != pNum}">
							<li><a href="${Path}/emps?pNum=${pNum}"> ${pNum} </a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pInfo.hasNextPage }">
						<li><a href="${Path}/emps?pNum=${pInfo.pageNum+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span> </a></li>
					</c:if>
					<li><a href="${Path}/emps?pNum=${pInfo.pages}"> 末页 </a></li>
				</ul>
				</nav>
			</div>
		</div>

	</div>
</body>

</html>