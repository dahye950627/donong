<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script>
		function pwd_find(){
		window.open("pwd_find","비번찾기","width=400,height=300");
		//자바 스크립트에서 window객체의 open("팝업창 경로와 파일명", "팝업창 이름", "팝업창 속성")
		//메서드로 새로운 팝업창을 만듬, 폭이 300 높이가 300인 새로운 팝업창을 만듬 단위는 픽셀
	}
	</script> 

	<title>로그인 페이지</title>
	
</head>
<body>

		<h2 class="login_title">로그인</h2>
			<form method="post" action="member_login_ok.nhn" onsubmit="return check()">
				<table id="login_t">
					<tr>
						<th>아이디</th>
					
						<td>
							<input name="id" id="id" size="20" class="input_box" 
							<c:if test="${!empty saveid }"> value="${saveid}" </c:if>>
						</td>
					</tr>	
					
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwd" id="pwd" size="20" class="input_box"></td>
					</tr>	
					
					<tr>
						<th>아이디 기억하기</th>
						<td>
						<input type="checkbox" name="saveid" id="saveid" 
						<c:if test="${!empty saveid }">checked</c:if>
						>
						</td>	
					</tr>
				</table>
		
		<div id="login_menu">
			<input type="submit" value="로그인" class="input_button">
			<input type="reset" value="취소" class="input_button" onclick="$('#id').focus();">
			<input type="button" value="회원가입" class="input_button" onclick="location='member_join'">
			<input type="button" value="비번찾기" class="input_button" onclick="pwd_find()">
		</div>
	</form>
	
	
</body>
</html>