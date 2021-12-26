<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<head>
<link rel="stylesheet" href="${root }resources/swiper/swiper.min.css">  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
	.swiper-pagination-bullet {
		width: 12px;
		height: 12px;
		background: transparent;
		border: 1px solid #00a9b4;
		opacity: 1;
		margin-top: 15px;
		margin-left: 10px;
	}
	
	.swiper-pagination-bullet-active {
		width: 40px;
		transition: width .5s;
		border-radius: 5px;
		background: #00a9b4;
		border: 1px solid transparent;
	}
</style>
</head>
<body>
	<div >
		<div style="
		width: 1475px;
  	    margin: 0 auto; 
  	    background: #ddd;">
			<div class="swiper-container" style="width: 1475px;">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="https://pubfiles.lghomin.com/files/images/00/357e5945c65d4fc1abcfea14fd57c607/25756605fb814d97804a38ddfe34c555.jpg" style="width: 100%;">
					</div>
					<div class="swiper-slide">
						<img src="https://pubfiles.lghomin.com/files/images/00/e298d8eb42f140dfa16f0e71bc2145ef/d34fb1fd63c74e41b6f2968dd56cce56.jpg" style="width: 100%;">
					</div>
					<div class="swiper-slide">
						<img src="https://pubfiles.lghomin.com/files/images/00/2a491d4b1e054c6b96c0d0c55be42bbd/715bd368f8424039926c9d07373ddbe5.jpg" style="width: 100%;">
					</div>
				</div>
			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-pagination" style="width: 1475px; height: 0px;"></div>
			<script src="${root }resources/swiper/swiper.min.js"></script>
		</div>
		<br><br>
		
		<!--  -->
		<div class="lent_option-wrap">
		
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=dryer"><img src = "/product_img/1.png"></a></div>
				<div><p>건조기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=waterpurifier"><img src = "/product_img/2.png"></a></div>
				<div><p>정수기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=aircleaner"><img src = "/product_img/3.png"></a></div>
				<div><p>공기청정기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=washmachine"><img src = "/product_img/4.png"></a></div>
				<div><p>식기세척기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=microwave"><img src = "/product_img/5.png"></a></div>
				<div><p>전기레인지</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=refrigerator"><img src = "/product_img/6.png"></a></div>
				<div><p>얼음정수기냉장고</p></div>
			</div>
		
		</div>
		
		<section class="container-home-section_home" >
			<div class="main-product-title"><strong>상품 소개영상</strong></div>
			<div class="produce-video">
				<div class="produce-video-text">
					<strong class="produce-video-text-top">LG 퓨리케어 상하좌우 정수기</strong>
					<p class="produce-video-text-bottom">매일 마시는 물 매일 깨끗하게</p>
				</div>
				<divclass="produce-video-on">
					<div playsinline="1">
						<iframe 
						id="youtube-player-1" 
						frameborder="0" 
						allowfullscreen="1" 
						allow="accelerometer; 
						autoplay; clipboard-write; 
						encrypted-media; gyroscope; 
						picture-in-picture" 
						title="YouTube video player" 
						width="640" 
						height="360" 
						src="https://www.youtube.com/embed/G3QvuJZjIaE?autoplay=0&amp;time=0&amp;enablejsapi=1&amp;origin=https%3A%2F%2Flghomin.com&amp;widgetid=1" 
						data-gtm-yt-inspected-41569218_1161="true" 
						data-gtm-yt-inspected-41569218_1259="true" 
						data-gtm-yt-inspected-35994037_233="true" 
						data-gtm-yt-inspected-35994037_252="true">
						</iframe>
					</div>
				</div>
			</div>
		</section>
		
		<section class="container-home-section_home" >
			<div class="main-product-title"><strong>지금 가장 핫한 서비스/상품</strong></div>
			<div class="main-product-list">
			<c:forEach var="to" items="${top }">
				<div class="main-product-list-in">
					<ul>
						<li>
							<div class="main-product-text " onclick = "location.href='${root}product?category=${to.classification }&prodNo=${to.product_no }'">
								<div class="main-product-tex-in ">
									<img src = "/product_img/${to.product_filename}"></div>
									<c:choose>
										<c:when test="${to.classification eq 'aircleaner'}">
											<div class="pro-category" >공기청정기</div>
										</c:when>
										<c:when test="${to.classification eq 'dryer'}">
											<div class="pro-category" >건조기</div>
										</c:when>
										<c:when test="${to.classification eq 'microwave'}">
											<div class="pro-category" >전기레인지</div>
										</c:when>
										<c:when test="${to.classification eq 'refrigerator'}">
											<div class="pro-category" >얼음정수기/냉장고</div>
										</c:when>
										<c:when test="${to.classification eq 'washmachine'}">
											<div class="pro-category" >식기세척기</div>
										</c:when>
										<c:when test="${to.classification eq 'waterpurifier'}">
											<div class="pro-category" >정수기</div>
										</c:when>
									</c:choose>
									<div class="pro-name">${to.product_name }</div>
									<div class="pro-price">${to.price }</div>
							</div>
						</li>
					</ul>
				</div>
			</c:forEach>
			</div>
		</section>
		
		<section class="container-home-section_home" >
			<div class="main-product-title"><strong>판매 Top4</strong></div>
			<div class="main-product-list">
			<c:forEach var="oc" items="${orderCount }">
				<div class="main-product-list-in">
					<ul>
						<li>
							<div class="main-product-text " onclick = "location.href='${root}product?category=${oc.classification }&prodNo=${oc.product_no }'">
								<div class="main-product-tex-in ">
									<img src = "/product_img/${oc.product_filename}"></div>
									<c:choose>
										<c:when test="${oc.classification eq 'aircleaner'}">
											<div class="pro-category" >공기청정기</div>
										</c:when>
										<c:when test="${oc.classification eq 'dryer'}">
											<div class="pro-category" >건조기</div>
										</c:when>
										<c:when test="${oc.classification eq 'microwave'}">
											<div class="pro-category" >전기레인지</div>
										</c:when>
										<c:when test="${oc.classification eq 'refrigerator'}">
											<div class="pro-category" >얼음정수기/냉장고</div>
										</c:when>
										<c:when test="${oc.classification eq 'washmachine'}">
											<div class="pro-category" >식기세척기</div>
										</c:when>
										<c:when test="${oc.classification eq 'waterpurifier'}">
											<div class="pro-category" >정수기</div>
										</c:when>
									</c:choose>
									<div class="pro-name">${oc.product_name }</div>
									<div class="pro-price">${oc.price }</div>
							</div>
						</li>
					</ul>
				</div>
			</c:forEach>
			</div>
			
			
		</section>
		
</div>		
</body>

<script>
	var mySwiper = new Swiper('.swiper-container', {
		navigation : {
			prevEl : '.swiper-button-prev',
			nextEl : '.swiper-button-next',
		},
		autoplay : {
			delay : 2000,
			disableOnInteraction: false,
		},
		pagination : {
			el : '.swiper-pagination',
			type : 'bullets',
			clickable : true,
		},
	});
</script>