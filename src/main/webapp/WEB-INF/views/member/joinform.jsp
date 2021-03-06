<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<html>
<head>
 <title>나만따라와 도시농부</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <%@ include file="/resources/common/jsp/import.jsp" %>
<script>
//도로명 주소찾기 API


function Postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
           
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                /*      
                //1차 주소값에 ()안에 동을 추가 하고 싶을 경우 주석 제거
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
           */
 
             // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                
             
            } 
                


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postno').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addrdetail').focus();
        }
    }).open();
    
}

function domain_list(){
	if($("#mail_list").val()=="0"){
		//@뒤의 도메인 입력란 공백처리
		$("#join_maildomain").val("");
		//@뒤의 도메인입력란을 쓰기 가능
		$("#join_maildomain").attr("readOnly",false);
		//도메인 입력란으로 입력 대기 상태
		$("#join_maildomain").focus();
	} else {
	
		$("#join_maildomain").val($("#mail_list").val());
		$("#join_maildomain").attr("readOnly", true);
	}
}

function check(){
	
	//도메인 주소값 유효성검사
	if($.trim($("#join_maildomain").val())==""){
		alert("도메인주소를 선택하세요");
		$("#join_id").val("").focus();
		return false;
	}
	
	//비밀번호 일치여부 확인
	if($.trim($("#join_pwd").val())!=$.trim($("#join_passchk").val())){
		alert("비밀번호를 다시 확인하세요");
		$("#join_pwd").val("").focus();
		$("#join_passchk").val("").focus();
		return false;
	}
	
	var regNm = /^[가-힣]{2,15}|[a-zA-Z]{2,15}\s[a-zA-Z]{2,15}$/;	
	//이름 유효성 검사 정규식
	
	 if($("#join_name").val().length<2){
         alert("이름을 2자 이상 입력해주십시오.")
         $("#join_name").focus()
         return false;
     }else if(!regNm.test($("#join_name").val())){
    	 alert("한글,영문 대소문자만 사용 가능합니다");
    	 $("#join_name").focus();
         return false;
     }
	
	
	
	if($('#checkconfirmID').val()=="false" || checkid != $("#join_id").val()){
	
		$("#chkid").attr('class','btn btn-danger');
	
		alert("아이디 중복체크를 하세요");
		return false;
	}
		
	if($('#checkconfirmNickName').val()=="false" || checknickname != $("#join_nickname").val()){
		
		$("#chknick").attr('class','btn btn-danger');
		
		alert("별칭 중복체크를 하세요");
		return false;
	}
	
	alert($('#join_nickname').val()+" 님의 파종이 시작되었습니다.")
	
}

function id_check(){	
	var msg = '';
	
	if($.trim($("#join_id").val())==""){
		alert("아이디를 입력하세요");
		$("#join_id").val("").focus();
		return false;
	}else if($("#join_id").val().indexOf(" ") >= 0){
             $("#chkid").attr('class','btn btn-danger');
             $('#idcheck').css('color', 'red');
             $('#idcheck').text("ID에는 공백을 사용할 수 없습니다.");
             $("#join_id").focus();
             
             return false;
		}

	
	$('#idcheck').attr('');
	
	var inputId = $('#join_id').val();
	var checkId = /^[a-z]{1}[a-z0-9_]{3, 11}$/;


	$.ajax({
		type : "POST",
		data : {"id" : inputId},
		url : "checkOverlapId",
		cache : false,
		success: function(data){
			
			if(data == 0){
				$('#checkconfirmID').val('true');
				msg = '사용가능한 id입니다.';
				$('#idcheck').css('color', 'blue');
				checkid = inputId;
				$("#chkid").attr('class','btn btn-info');
			} else {
				msg = '사용중인 id입니다.';
				$('#idcheck').css('color', 'red');
				$('#idcheck').text(msg);
				$("#chkid").attr('class','btn btn-danger');
				return false;
			}
			
			$('#idcheck').text(msg);
		}
		
});	
	
}
	
	var checknickname ='';
	var inputNickname = '';
	
function nickname_check(){		
	if($.trim($("#join_nickname").val())==""){
		alert("별칭을 입력하세요");
		$("#join_nickname").val("").focus();
		return false;
	}
	
	$('#nicknamecheck').attr('');
	inputNickname = $('#join_nickname').val();
	
	var msg = '';

	$.ajax({
		type : "POST",
		data : {"nickname" : inputNickname},
		url : "checkOverlapNickName",
		cache : false,
		success: function(data){
			
			if(data == 0){
				$('#checkconfirmNickName').val('true');
				msg = '사용가능한 별칭입니다.';
				$('#nicknamecheck').css('color', 'blue');
				checknickname = inputNickname;
				$("#chknick").attr('class','btn btn-info');
			} else {
				msg = '사용중인 별칭입니다.';
				$('#nicknamecheck').css('color', 'red');
				$('#nicknamecheck').text(msg);
				$("#chknick").attr('class','btn btn-danger');
				return false;
			}
			
			$('#nicknamecheck').text(msg);
		}
		
});	
	}

function onlynum(){
	if(!((event.keyCode>=48&&event.keyCode<=57) // 숫자
			|| (event.keyCode>=96 && event.keyCode <= 105)  //키패드 숫자
			|| event.keyCode==8 || event.keyCode==116 || event.keyCode==9)){ //백스페이스  F5키(새로고침) tab키
		event.returnValue=false; //event 실행 불가
		alert("숫자만 입력할 수 있습니다.");
	}
}
	
	

</script>
<style>
body {
  align-items:top;

}
#join_table{
	margin:50px;
}

.title{
	margin:50px;
	}

.no-gutter > [class*='col-'] {
    padding-right:0;
    padding-left:0;
    width:10px;
    height:2px;
    text-align:center;
    margin:0 auto;
}

#and{
	
}
</style>

</head>
<body>


<div class="container text-center">

<input type="hidden" name="checkconfirmID" id="checkconfirmID" value="false">
<input type="hidden" name="checkconfirmNickName" id="checkconfirmNickName" value="false">
	
	<form name="joinform" method="post" action="member_join_ok" class="form-horizontal" onsubmit="return check()">

		<div id="join_table">
	
			<div class=title>
					<div class="form-group">
					<h2 class="col-sm-12">회원 가입 페이지</h2>
					</div>
			</div>		
			<div class="form-group">
				<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="join_id">ID</label>
				<div class="col-sm-3">
					<input name="id" id="join_id" class="form-control" placeholder="입력 후 중복체크를 해주세요" required><!-- ID 입력 칸 -->
                </div>
                <div class="col-sm-2">
           			<input id="chkid" type="button" value="ID 중복체크" class="btn btn-success" onclick="id_check()"> <!-- 중복체크 버튼 -->
           		</div>	
           		<div class="col-sm-2">	
           			<div id="idcheck"></div> <!-- 중복체크 결과 표시칸 -->
           		</div>	
           		<div class="col-sm-1"></div>
           		
			</div>
			
			<div class="form-group">
			<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="join_pwd">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="password" id="join_pwd" class="form-control" required>
				</div>
				<div class="col-sm-5"></div>
				
			</div>	
			
			<div class="form-group">
			<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="join_passchk">비밀번호확인</label>
				<div class="col-sm-3">
					<input type="password" name="join_passchk" id="join_passchk" class="form-control" required>
				</div>
				<div class="col-sm-5"></div>
			</div>	
			
			<div class="form-group">
			<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="join_nickname">별칭</label>
				<div class="col-sm-3">
					<input name="nickname" id="join_nickname" class="form-control" placeholder="활동할 닉네임입니다." required>
				</div>
				<div class="col-sm-2">	
					<input id="chknick" type="button" value="별칭 중복체크" class="btn btn-success" onclick="nickname_check()"> <!-- 중복체크 버튼 -->
           		</div>
           		<div class="col-sm-2">	
           			<div id="nicknamecheck"></div> <!-- 중복체크 결과 표시칸 -->
           		</div>	
           		<div class="col-sm-1"></div>
			</div>
			
			<div class="form-group">
			<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="join_name">성명</label>
				<div class="col-sm-3">
					<input name="realname" id="join_name" class="form-control" placeholder="실제성명을 입력해주세요." required>
				</div>
				<div class="col-sm-5"></div>
			</div>	
			
			<div class="form-group">
			<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="postbutton">우편번호</label>
					<div class="col-sm-2">
						<input type="text" id="postno" name="postnum" class="form-control" readonly>
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-2">
						<input type="button" id="postbutton" class="btn btn-success" value="주소검색" onclick="Postcode()">
					</div>	
				<div class="col-sm-3"></div>
			</div>
				
			<div class="form-group">
				<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="postbutton">주소</label>
				<div class="col-sm-5"><input type="text" id="addr" name="address" class="form-control" required readonly></div>
				<div class="col-sm-3"></div>
			</div>
			
			
			
				<div class="form-group">
					<div class="col-sm-2"></div>
					<label class="control-label col-sm-2" for="addrdetail">상세주소</label>
					<div class="col-sm-4">
						<input type="text" id="addrdetail" name="addressdetail" class="form-control" value=" ">
					</div>
					<div class="col-sm-4"></div>
				</div>
				
			<div class="form-group">
			<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="join_phone">휴대폰 번호</label>
				<div class="col-sm-3">
					<input name="phone" id="join_phone" class="form-control" placeholder="하이픈(-) 없이 입력해주세요" onkeydown="onlynum()" maxlength="11" required>
				</div>
				<div class="col-sm-5"></div>
			</div>
			
			<div class="form-group">
			<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="join_mailid">전자우편</label>
				
				<div class="col-sm-2">
					<input name="email" id="join_mailid" class="form-control" required>
				</div>	
				
				<div class="no-gutter">
				<div id="and" class="col-sm-1">
					@
				</div>
				</div>	
				<div class="col-sm-2">
					<input name="emaildomain" id="join_maildomain" class="form-control" readonly>
				</div>
					<div class="col-sm-2">
						<select name="mail_list" id="mail_list" class="form-control" onchange="domain_list()">
							<option value="">도메인선택</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="0">직접입력</option>
						</select>
					</div>	
				<div class="col-sm-1"></div>
			</div>
	
		</div>
			<div class="form-group text-center"> 
			<div class="col-sm-12">
					<input type="submit" value="회원가입" class="btn btn-success">
					<input type="button" value="취소" class="btn btn-danger" onclick="history.back()">
			</div>			
			</div>	
	</form>
</div>
</body>
</html>
