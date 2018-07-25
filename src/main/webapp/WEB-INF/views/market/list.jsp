<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/donong/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
	<title>Home</title>
	<style>
		.sidenav {
		    height: 100%; /* Full-height: remove this if you want "auto" height */
		    width: 160px; /* Set the width of the sidebar */
		    position: fixed; /* Fixed Sidebar (stay in place on scroll) */
		    z-index: 1; /* Stay on top */
		    top: 0; /* Stay at the top */
		    left: 0;
		    background-color: #CCFFDD; /* Black */
		    overflow-x: hidden; /* Disable horizontal scroll */
		    padding-top: 20px;
		}
		.main {
			margin-left: 160px;
		}
		.sidenav a {
		    padding: 6px 8px 6px 16px;
		    text-decoration: none;
		    font-size: 25px;
		    color: #818181;
		    display: block;
		}
		.item-img {
			margin-left: 5px;
			margin-top: 3px;
			margin-bottom: 3px;
			height: 167px;
		}
		.item-cell {
			display: inline-block;
		}
		.item-name {
			width: 500px;
		}
		.item-price {
			width: 400px;
		}
	</style>
</head>
<body>
<div class="main container">	
	<div class="sidenav">
		<a href="/donong/market?category=seed">모종 씨앗</a>
		<a href="/donong/market?category=fertilizer">비료</a>
		<a href="/donong/market?category=tools">도구</a>
	</div>
	<div class="container">
	<div>
		<h1>타이틀임</h1>
	</div>
	<div class="container-fluid">
		<c:forEach items="${items}" var="item">
			<%@ include file="/WEB-INF/views/market/list-item.jsp" %>
		</c:forEach>
	</div>
	<ul class="pagination">
		<c:forEach begin="${page.start}" end="${page.end}" varStatus="status">
			<c:choose>
				<c:when test="${page.current == status.index }">
					<li class="active"><a href="#">${status.index}</a></li>
				</c:when>
			
				<c:otherwise>
				<li><a href="#">${status.index}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
	</div>
</div>
</body>
</html>
