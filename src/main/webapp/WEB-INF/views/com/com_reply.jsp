<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if($.trim($('#category').val())==""){
		alert('카테고리를 선택하세요.');
		$('#category').focus();
		return false;
	}
	if($.trim($('#subject').val())==""){
		alert('제목을 입력하세요.');
		$('#subject').focus();
		return false;
	}
	if($.trim($('#content').val())==""){
		alert('내용을 이력하세요.');
		$('#content').focus();
		return false;
	}
}
</script>
<script src="resources/js/jquery-3.3.1.js"></script>
<script src="resources/js/bbs.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<c:set var="boarddata" value="${bbsbean}"/>
	<div class="container">
		<h2 class="bbswrite_title">답변 입력폼</h2>

		<form method="post" action="communityreply_ok">
							<input type="hidden" name="num" value="${boarddata.num}">

<input type="hidden" name="re_ref" value="${boarddata.re_ref}">
<input type="hidden" name="re_lev" value="${boarddata.re_lev}">
<input type="hidden" name="re_seq" value="${boarddata.re_seq}">
<input type="hidden" name="page" value="${page }">
			<table id="boardreply_t">

				<tr>
					<th class="well well-sm" style="text-align:center;">글쓴이</th>
					<td><input name="writer" id="writer" size="14" class="form-control"></td>
				</tr>
				<tr>
					<th class="well well-sm" style="text-align:center;">비밀번호</th>
					<td><input type="password" name="password" id="password"
						size="14" class="form-control"></td>
				</tr>
				<tr>
					<th class="well well-sm" style="text-align:center;">제목</th>
					<td><input name="subject" id="subject"
						class="form-control" value="re:${bbsbean.subject }"><input type="hidden" id="category" name="category" value="${boarddata.category }">
						<input type="hidden" id="filename" name="filename" value="${boarddata.filename }"><input type="hidden" id="filepath" name="filepath" value="${boarddata.filepath }"></td>
				</tr>
				<tr>
					<th class="well well-sm" style="text-align:center;">글내용</th>
					<td><textarea name="content" id="content" rows="15"
							cols="60" class="form-control"></textarea></td>
				</tr>
			</table>
			<div class="form-group">
				<input type="submit" value="등록" class="btn btn-lg"> <input
					type="reset" value="취소" class="btn btn-lg"
					onclick="$('#writer').focus();">
			</div>
		</form>
	</div>
</body>
</html>