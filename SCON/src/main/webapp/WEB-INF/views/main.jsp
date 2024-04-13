<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL Core 태그 라이브러리를 사용하기 위한 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- JSTL Format 태그 라이브러리를 사용하기 위한 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SCON</title>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Core theme JS-->
<script src="../resources/js/scripts.js"></script>
<link href="../resources/css/styles.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap"
	rel="stylesheet">

<script>

$(document).ready(function () {
    var visibleItems = 5;
    var totalItems = ${fn:length(list)};
    $("#loadMoreBtn").click(function () {
        $(".item:lt(" + (visibleItems + 5) + ")").slideDown(); // 추가로 5개의 아이템을 표시
        visibleItems += 5;
        if (visibleItems >= totalItems) {
            $("#loadMoreBtn").hide(); // 모든 아이템이 표시되면 버튼을 숨김
            $("#flipBtn").show(); // flip 버튼을 표시
        }
    });

    $("#flipBtn").click(function () {
        location.reload();
    });
    // Initially hide the flipBtn
    $("#flipBtn").hide();
});
</script>
<script>
$(document).ready(function(){
    // 마우스 올렸을 때 이벤트
    $(".tab-link").mouseenter(function(){
        var tab_id = $(this).attr('data-tab');

        $(".tab-link").removeClass('current');
        $(".tab-content").removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });

    // 마우스가 모든 탭에서 벗어났을 때 일간 탭으로 돌아가기
    $(".ranking-tabs").mouseleave(function(){
        $(".tab-link").removeClass('current');
        $(".tab-content").removeClass('current');

        $('.tab-link[data-tab="tab-1"]').addClass('current');
        $('#tab-1').addClass('current');
    });

    // 페이지 로드 시 일간 탭 활성화
    $('.tab-link[data-tab="tab-1"]').addClass('current');
    $('#tab-1').addClass('current');
    

  
});

window.onload = function() {
	// 리다이렉트된 페이지에서 속성 확인
	var adminx = "${adminx}";

	if (adminx === 'x') {
	    // 알림창 표시
	    alert("관리자 번호가 틀렸습니다.");
	}
	}
</script>

<!-- Core theme JS-->

<style>
* {
	padding: 0;
	margin: 0;
	text-decoration: none;
}
</style>
</head>
<body>
	<div id="header">
		<!--전체 감싸기-->
		<div class="logo">로고</div>
		<div class="logo2">
			<a href="/main"> <img src="../resources/img/로고 copy2.png"
				alt="로고 위치">
			</a>
		</div>
		<!-- 관리자 버튼 -->
		<div class="mypage">
			<a id="adminBtn"
				class="badge2 bg-secondary text-decoration-none link-light" href="#"
				data-bs-toggle="modal" data-bs-target="#adminModal1">관리자</a>
		</div>
		
		<div class="modal fade" id="adminModal1" tabindex="-1"
			aria-labelledby="adminModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="adminModalLabel">관리자 모드</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 로그인 폼 -->
						<form id="adminForm" action="/admin" method="post">
							<div class="mb-3">
								<input type="password" name="password" class="form-control"
									id="password" placeholder="관리자번호" required>
							</div>
							<input type="hidden" name="bno" value="${board.bno}">
							<button type="submit"
								class="badge2 bg-secondary text-decoration-none link-light">확인</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<button class="navbar-toggler ml-auto" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-center"
				id="navbarSupportedContent">
				<ul class="navbar-nav mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/main?ccode=0">New</a></li>
					<li class="nav-item"><a class="nav-link" href="/main?ccode=1">AI</a></li>
					<li class="nav-item"><a class="nav-link" href="/main?ccode=2">IT</a></li>
					<li class="nav-item"><a class="nav-link" href="/main?ccode=3">우주</a></li>
					<li class="nav-item"><a class="nav-link" href="/main?ccode=4">자연</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page content-->
	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-8">
				<!-- Post content-->
				<article>
					<div class="mb-4">
						<c:if test="${pageMaker.cri.keyword !=null}">
							<h4>
								<c:choose>
									<c:when test="${pageMaker.cri.type=='T'}">
								    		제목
								    </c:when>
									<c:when test="${pageMaker.cri.type=='C'}">
								    		내용
								    </c:when>
									<c:when test="${pageMaker.cri.type=='W'}">
								    		작성자
								    </c:when>
								</c:choose>
								-<strong>'${pageMaker.cri.keyword}'</strong> 검색결과
							</h4>
						</c:if>
					</div>

					<c:if test="${pageMaker.cri.keyword ==null}">
						<h4>
							헤드라인 뉴스 -
							<c:if test="${ccode == '0'}">최신</c:if>
							<c:if test="${ccode == '1'}">AI</c:if>
							<c:if test="${ccode == '2'}">IT</c:if>
							<c:if test="${ccode == '3'}">우주</c:if>
							<c:if test="${ccode == '4'}">자연</c:if>
						</h4>
					</c:if>
					<div class="card mb-4"></div>
					<!-- Post content-->
					<section class="mb-5" style="height: auto;">
						<c:forEach items="${list}" var="main" varStatus="loop">
							<div class="item"
								style="width: auto; height: 150px; overflow: auto; display: ${loop.index < 5 ? 'block' : 'none'};">
								<div
									style="width: auto; height: 150px; overflow: auto; overflow-y: hidden; overflow-x: hidden;">
									<div style="width: 150px; height: 140px; margin: 5px; padding: 5px; float: left;">
										<img src="../resources/img/${main.fileurl}" alt="이미지"
											style="width: 100%; height: 100%; object-fit: cover;">
									</div>
									<div id="aaaa" style="width: 500px; height: 105px; margin: 5px; padding: 5px; float: left; font-size: small;">
										<a href="/get?bno=${main.bno}">
											<p style="font-weight: bold; font-size: 16px;">
												<c:out value="${main.title}"></c:out>
											</p> <c:out value="${fn:substring(main.content, 0, 80)}" />
											${fn:length(main.content) > 80 ? '...' : ''}

											<div>
												<table style="width: 100%; margin-top: 2%;">
													<tr>
														<td class="authorCell" style="text-align: left;">
															작성자: <c:out value="${main.writer}" /> | 등록일: <fmt:formatDate
																value="${main.wdate}" pattern="yyyy-MM-dd" />
														</td>
													</tr>
												</table>
											</div>

										</a>
									</div>
								</div>
							</div>
							<hr style="display: ${loop.index < 5 ? 'block' : 'none'};">
						</c:forEach>
					</section>

				</article>
				<!-- Comments section-->
				<section class="mb-5">
					<div class="card bg-light">
						<div class="card-body">
							<button type="button" id="loadMoreBtn"
								style="width: 100%; border: none; display: block; text-align: center; color: black; padding: 10px 0; text-decoration: none;">더보기</button>
							<button type="button" id="flipBtn"
								style="width: 100%; border: none; display: block; text-align: center; color: black; padding: 10px 0; text-decoration: none;">접기</button>

						</div>
					</div>
				</section>
			</div>
			<!-- Side widgets-->
			<div class="col-lg-4">
				<!-- Search widget-->
				<div class="card mb-4">
					<div class="card-header">검색하기</div>
					<div class="card-body">
						<form id="searchForm" method="get">
							<select name="type" style="width: 75px; height: 35px;">
								<option value="T" selected>제목</option>
								<option value="C">내용</option>
								<option value="W">기자명</option>
							</select> <input name="keyword" style="width: 180px; height: 35px;">
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum}"> <input type="hidden"
								id="amount" name="amount" value="${pageMaker.cri.amount}">
							<button class="btn btn-primary" id="button-search" type="submit">검색</button>
						</form>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">광고</div>
					<img src="../resources/img/ad2.jpg" class="card-img-top" alt="광고 이미지">
				</div>
				<!-- Categories widget-->
				<div class="card mb-4">
					<div class="card-header">기사랭킹</div>
					<div class="card-body" style="height: 290px;">
						<div class="ranking-tabs">
							<ul class="tabs">
								<li class="tab-link" data-tab="tab-1" style="width: 24%;">AI</li>
								<li class="tab-link" data-tab="tab-2" style="width: 24%;">IT</li>
								<li class="tab-link" data-tab="tab-3" style="width: 24%;">우주</li>
								<li class="tab-link" data-tab="tab-4" style="width: 24%;">자연</li>
							</ul>
							<div id="tab-1" class="tab-content current" style="border: none;">
								<!-- 일간 내용 -->
								<ul>
									<c:forEach items="${IT}" var="IT">
										<li><a href="/get?bno=${IT.bno}"> <c:out
													value="${fn:substring(IT.title, 0, 20)}" />
												${fn:length(IT.title) > 20 ? '...' : ''}
										</a></li>
									</c:forEach>
									<!-- 기타 일간 기사들 -->
								</ul>
							</div>
							<div id="tab-2" class="tab-content" style="border: none;">
								<!-- 주간 내용 -->
								<ul>
									<c:forEach items="${AI}" var="AI">
										<li><a href="/get?bno=${AI.bno}"> <c:out
													value="${fn:substring(AI.title, 0, 20)}" />
												${fn:length(AI.title) > 20 ? '...' : ''}
										</a></li>
									</c:forEach>

									<!-- 기타 주간 기사들 -->
								</ul>
							</div>
							<div id="tab-3" class="tab-content" style="border: none;">
								<!-- 월간 내용 -->
								<ul>
									<c:forEach items="${SPACE}" var="SPACE">
										<li><a href="/get?bno=${SPACE.bno}"> <c:out
													value="${fn:substring(SPACE.title, 0, 20)}" />
												${fn:length(SPACE.title) > 20 ? '...' : ''}
										</a></li>
									</c:forEach>

									<!-- 기타 월간 기사들 -->
								</ul>
							</div>
							<div id="tab-4" class="tab-content" style="border: none;">
								<!-- 월간 내용 -->
								<ul>
									<c:forEach items="${NATURE}" var="NATURE">
										<li><a href="/get?bno=${NATURE.bno}"> <c:out
													value="${fn:substring(NATURE.title, 0, 20)}" />
												${fn:length(NATURE.title) > 20 ? '...' : ''}
										</a></li>
									</c:forEach>

									<!-- 기타 월간 기사들 -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Side widget-->
				<div class="card mb-4">
					<div class="card-header">광고</div>
					<img src="../resources/img/ad2.jpg" class="card-img-top" alt="광고 이미지">
				</div>
			</div>
		</div>
	</div>

	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy;</p>
		</div>
	</footer>
	<!-- Footer.end-->

</body>


</html>