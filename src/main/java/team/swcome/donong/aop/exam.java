/*<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="./css/joinform.css" rel="stylesheet">
<link href="./css/prettydropdowns.css" rel="stylesheet">

<script async defer src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDD7mtT6-3PmOJs9HEjXxrBwKryFLPGffU&callback=initMap&libraries=places'></script>

<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<script src="./js/member.js"></script>
<script src="./js/jquery.prettydropdowns.js"></script>

<div id="sticky">
	<form name="joinform" action="joinProcess.me" method="post">
		<div id="first">
			<div id="form-title">
				<span>
					<h3>NICE2MEETU.COM�� ����Ͻʽÿ�</h3>
					<b>Nice2MeetU.COM</b>ȸ�������� ���Ͻø� �Ʒ� ����� �ۼ��� �ֽʽÿ�.<br>
					���� ���� ������ ���� �������ֽ� ������ �����մϴ�.
				</span>
			</div>
			
			<div class="form-row subTitle">
				<h3>����� ����</h3>
			</div>
			
			<div class="form-row">
				<label>ID</label>
				<div class="secondCol halfLen">
					<input type="text" name="id" id="id"> 
					<input type="button" id="idcheck" value="ID�ߺ��˻�"><br>
					<span id="message"></span>
				</div>
			</div>
			
			<div class="form-row">
				<label>�г���</label>
				<div class="secondCol halfLen">
					<input type="text" id="nickname" name="nickname">
					<input type="button" id="nicknamecheck" value="�г����ߺ��˻�"><br>
					<span id="nickmessage"></span>
				</div>
			</div>
			
			<div class="form-row">
				<label>E-mail</label>
				<div class="secondCol triLen">
					<input type="text" name="email" id="email">
					@ <input type="text" name="domain" id="domain">
					<select name="sel" id="sel">
						<option value="">�����Է�</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
				</div>
			</div>
			
			<div class="form-row">
				<label>��й�ȣ</label> 
					<div class="secondCol fullLen">
					<input type="password" id="password" name="password">
				</div>
			</div>
						
			<div class="form-row">	
				<label>��й�ȣ Ȯ��</label>
				<div class="secondCol fullLen"> 
					<input type="password" id="passcheck" name="passcheck">
				</div>
			</div>
		</div>
		
		<div id="second">
			<div class="form-row subTitle">
				<h3>����ó ����</h3>
			</div>
			
			<div class="form-row">
				<label>����ó</label>
				<div class="secondCol telLen">
					<select name="brandsel"	id="brandsel">
						<option value="LGU+">LGU+</option>
						<option value="SKT">SKT</option>
						<option value="KT">KT</option>
					</select>
					<input type="text" name="phone" id="phone"><br>
				</div>
			</div>
			
			<div class="form-row">
				<label>�����ȣ</label>
				<div class="secondCol halfLen">
					<input type="text" id="post" name="post" class="postcodify_postcode5" />
					<input type="button" id="postcodify_search_button" value="�����ȣ ã��"><br> 
				 </div>
			 </div>
			 
			 <div class="form-row">
				<label>�ּ�</label>
				<div class="secondCol fullLen">
					<input type="text" id="address" name="address" class="postcodify_address" size=40  /><br>
				 </div>
			 </div>
			 
			 <div class="form-row">
				<label>���ּ�</label>
				<div class="secondCol fullLen"> 
					<input type="text" name="detailaddress" size=40><br>
				</div>
			</div>
		</div>
		
		<div class="form-row subTitle">
			<h3>�⺻ ��ġ ����</h3>
		</div>
		<div class="form-row">
			<div id="locationField">
				<input id="autocomplete" placeholder="�˻��� ��Ҹ� �Է��ϼ���." type="text" />
			</div>
			<div id="map"></div>
			<input type="hidden" id="markerLat" name="markerLat">
			<input type="hidden" id="markerLng" name="markerLng">
		</div>
		
		<div class="form-row last-row">
			<span class="check" id="check1">&#xe803;</span>
			<h3>��� �׸� üũ�ϱ�</h3><br>
			<span class="check sub" id="check2">&#xe803;</span>
			<h3>* ���������� ���� �� �̿뿡 ���� ���� �ڼ��� ����</h3><br>
			<span class="check sub" id="check3">&#xe803;</span>
			<h3>* ���������� ���� ������ ���� ���� �ڼ��� ����</h3><br>
			<span class="check sub" id="check4">&#xe803;</span>
			<h3>�������� ������ ���� ���������� ���� �� �̿뿡 ���� ���� �ڼ��� ����</h3>
		</div>
		
		<div class="form-row">
			<div id="clearfix">
				<button type="submit" class="submitbtn">ȸ������</button>
				<button type="reset" class="cancelbtn">�ٽ� �ۼ�</button>
			</div>
		</div>
		
	</form>
</div>
*/