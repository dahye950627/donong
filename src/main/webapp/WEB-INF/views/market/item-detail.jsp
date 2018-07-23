<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<script src="/donong/resources/jquery/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/donong/resources/market/css/a.css">
	<link rel="stylesheet" type="text/css" href="/donong/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
	<script>
		function cartItem() {
			$.ajax({
				url: '/donong/market/cart/${itemNo}',
				method: 'post',
				data: {
					num: 6,
					goodsNum: '${item.num}',
					memberNum: '${sessionBean.memberNum}',
					quantity: $("#quantity").val()
				},
				success: function(result){
					location.href='/donong/market/cart/confirm';
				},
				error: function(res){
					alert('오류가 발생했습니다.');
				}
			});
		}
	</script>
	<title>Home</title>
	<style>
		html, body {
			margin: 0px;
			padding: 0px;
		}
		.item-count {
			width: 100px;
		}
		.item-info{
			height: 550px;
		}
		.item-info-image {
			margin-top: 50px;
		}
		.item-info-content {
			margin-top: 300px;
		}
	</style>
</head>
<body>
<div class="container">
	<form class="form-horizontal" action="/donong/market/order/item/${itemNo}" method="get">
	<div>
		<h1>타이틀임</h1>
	</div>
	<div class="container item-info">
	<div class="col-sm-5 item-info-image align-middle">
		<img class="img-responsive img-thumbnail" src="${item.filePath }"/>
	</div>
	<div class="col-sm-7 item-info-content align-middle">
		<div class="form-group"><label class="control-label col-lg-3" for="name">이름 : </label><p class="col-lg-9 form-control-static">${item.name }</p></div>
		<div class="form-group"><label class="control-label col-lg-3" for="price">가격 : </label><p class="col-lg-9 form-control-static">${item.price }원</p></div>
		<div class="form-group"><label class="control-label col-lg-3" for="number">수량 : </label><input type="number" class="form-control item-count col-lg-9" id="quantity" name="quantity" value="1"/></div>
	</div>
	</div>
	<div>${item.content }</div>
	<div>
		<input class="btn btn-default" type="submit" value="주문하기"/>
		<button class="btn btn-default" type="button" onclick="cartItem()">장바구니에 담기</button>
		<!--TODO ajax처리 예정 -->
	</div>
	</form>
</div>
</body>
</html>
