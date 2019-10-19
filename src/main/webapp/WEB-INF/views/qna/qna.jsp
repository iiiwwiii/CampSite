<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Product</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="../include/cssimport.jsp"/>
</head>
<body class="animsition">

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	
	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(/resources/images/service-and-announce.jpg);">
		<h2 class="l-text2 t-center">
			SERVICE CENTER
		</h2>
	</section>


	<!-- Content page -->
	<section class="bgwhite p-t-55 p-b-65">
		<div class="container">
			<div class="row">
				<!-- 사이드 네비-->
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
					<jsp:include page= "../include/qnaSide.jsp" />
				</div>

				<!--알맹이-->
				<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
					<!--Q service-->
					<jsp:include page="../include/quickqna.jsp" />


					<div class="flex-w flex-sb">
							<h4 class="p-b-10"> 고객 문의사항</h4>
								<table class="table table-hover bo4">
										<thead>
											<tr>
												<th scope="col" class="column-7">#</th>
												<th scope="col" class="column-6">문의사항</th>
												<th scope="col" class="column-5">작성자</th>
												<th scope="col" class="column-5">작성날짜</th>
												<th scope="col" class="column-5">답변여부</th>
											</tr>
										</thead>
										<tbody>
										
										<c:forEach var="qnaList" items="${ qnaList }">
											<tr class ="move-qna-detailpage" id ="move-qna-detailpage" onClick="location.href='/qna/qnadetail?qaNo=${ qnaList.qaNo }'"> 
												<td>${ qnaList.qaNo }</td>
												<td> 
													<%-- <c:if test="${ qnaList.lockCheck eq 'on' }">
														<i class="fa fa-lock" aria-hidden="true" style="display:none;"></i>
													</c:if> --%>
													${ qnaList.title } 
												</td>
												<td>${ qnaList.memberId }</td>
												<td>${ qnaList.regDate }</td>
												
												<c:choose>
												<c:when test="${ qnaList.completed eq '0' }">
													<td><span class="badge badge-danger">답변대기</span> </td>
												</c:when>
												<c:otherwise>
													<td><span class="badge badge-success">답변완료</span></td>
												</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>

										</tbody>
								</table>
								<c:choose>
								<c:when test="${ loginuser.type eq 'admin' }">
									<button type="button" class="btn btn-dark"  onclick ="location.href ='/qna/qnawrite'">공지사항 작성</button>
								</c:when>
								<c:otherwise>
								<div class="flex-sb" style='display:${ not empty loginuser  ? "block" : "none" }'>
									<button type="button" class="btn btn-dark"  onclick ="location.href ='/qna/qnawrite'">문의사항 남기기</button>
								</div>
								</c:otherwise>
								</c:choose>							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="bg6 p-t-20 p-b-46 m-b-20">
			<div class="flex-w p-l-15 p-r-15">
				<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 respon1">
					<h4 class="m-text12 t-center">
						<i class="fa fa-info-circle" aria-hidden="true"></i>
						바로가기
					</h4>
	
					<a href="#" class="s-text11 t-center">
						회원가입 / 로그인
					</a>

				</div>
	
				<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 bo2 respon2">
						<a href="/upload/qnawrite" class="m-text12 t-center"	>
							<i class="fa fa-headphones" aria-hidden="true"></i>
							1 : 1 상담
						</a>

					<span class="s-text11 t-left"> 평일 : 다음날 답변 완료 </span>
					<span class="s-text11 t-left"> 토,일/공휴일 : 휴일 이후 답변 완료 </span>
					
				</div>
	
				<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 respon1">
					<h4 class="m-text12 t-center">
						<i class="fa fa-phone" aria-hidden="true"></i>
						전화 : 000 - 0000
					</h4>
					<span class="s-text11 t-left "> 평일 오전 8시 ~ 오후 6시 </span>
					<span class="s-text11 t-left "> 토,일 / 공휴일 휴무 </span>

					
				</div>
			</div>
		</section>


	<!-- Footer -->
	<jsp:include page="../include/footer.jsp" />

	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>


	<!-- js import -->
	<jsp:include page="../include/jsimport.jsp" />
	
</body>
</html>
