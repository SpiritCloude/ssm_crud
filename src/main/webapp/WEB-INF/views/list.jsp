<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<link rel="stylesheet" href="static/bootstrap-3.3.7/css/bootstrap.css">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="static/bootstrap-3.3.7/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="static/bootstrap-3.3.7/js/bootstrap.js"></script>

<%
	pageContext.setAttribute("Path", request.getContextPath());
%>
</head>
<body>
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" >
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">Name</label>
							<div class="col-sm-9 input-group">
								<input type="text" class="form-control" name="empName" id="name_add_input" placeholder="Name">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-9 input-group">
								<span class="input-group-addon">@</span>
								<input type="text" class="form-control" name="email" id="email_add_input" placeholder="Email">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputGender" class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="gender" value="男"> 男 </label>
								<label class="radio-inline">
									<input type="radio" name="gender" value="女"> 女 </label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Depertment</label>
							<div class="col-sm-3">
								<select class="form-control" name="dId" id="depts_add_list">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="emp_save_btn">Save</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-4 column col-md-offset-3">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-4 col-md-offset-7">
				<button type="button" class="btn btn-success" id="emp_add_modal_btn">新增</button>
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
									<c:when test="${num.count == 2}">
										<tr class="info">
									</c:when>
									<c:when test="${num.count == 4}">
										<tr class="success">
									</c:when>
								</c:choose>

								<td>${emp.empId }</td>
								<td>${emp.empName }</td>
								<td>${emp.gender }</td>
								<td>${emp.email }</td>
								<td>
									<button type="button" class="btn btn-primary btn-xs" id="edit_btn">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										编辑
									</button>

									<button type="button" class="btn btn-danger btn-xs" id="delt_btn">
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
			<div class="col-md-3 col-md-offset-1">当前${pInfo.pageNum }页,总${pInfo.pages }页,总${pInfo.total }条记录
			</div>
			<div class="col-md-5 col-md-offset-6">
				<nav aria-label="Page navigation">
				<ul class="pagination pagination">
					<li><a href="${Path}/emps?pNum=1"> 首页 </a></li>
					<c:if test="${pInfo.hasPreviousPage }">
						<li><a href="${Path}/emps?pNum=${pInfo.pageNum-1 }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:forEach items="${pInfo.navigatepageNums }" var="pNum">
						<c:if test="${pInfo.pageNum == pNum}">
							<li class="active"><span>${pNum }
								<span class="sr-only">(current)</span></span></li>
						</c:if>
						<c:if test="${pInfo.pageNum != pNum}">
							<li><a href="${Path}/emps?pNum=${pNum}"> ${pNum} </a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pInfo.hasNextPage }">
						<li><a href="${Path}/emps?pNum=${pInfo.pageNum+1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span> </a></li>
					</c:if>
					<li><a href="${Path}/emps?pNum=${pInfo.pages}"> 末页 </a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function reset_form(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}

		$("#emp_add_modal_btn").click(function() {
			reset_form("#empAddModal form");
			getDepts();
			$("#empAddModal").modal({
				backdrop : "static"
			});
		});

		function getDepts() {
			$("#depts_add_list").empty();
			$.ajax({
				url : "${Path}/depts",
				type : "GET",
				success : function(result) {
					console.log(result);
					$.each(result, function() {
						var optionEle = $("<option></option>").attr("value", this.deptId).append(this.deptName);
						optionEle.appendTo("#depts_add_list");
					});
				}
			});
		};

		function show_validate_msg(ele, status, msg) {
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			} else if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}
		};

			function validate_add_form() {
			var empNmae = $("#name_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,12}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.test(empNmae)) {
				show_validate_msg("#name_add_input", "error", "由6-12字母数字下划线或3-4位汉字组成");
				return false;
			} else {
				show_validate_msg("#name_add_input", "success", "");
			};

			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", "");
			};
			return true
		};

		$("#name_add_input").change(
				function() {
					var empName = this.value;
					$.ajax({
						url : "${Path}/checkEmpName",
						type : "POST",
						data : "empName=" + empName,
						success : function(result) {
							console.log(result);
							if (result.status) {
								show_validate_msg("#name_add_input", "success", "");
								$("#emp_save_btn").attr("aja-va", "success");
							} else {
								show_validate_msg("#name_add_input", "error",result.msg);
								$("#emp_save_btn").attr("aja-va", "error");
							};
						}
					});
				});

		$("#emp_save_btn").click(function() {
			if (!validate_add_form()) {
				return false;
			} 
			if ($(this).attr("aja-va") == "error") {
				return false;
			}
			$.ajax({
				url : "${Path}/emp",
				type : "POST",
				data : $("#empAddModal form").serialize(),
				success : function(result) {
					if(result.hasOwnProperty("empName")){
						show_validate_msg("#name_add_input", "error",result.empName);
					}
					if(result.hasOwnProperty("email")){
						show_validate_msg("#email_add_input", "error",result.email);
					}
					if(result.hasOwnProperty("row")){
						$("#empAddModal").modal("hide");
					}
					console.log(result);
				},
				error : function(XHR, Status, errorThrown) {
					alert(Status);
				},
			});
		});
	</script>
</body>
</html>