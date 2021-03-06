<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
 <title>나만따라와 도시농부</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/resources/common/jsp/import.jsp" %>
  
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
 
    
    /* Set black background color, white text and some padding */
    footer {
      background-color:  #ACD17F;
      color: white;
      padding: 15px;
     	text-align:center;
     	height:60px;
    }
      .row.content {height: auto;} 

	.mypage-buy{
		
		margin-top:50px;
	}
	

	.mypage-write{
		margin-top:50px;
		margin-bottom:50px;
	}
	
	.pagination > .active > a{
	background-color:  #ACD17F;
	border-color: #ACD17F;
	}
	
	.pagination > .active > a:hover {
	background-color:  #ACD17F;
	border-color: #ACD17F;
	}

  </style>
</head>
<body>
  <%@include file="../common/header.jsp" %>
  
  <div class="container mypage-buy">
  <div class="row">
  <div class="container text-center">
  <h2>구매 내역</h2>
  <p><b>${sessionBean.nickname}</b>님의 구매내역 입니다.</p>  
  </div>
  </div>
<div class="row">  
  <div class="col-sm-2"></div>
    <div class="col-sm-8" align="right">   
      <font size=2>구매 건수 : ${listcount}</font>       
  <table class="table table-hover">
    <thead>
      <tr>
        <th>상품명</th>
        <th>배송상태</th>
        <th>구매일</th>
      </tr>
    </thead>
    <tbody>
    <c:set var="num" value="${listcount-(page-1) * limit}"/>
  	  <c:forEach var="order" items="${orderlist}">
      	<tr>
      		<td>
     	 		${order.goods.get(0).name }  	 
     	 	</td>
     	 	<td>
     	 		 <c:if test="${order.status=='npay'}">
     	 			입금대기
     	 		 </c:if>
     	 		  <c:if test="${order.status=='prep'}">
     	 			배송준비
     	 		 </c:if>
     	 		  <c:if test="${order.status=='send'}">
     	 			배송진행
     	 		 </c:if>
     	 		  <c:if test="${order.status=='arrv'}">
     	 			배송완료
     	 		 </c:if>
     	 	</td>
     	 	<td>
     	 	${order.orderDate } 
     	 	</td>
   	   </tr>
     </c:forEach> 
     </tbody>
  </table>
  </div>
    <div class="col-sm-2"></div>
</div>
<div class="row">
<div class="container text-center">
   	   <ul class="pagination">
   	  
				<c:if test="${page <= 1}">
					<li class='disabled'><a>이전</a></li>
				</c:if>
				<c:if test="${page > 1}">
					<li><a href="./member_mypage?page=${page-1}">이전</a></li>
				</c:if>
				<c:forEach var ="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == page}">
						<li class="active"><a>${a}</a></li>
					</c:if>
					<c:if test="${a != page}">
						<li><a href="./member_mypage?page=${a}">${a}</a></li>
					</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage}">
					<li class='disabled'><a>다음</a></li>
				</c:if>
				<c:if test="${page < maxpage}">
					<li><a href="./member_mypage?page=${page + 1}">다음</a></li>
				</c:if>
   	   </ul>
   	  </div> 
  </div>
</div>
<div class="container mypage-write">
 <div class="col-sm-12 text-center">
	<h2>최근에 작성한 글</h2>
</div>
	<div class="col-sm-2"></div>
    <div class="col-sm-8">
    
    <c:forEach var="board" items="${boardlist}">

      <ul class="nav nav-pills nav-stacked">
        <li><a href="/donong/community/cont?num=${board.num}">${board.subject}</a></li>

      </ul><br>
      
   </c:forEach>
    </div>
  
    <div class="col-sm-2"></div>
	</div>


<footer class="container-footer">
	<div class="col-sm-3"></div>
		
		<div class="col-sm-6">
		<input type="button" value="정보수정"  class="btn btn-default" onclick="location='member_edit'">
		<input type="button" value="내가 한 질문"  class="btn btn-default" onclick="location='/donong/cs/qna/'">
		<input type="button" value="회원탈퇴"  class="btn btn-default" onclick="location='member_del'">
	
		</div>
	<div class="col-sm-3"></div>
</footer>

</body>
</html>
