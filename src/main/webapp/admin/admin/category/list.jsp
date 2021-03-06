<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>查看分类</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<script src="<c:url value='/js/jquery-1.8.3.min.js'/>" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap-theme.css'/>" />
<script src="<c:url value='/js/bootstrap.min.js'/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value='/js/application.js'/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value='/js/admin/Categorylist.js'/>" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
        function shows(id) {
            $('#light').html('');
            $.ajax({
                type:'get',
				url:'/admin/findCategoryById.elect?id='+id,
				dateType:'json',
				success:function (data) {
                    var list =$.parseJSON(data);
                   $.each(list,function (index,obj) {
                       $('#light').append('<h2>'+obj.name+'</h2>');
                   })
                },
                error:function () {
					alert("错误");
                }
			});
            $('#light').css('display','block');
        }
        function closed()
        {
            $('#light').css('display','none');
        }


	</script>

</head>

<style type="text/css">
.mycenter {
	margin-top: 10%;
}
.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 23%;
	width: 25%;
	height: 60%;
	padding: 10px;
	border: 5px solid orange;
	background-color: white;
	z-index:1002;
	overflow: auto;
}
</style>

<body>

	<div id="html_top"
		class="row navbar-inverse   navbar-static-top navbar-fixed-top"
		role="navigation">
		<jsp:include page="../top.jsp"></jsp:include>
	</div>
	<div class="container  mycenter">
		<div id="html_left" class="row col-lg-3">
			<jsp:include page="/admin/admin/left.jsp"></jsp:include>
		</div>
		<div class="row col-lg-9 col-lg-offset-0">
			<h2 class="page-header text-info" style="text-align: center;">分类列表</h2>
			<table class="table table-hover text-center">
				<tr class="text-warning" id="th">
					<th class="text-center">分类名称</th>
					<th class="text-center">操作</th>
				</tr>

				<c:forEach items="${category.categories }" var="subCat">
					<tr bordercolor="rgb(78,78,78)"  id="parentCategory">
						<td class="text-center parentCategory" >
						  <a href="javascript:;"  onmouseover="shows(${subCat.id})" onmouseout="closed()">${subCat.name }</a>
						</td>
						<input type="hidden" id="cid" value="${subCat.id}"/>
						<div id="light" class="white_content">
						</div>
						<td><a class="btn btn-group-lg btn-warning"
							href="<c:url value='/admin/AdminEditCategory.elect?cid=${subCat.id }'/>">修改</a>
							<a class="btn  btn-group-lg btn-danger"
							   href="<c:url value='/admin/AdminDeleteCategory.elect?cid=${subCat.id }'/>">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>