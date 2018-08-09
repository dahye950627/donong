<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/common/jsp/import.jsp" %>
<title>나만따라와 도시농부</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
<form action="del_ok" method="post" name="boardform">
<input type="hidden" name="num" value="${num }">
<input type="hidden" name="page" value="${page}">
<table>
	<tr class="center">
		<th colspan="2">커뮤니티 게시판 삭제</th>
		
	</tr>
	<tr class="center">
		<td colspan="2" class="h30 lime">
			<input type="submit" value="삭제" class="btn btn-lg">
			<input type="reset" value="취소" class="btn btn-lg" onClick="history.go(-1)">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>