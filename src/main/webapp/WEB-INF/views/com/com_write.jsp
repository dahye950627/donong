<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="resources/js/jquery-3.3.1.js"></script>
<!-- <script src="resources/js/bbs.js"></script> -->
<link href="resources/css/bbs.css" rel="stylesheet">
</head>
<body>
	<div id="comwrite_wrap">
		<h2 class="comwrite_title">커뮤니티 게시판 글쓰기</h2>
		<form method="post" action="communitywrite_ok" onsubmit="return check()"
		      enctype="multipart/form-data">
			<table id="comwrite_t">
				<!-- 
				<tr>
					<th>글쓴이</th>
					<td><input type="hidden" name="com_name" id="com_name" size="14"
						class="input_box"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="hidden" name="com_pass" id="com_pass"
						size="14" class="input_box"></td>
				</tr>
				 -->
				<tr>
					<th>제목</th>
					<td><input name="com_subject" id="com_subject" size="40"
						class="input_box"></td>
				</tr>
				<tr>
				<th>파일첨부</th>
				<td>
				<label for="upfile"><img src="resources/images/file_open.png" alt="파일열기"></label>
				<input type="file" id="upfile" name="uploadfile">
				<span id="filevalue"></span>&nbsp;
				<span id="close"><img src="resources/images/cancel.png"></span>
				</td>
				</tr>
				<tr>
				<th>분류</th>
				<td>
				<select>
				<option>선택하세요.</option>
				<option>잡담</option>
				<option>질문</option>
				<option>정보</option>
				<option>모임</option>
				</select>
				</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td><textarea name="com_cont" id="com_cont" rows="8"
							cols="50" class="input_box"></textarea></td>
				</tr>
				
			</table>
			<div id="comwrite_menu">
				<input type="submit" value="글쓰기" class="input_button"> <input
					type="reset" value="취소" class="input_button"
					onclick="$('#com_subject').focus();">
			</div>
		</form>
	</div>
</body>
</html>