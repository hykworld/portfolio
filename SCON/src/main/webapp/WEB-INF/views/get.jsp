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

<style>
* {
	padding: 0;
	margin: 0;
	text-decoration: none;
}

.cur{
	cursor: pointer;
}
</style>
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
						<form id="adminForm" action="/admin1" method="post">
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
	<!-- 모달 창 -->
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
	<!-- 카테고리 코드 -->
	<article>
		<div class="card mb-4"></div>
		<c:if test="${ccode == '1'}">AI</c:if>
		<c:if test="${ccode == '2'}">IT</c:if>
		<c:if test="${ccode == '3'}">우주</c:if>
		<c:if test="${ccode == '4'}">자연</c:if>
		<!-- Post content-->
		<section class="mb-5" style="height: auto;">
			<c:forEach items="${list}" var="main">
				<div style="width: auto; height: 120px; overflow: auto;">
					<div
						style="width: 150px; height: 105px; margin: 5px; padding: 5px; float: left;">
						<img src="../resources/img/${main.fileurl}" alt="이미지"
							style="width: 100%; height: 100%; object-fit: cover;">
					</div>
					<div
						style="width: 670px; height: 105px; margin: 5px; padding: 5px; float: left;">
						<a href="/get?bno=${main.bno}">
							<p>
								<strong><c:out value="${main.title}"></c:out></strong>
							</p> <c:out value="${fn:substring(main.content, 0, 80)}" />
							${fn:length(main.content) > 80 ? '...' : ''}
						</a>

					</div>
				</div>
				<hr>
			</c:forEach>
		</section>

	</article>
	<!-- Page content-->
	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-8">
				<!-- Post content-->
				<article>
					<!-- Post header-->
					<header class="mb-4">
						<!-- Post title-->
						<p class="badge2 bg-secondary text-decoration-none link-light"
							style="font-size: 20px;">
							<c:if test="${board.ccode == '1'}">
								<a href="/main?ccode=1" class="category">&nbsp;AI&nbsp;</a>
							</c:if>
							<c:if test="${board.ccode == '2'}">
								<a href="/main?ccode=2" class="category">&nbsp;IT&nbsp;</a>
							</c:if>
							<c:if test="${board.ccode == '3'}">
								<a href="/main?ccode=3" class="category">&nbsp;우주&nbsp;</a>
							</c:if>
							<c:if test="${board.ccode == '4'}">
								<a href="/main?ccode=4" class="category">&nbsp;자연&nbsp;</a>
							</c:if>
						</p>
						<h1 class="fw-bolder mb-1">
							<c:out value="${board.title}" />
						</h1>
						<!-- Post categories-->
						<p class="badge bg-secondary text-decoration-none link-light">
							<c:out value="${board.writer}" />
						</p>
						<a class="badge bg-secondary text-decoration-none link-light"
							href="${board.newlink}">원본링크</a>

						<!-- Post meta content-->
						<div class="text-muted fst-italic mb-2">
							<fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd HH:mm" />
						</div>

						<!-- 수정 삭제 버튼 시작 -->
						<div class="ms-auto2">
							<a class="badge2 bg-secondary text-decoration-none link-light cur"
								data-bs-toggle="modal" data-bs-target="#adminModal2">수정</a>
							<!-- 수정 모달창 -->
							<div class="modal fade" id="adminModal2" tabindex="-1"
								aria-labelledby="adminModalLabel2" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="adminModalLabel2">관리자 모드</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<!-- 로그인 폼 -->
											<form id="adminForm" action="/admin2" method="post">
												<div class="mb-3">

													<input type="password" name="password" class="form-control"
														id="password" placeholder="관리자번호" required>
												</div>
												<input type="hidden" name="bno" value="${board.bno}">
												<input type="hidden" name="fileurl" value="${board.fileurl}">
												<button type="submit"
													class="badge2 bg-secondary text-decoration-none link-light">확인</button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<!-- 삭제 버튼 -->
							<a class="badge2 bg-secondary text-decoration-none link-light cur"
								data-bs-toggle="modal" data-bs-target="#adminModal3">삭제</a>
							<!-- 삭제 모달창 -->
							<div class="modal fade" id="adminModal3" tabindex="-1"
								aria-labelledby="adminModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="adminModalLabel">관리자 모드</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<!-- 로그인 폼 -->
											<form id="adminForm" action="/admin3" method="post">
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
						<!-- 수정 삭제 버튼 END -->
					</header>
					<!-- 메인 광고1 -->
					<div class="card mb-4">
						<a href="https://tempestaero.com/"> <img
							src="../resources/img/ad4.gif" class="card-img-top" alt="광고 이미지"
							width="900" height="150">
						</a>
					</div>
					<!-- Preview image figure-->
					<figure class="mb-4">
						<c:choose>
							<c:when test="${empty board.fileurl}">
								<img src="../resources/img/noimage.jpg"
									style="width: 900px; height: 400px;">
							</c:when>
							<c:otherwise>
								<img src="../resources/img/${board.fileurl}"
									class="img-fluid rounded" alt="기사 사진"
									style="width: 900px; height: 400px;" />
							</c:otherwise>
						</c:choose>
					</figure>

					<p>
						<c:out value="*사진정보: ${board.fileinfo}" />
					</p>
					<br>
					<!-- Post content-->
					<section class="mb-5">
						<pre class="fs-5 mb-4"><c:out value="${board.content}" /></pre>
					</section>

				</article>
				<!-- Comments section-->
				<section class="mb-5">
					<div class="card bg-light">
						<div class="card-body">
							<!-- Comment form-->
							<form class="mb-4">
								<div class="row">
									<div class="col-md-5 mb-2">
										<input class="form-control" name='replyer' placeholder="닉네임">
									</div>
									<div class="col-md-5 mb-2">
										<input class="form-control" name='Replypassword'
											type='password' placeholder="비밀번호">
									</div>
									<div class="col-md-2">
										<button id='RegisterBtn' class="btn btn-primary me-2"
											type="button">등록</button>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<textarea class="form-control" rows="3" name='reply'
											placeholder="댓글을 입력하세요"></textarea>
									</div>
								</div>
							</form>


							<ul class="chat" style="list-style-type: demical;">
								<!-- 댓글 목록을 출력할 리스트 -->

							</ul>

						</div>
					</div>
					<!-- ---------@@@@더보기 버튼----------------------- -->
					<section class="mb-5">
						<div class="card bg-light">
							<div class="card-body">
								<button type="button" id="loadMoreBtn"
									style="width: 100%; border: none; display: block; text-align: center; color: black; padding: 10px 0; text-decoration: none;">더보기</button>
								<button type="button" id="flipBtn"
									style="width: 100%; border: none; display: none; text-align: center; color: black; padding: 10px 0; text-decoration: none;">접기</button>

							</div>
						</div>
					</section>

				</section>
			</div>
			<!-- Side widgets-->
			<div class="col-lg-4">
				<!-- Search widget-->
				<div class="card mb-4">
					<div class="card-header">검색하기</div>
					<div class="card-body">
						<form id="searchForm" action="/main" method="get">
							<select name="type" style="width: 90px; height: 35px;">
								<option value="T" selected>제목</option>
								<option value="C">내용</option>
								<option value="W">작성자</option>
							</select> <input name="keyword" style="width: 200px; height: 35px;">
							<input type="hidden" name="pageNum" value="${cri.pageNum}">
							<input type="hidden" name="amount" value="${cri.amount}">

							<button class="btn btn-primary" id="button-search" type="submit">검색</button>
						</form>
					</div>
				</div>
				<!-- 좌측 광고1 -->
				<div class="card mb-4">
					<a href="https://www.tiktok.com/explore"> <img
						src="../resources/img/ad2.jpg" class="card-img-top" alt="광고 이미지">
					</a>
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
				<!-- 좌측 광고2 -->
				<div class="card mb-4">
					<a href="https://www.tiktok.com/explore"> <img
						src="../resources/img/ad2.jpg" class="card-img-top" alt="광고 이미지">
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer-->
	<!-- 댓글 등록 modal 창 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
					<!-- 모달 제목 -->
				</div>
				<div class="modal-body">
					<!-- 댓글 입력 폼 -->
					<div class="form-group">
						<label>댓글 내용</label> <input class="form-control" name='reply'
							placeholder='댓글 내용'>
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input class="form-control"
							name='Replypasswordmodal' type="password" placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
					<!-- 댓글 수정 버튼 -->
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
					<!-- 댓글 삭제 버튼 -->
					<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
					<!-- 모달 닫기 버튼 -->
				</div>
			</div>
		</div>
	</div>
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy;</p>
		</div>
	</footer>

	<!-- JavaScript 코드 시작 ------------------------------------------------------------------------------------->
	<script type="text/javascript"
		src="../resources/js/reply.js?v=<%=System.currentTimeMillis()%>"></script>
	<script>
		var pageNum = 1;
		var clickCount = 1;
		var clickend = 0;
		var bnoValue = '<c:out value="${board.bno}"/>'; //부모글 번호
        var replyUL = $(".chat"); // 댓글목록 ul
        
        var modal = $(".modal"); // 모달창
        var modalInputReply = modal.find("input[name='reply']"); //댓글내용
        var modalInputReplyer = modal.find("input[name='replyer']"); //댓글작성자
        var modalInputReplyDate = modal.find("input[name='replyDate']"); //댓글작성일
        var modalModBtn = $("#modalModBtn"); //수정버튼
        var modalRemoveBtn = $("#modalRemoveBtn"); //삭제버튼

        var operForm = $("#operForm"); // modify, list버튼 처리 폼

         // 페이지번호 기본값
        var replyPageFooter = $(".panel-footer"); // 댓글페이징처리 번호가 출력되는 부분
                        
        function showList(page) {   
            // 부모글 번호 가져오기
            var bnoValue = '<c:out value="${board.bno}"/>';
            // 댓글 목록 및 개수 가져오기
            replyService.getList({ bno: bnoValue, page: page}, function (replyCnt, list) {
                console.log("replyCnt : " + replyCnt);
                console.log("page : " + page);
                // page가 -1이면 마지막 페이지로 이동
                if (page == -1) {
                    pageNum = Math.ceil(replyCnt / 10.0);
                    showList(pageNum);
                    return;
                }
                var str = "";
                // 댓글목록이 없으면 중지
                if (list == null || list.length == 0) {
                    return;
                }
                // 댓글 목록을 문자열로 구성
               
                    for(var i=0,len=list.length || 0;i<len;i++){
                        str+="<li class='left clearfix' data-rno='"+list[i].rno+"' style='cursor:pointer'>";
                        str+="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
                        str+=" <small class='text-muted' style='float:right !important;'>"+replyService.displayTime(list[i].rdate)+"</small></div>";
                        str+=" <p>"+list[i].reply+"</p></div></li>"
                }
                // 과제 페이징 없이 스크롤, 더보기 추가
                $(".chat").html(str);
                showReplyPage(replyCnt);
            });
        }
        function showReplyPage(replyCnt){
	   	      var endNum = Math.ceil(pageNum / 10.0) * 10;  
	   	      var startNum = endNum - 9;
	   	  		 clickend=endNum;
	   	      /* var prev = startNum != 1;
	   	      var next = false; */
	   	      if(endNum * 10 >= replyCnt){
	   	        endNum = Math.ceil(replyCnt/10.0);
	   	      }
	   	      if(endNum * 10 < replyCnt){
	   	        next = true;
	   	      }
	   	  
	   	   if(clickCount==endNum){
	   		   /*  display:block */
	   		  	clickCount=1;
	   		   	$("#loadMoreBtn").css("display", "none");
	   			$("#flipBtn").css("display", "block");
		   	  	 }
	   		str += "</ul></div>";
	   	      console.log(str);
	   	      replyPageFooter.html(str);
	   	      //댓글목록 출력
 		}
        $(document).ready(function () {
                       // 필요한 변수 정의
                       /* 필요한 변수. 찾을 태그를 먼저 작성 *****************************************************/
                       showList(clickCount);
                      
                       $("#RegisterBtn").on("click", function (e) {
                           e.preventDefault(); // 기본 이벤트 제거

                           var bno = '<c:out value="${board.bno}"/>'; // 부모 글 번호 가져오기
                           var replyer = $("input[name='replyer']").val(); // 댓글 작성자
                           var password = $("input[name='Replypassword']").val(); // 댓글 비밀번호
                           var reply = $("textarea[name='reply']").val(); // 댓글 내용

                           // 댓글 객체 생성
                           var replyData = {
                               bno: bno,
                               replyer: replyer,
                               password: password,
                               reply: reply
                           };

                           // 서버로 댓글 등록 요청
                           replyService.add(replyData, function (result) {
                               // 성공 시 처리 로직
                               console.log("댓글 등록 성공!");
                               // TODO: 새로운 댓글을 화면에 추가하는 등의 작업 수행
                               $("#myModal").modal("hide");
                               showList(1);
                           }, function (err) {
                               // 실패 시 처리 로직
                               console.error("댓글 등록 실패:", err);
                               // TODO: 실패 시 사용자에게 알리는 등의 작업 수행
                           });
                       });

                       // 댓글 목록을 클릭 시
                       $(".chat").on("click", "li", function () {
                           // 모달 보이기
                           $("#myModal").modal("show");
                           
                           // 선택한 댓글의 데이터 가져오기
                           var replyId = $(this).data('rno'); // 댓글 ID
                           var replyContent = $(this).find('p').text(); // 댓글 내용

                           // 모달에 댓글 정보 채우기
                           $("#myModalLabel").text("댓글 수정 및 삭제"); // 모달 제목 변경
                           $("input[name='reply']").val(replyContent); // 모달 내용에 댓글 내용 채우기
                           // 모달에 댓글 ID 설정 (추가)
                           $("#myModal").data('rno', replyId); // 모달에 댓글 ID 저장
                       });
                       // 모달 수정 버튼 클릭 시
                       $("#modalModBtn").click(function (e) {
                           e.preventDefault(); // 기본 이벤트 제거
                           var replyId = $("#myModal").data('rno'); // 모달에 저장된 댓글 ID 가져오기
                           var replyContent = $("input[name='reply']").val(); // 수정된 댓글 내용 가져오기
                           var password = $("#myModal input[name='Replypasswordmodal']").val(); // 사용자가 입력한 비밀번호 가져오기
                           console.log("비밀번호:" + password);

                           // 댓글 객체 생성
                           var replyData = {
                               rno: replyId, // 수정할 댓글의 ID
                               reply: replyContent, // 수정된 댓글 내용
                               password: password // 사용자가 입력한 비밀번호
                           };

                           // 서버로 댓글 수정 요청
                           replyService.update(replyData, function (result) {
                               // 성공 시 처리 로직
                               console.log("댓글 수정 성공!");
                               // TODO: 화면에 수정된 댓글을 반영하는 등의 작업 수행
                               alert("댓글이 수정되었습니다.");
                               $("#myModal").modal("hide");
                               showList(1);
                           }, function (err) {
                               // 실패 시 처리 로직
                               console.error("댓글 수정 실패:", err);
                               // TODO: 실패 시 사용자에게 알리는 등의 작업 수행

                               // 비밀번호가 일치하지 않을 때 얼럿 창 띄우기
                               alert("댓글 수정 실패: 비밀번호가 일치하지 않습니다.");
                               $("#myModal").modal("hide");
                           });
							showList(1);
                       });
                       // 모달 삭제 버튼 클릭 시
                       $("#modalRemoveBtn").click(function (e) {
                           e.preventDefault(); // 기본 이벤트 제거

                           var replyId = $("#myModal").data('rno'); // 모달에 저장된 댓글 ID 가져오기
                           var password = $("#myModal input[name='Replypasswordmodal']").val(); // 사용자가 입력한 비밀번호 가져오기
                           console.log("비밀번호:" + password);
                           // 댓글 객체 생성
                           var replyData = {
                               rno: replyId, // 수정할 댓글의 ID
                               password: password // 사용자가 입력한 비밀번호
                           };
                           console.log("삭제비밀번호:" + replyData.password);
                           // 서버로 댓글 수정 요청
                           replyService.remove(replyData, function (result) {
                               // 성공 시 처리 로직
                               console.log("댓글 삭제 성공!");
                               // TODO: 화면에 수정된 댓글을 반영하는 등의 작업 수행
                               $("#myModal").modal("hide");
                               
                               alert(result);
                               showList(1);

                           }, function (err) {
                               // 실패 시 처리 로직
                               console.error("댓글 삭제 실패:" + err);
                               // TODO: 실패 시 사용자에게 알리는 등의 작업 수행
                               // 비밀번호가 일치하지 않을 때 얼럿 창 띄우기
                           });
                           showList(1);
                       });
                       
                   });
                   /* 모달창 close버튼 event 처리 ******************************************************************/
                   $("#modalCloseBtn").on("click", function () {
                       $("#myModal").modal("hide");
                   });
                   //JavaScript 코드 시작

                   // 댓글 등록 버튼 클릭 시
            
                   $("#loadMoreBtn").on("click", function() {
           		    // 클릭할 때마다 clickCount 변수를 1 증가시킴
           		    clickCount++;
           		    // 콘솔에 클릭 횟수 출력
           		    showList(clickCount);
           		    console.log("클릭 횟수: " + clickCount);
           		});
                   
                   $("#flipBtn").on("click", function() {
           		    // 클릭할 때마다 clickCount 변수를 1 증가시킴
           		    showList(1);
           		 $("#loadMoreBtn").css("display", "block");
           		$("#flipBtn").css("display", "none");
           		    // 콘솔에 클릭 횟수 출력
           		});
               </script>


</body>
</html>