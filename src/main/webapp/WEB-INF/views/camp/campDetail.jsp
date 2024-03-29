<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../include/cssimport.jsp" />
<style>
.ui-datepicker-trigger{cursor: pointer;}
.hasDatepicker{cursor: pointer;}
</style>
</head>
<body class="animsition">
	<jsp:include page="../include/header.jsp" />
	
	<!-- breadcrumb -->
	<div class="bread-crumb bgwhite flex-w p-l-200 p-t-30">
		<a href="/" class="s-text16">
			홈<i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
		</a>
		<a href="/camp/campList?category=all" class="s-text16">
			캠핑장 리스트<i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
		</a>
		<span class="s-text17">${ camp.campName }</span>
	</div>

	<!-- Product Detail -->
	<div class="container bgwhite p-t-35 p-b-80">
		<div class="flex-w flex-sb">
			<div class="w-size13 p-t-30 respon5">
				<div class="wrap-slick3 flex-sb flex-w">
					<div class="wrap-slick3-dots"></div>								
					<div class="slick3">
						<c:forEach var="file" items="${ camp.fileList }">
							<div class="item-slick3" data-thumb="/resources/camp-files/${ file.savedFileName }">
								<div class="wrap-pic-w">
									<img src="/resources/camp-files/${ file.savedFileName }" width="500px" height="600px" alt="IMG-PRODUCT">
								</div>
							</div>
						</c:forEach>
					</div>					
				</div>
			</div>

			<div class="w-size14 p-t-30 respon5">
				<h4 class="product-detail-name m-text16 p-b-13"  style="font-size:25px;font-weight:bolder; color:#565656">
					${ camp.campName }
				</h4>
				
				<span class="m-text17"  style=" font-size:23px;font-weight:bolder; color:#d20054">
					<fmt:formatNumber value="${ camp.price }" pattern="#,###" />원
				</span>
				
				<%-- 관리자가 로그인했을 시 삭제,수정 버튼 활성화 --%>
				<c:if test="${ loginuser.type eq 'admin' }">
					<div class="mt-5">
						<a class="btn btn-outline-success"
							href="/camp/campUpdate/${ camp.campNo }"
							role="button">수정</a> 
						<a class="btn btn-outline-secondary"
							href="/camp/campDelete/${ camp.campNo }"
							role="button" onclick="return confirm('삭제하시겠습니까?');">삭제</a> 
					</div>
				</c:if>
				<c:if test="${ loginuser.type eq 'user' }">
				<form action="/camp/campRent" method="post" id="rentform">
					<input type="hidden" name="campNo" id="campNo" value="${ camp.campNo }">
					<div class="mt-5">
						<label for="startDate">체크인</label>
						<input type="text" name="startDate" id="startDate" class="col-md-4" required>
						<label for="endDate">체크아웃</label>
    					<input type="text" name="endDate" id="endDate" class="col-md-4" required>
    					<div class="mt-2 p-r-50">
    						<input class="btn btn-dark" type="button" id="rent_submit" name="rent_submit" value="예약" />
    					</div>				
					</div>
				</form>
				</c:if>
				<div class="p-b-45 mt-5">
					<span class="s-text8">${ camp.category }</span>
				</div>

				<!-- 세부설명 -->          
				<div class="wrap-dropdown-content bo6 p-t-15 p-b-14 active-dropdown-content">
					<h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
						객실정보
						<i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
						<i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
					</h5>
<c:set var="enter" value="
" /> 
					<div class="dropdown-content dis-none p-t-15 p-b-23">
						<p class="s-text8">${ fn:replace(camp.content, enter, '<br>') }</p>
					</div>
				</div>

				<div class="wrap-dropdown-content bo7 p-t-15 p-b-14">
					<h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
						세부사항
						<i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
						<i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
					</h5>

					<div class="dropdown-content dis-none p-t-15 p-b-23">
						<p class="s-text8">
							<strong>입실시간: 15시(22시 이후의 입실은 사전에 반드시 연락을 주시기 바랍니다.)</strong><br>
							<strong>퇴실시간: 11시</strong><br>
							입실시간은 오후 3시부터입니다. 객실 청소가 11시 ~ 15시까지이기 때문에 3시 이전에 입실은 불가능합니다.
						</p>
					</div>
				</div>			
			</div>			
		</div>
	
		<!-- Relate Product -->
		<section class="relateproduct bgwhite p-t-100 p-b-120">
			<div class="container">
				<div class="sec-title p-b-60">
					<h3 class="m-text5 t-center">Reviews</h3>
				</div>						
				<c:if test="${ empty reviews }">
					<h5 class="t-center">작성된 리뷰가 존재하지 않습니다.</h5>				
				</c:if>
				
				<div class="container bgwhite p-t-35 p-b-80">
					<c:forEach var="review" items="${ reviews }">
						<div class="size18 p-l-20 p-t-13 p-b-18 m-b-20 bo-rad-4" style="border:solid 1px #6c757deb">
							<div class="row">
								<div class="col-md-10 p-l-20">
									<div class="flex-sb-m p-b-8">
										<div>
											<i class="fa fa-user" style="color: #555555;" aria-hidden="true"></i> 
											<span class="s-text20">
												${review.memberId } <span class="m-l-3 m-r-6">|</span>
											</span> 
											<span class="s-text20"> <fmt:formatDate value="${ review.regDate }" /></span>
										</div>
									</div>
									<span class="m-text6 p-t-5 p-b-5"> ${review.title }</span>
<c:set var="enter" value="
" />
									<p>${fn:replace(review.content, enter, '<br>') }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				
			</div>
		</section>

	</div><!-- container end -->
	
	<div style="display:none" id="rentDate">		
		<c:forEach var="rent" items="${ rents }">
		<div><fmt:formatDate value="${ rent.startDate }" pattern="yyyy-MM-dd"/>#<fmt:formatDate value="${ rent.endDate }" pattern="yyyy-MM-dd"/></div>
		</c:forEach>
	</div>

	<!-- Footer -->
	<jsp:include page="../include/footer.jsp" />

	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection1 -->
	<div id="dropDownSelect1"></div>

	<!-- js import -->
	<jsp:include page="../include/jsimport2.jsp" />
</body>
</html>