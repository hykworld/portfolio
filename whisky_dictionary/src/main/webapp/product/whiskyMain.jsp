<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" type="text/css" href="css/whiskyMain.css">
<script src="https://kit.fontawesome.com/6c060c00b1.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- 데스크탑크기일때 표기 -->
	<div id="desktop-content">
		<form method="post" action="WhiskyDeleteServlet" name="frm"
			enctype="multipart/form-data">
			<div id="headpart">

				<a href="whiskyMain.do"> <img src="/whisky/img/logo.png"
               alt="로고이미지" style="position:relative; width:300px; height:auto; z-index:999;" class="mt-2 mb-custom">
            	</a>

				<div id="btns2">
					<a href="login.do" class="btn btn-sm custom-button" id="btnList">마이페이지</a>
				</div>
			</div>
			<div id="categorypart">
				<ul id="categorymenu">
					<li><a href="whiskyList.do?cno=1">스카치 위스키</a></li>
					<li><a href="whiskyList.do?cno=2">아이리시 위스키</a></li>
					<li><a href="whiskyList.do?cno=3">아메리칸 위스키</a></li>
					<li><a href="whiskyList.do?cno=4">커네이디언 위스키</a></li>
					<li><a href="whiskyList.do?cno=5">몰트 위스키</a></li>
				</ul>

			</div>
			<div id="mainview">
				<!-- 메인뷰 상단부분 -->
				<div id=updiv>
					<div class="container" id="detailmain" role="main">
						<h2 name="title"
							style="color: black; text-align: center; top: -90px; left: 0px; font-size: 55px;">${whisky.title}</h2>
						<!-- 수정 삭제 취소 글쓰기 버튼 코딩 -->
						<c:choose>
							<c:when test="${loginUser.admin==0}">
							<!-- 어드민 0 즉 관리자일 때 -->
								<div style="text-align: left;">
									<div id="btns"
										style="justify-content: center; display: flex; float: right;">
										<a href="whiskyUpdate.do?bno=${whisky.bno}"
											class="btn btn-sm custom-button" id="btnList">수정</a> <a
											href="whiskyDelete.do?bno=${whisky.bno}"
											class="btn btn-sm custom-button" id="btnList">삭제</a> <a
											href="whiskyWrite.do?" class="btn btn-sm custom-button"
											id="btnList">글쓰기</a>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:if test="${loginUser.admin!=0}">
								<!-- 어드민 값이 0이 아닐때 즉 방문객일 때 -->
								</c:if>
							</c:otherwise>
						</c:choose>

						<!-- 수정 삭제 취소 글쓰기 버튼 코딩 -->

						<div style="">
							<div name="writedate"
								style="width: 169px; height: 19px; display: flex; 
								position: relative; left: 0; top: 16px; margin-top: -20px; 
								justify-content: center;">
								<fmt:formatDate value="${whisky.writedate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
							<div name="userid"
								style="position: relative; width: 100px; height: 30px; 
								display: flex; float: right; margin-top: 10px; 
								left: 262px; top: -23px;">작성자
								: ${whisky.userid}</div>
						</div>
						<div class="mb-5"></div>
						<div class="mb-5" style="display: flex; justify-content: center;">
							<c:choose>
								<c:when test="${empty whisky.filepath}">
									<img src="img/noimage.jpg" width="50%">
								</c:when>
								<c:otherwise>
									<img src="img/${whisky.filepath}"
										style="width: 50%; left: 200px;">
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div id="content" class="mb-5"
						style="display: flex; justify-content: center; margin-bottom: 100px;">
						<div
							style="width: 1000px; height: 50%; margin-top: 10px; margin-bottom: 10px;">${whisky.bcontent}</div>
					</div>
				</div>

				<!-- 메인뷰 상단부분 -->
				<!-- 메인뷰 하단부분 -->
				<div class="pagingdiv" align="center">
					<div class="row">
						<div class="col-2">번호</div>
						<!-- bno -->
						<div class="col-6">제목</div>
						<!-- title -->
						<div class="col-2">작성일</div>
						<!-- writedate -->
						<div class="col-2">조회수</div>
						<!-- readcount -->
					</div>
					<c:forEach var="whiskyList" items="${whiskyList}">
						<div class="record">
							<div class="col-2">
								<a href="whiskyRead.do?bno=${whiskyList.bno}">${whiskyList.bno}</a>
							</div>
							<div class="col-6">
								<a href="whiskyRead.do?bno=${whiskyList.bno}">${whiskyList.title}</a>
							</div>
							<div class="col-2">
								<fmt:formatDate value="${whiskyList.writedate}"
									pattern="yy-MM-dd HH:mm:ss" />
							</div>
							<div class="col-2">${whiskyList.readcount}</div>
						</div>
					</c:forEach>
					<!--  paging ------------------------------------------------------------------------------>
					<form method="get">
						<div class="paging" align="center">${map.pagingString}</div>
					</form>
					<!--  paging.end -->

					<!-- 검색 폼 ------------------------------------------------->
					<form method="get">
						<div class="searchbar" border="1" width="90%">
							<div>
								<div align="center">
									<select name="searchField">
										<option value="title">제목</option>
										<option value="bcontent">내용</option>
									</select> <input type="text" name="searchWord" /> <input type="submit"
										class="btn btn-sm custom-button" id="btnList" value="검색" />
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</form>
	</div>

	<!-- 데스크탑크기일때 표기 끝 -->


	<!-- 모바일크기일때 표기-->


<div id="mobile-content" style="position: relative;">
		<div id="headpart" style="height: 110px; with: 100%;">
			<a href="whiskyMain.do"> <img src="/whisky/img/logo.png"
				alt="로고이미지" width="300px" height="70%" class="mt-2 mb-custom">
			</a>
<!-- 토글 버튼 -->
			<div style="width: 15%; height: 50%; position: absolute; right: 20px; top: 25%; 
   			 display: flex; justify-content: center; align-items: center; z-index: 100;">

   			 <button type="button" data-bs-toggle="collapse" data-bs-target="#demo" 
   			 style="width: 50px; height: 50px; position: relative; 
   			 background-color: #060126; border: solid 0px;">
   			 <i style="color: white; font-size: 30px;" class="fa-solid fa-bars"></i></button>
			</div>
		</div>
		
   <!-- 토글될 내용 -->
<div id="demo" class="collapse" style="width: 100%; height: 100%; position: relative; background-color: rgba(5, 0, 38, 1); z-index: 100;">
    <ul id="categorymenu-m">
        <li><a id="mypage" href="login.do">마이페이지</a></li>
        <li><hr></li>
        <li><a href="whiskyList.do?cno=1">스카치 위스키</a></li>
        <li><hr></li>
        <li><a href="whiskyList.do?cno=2">아이리시 위스키</a></li>
        <li><hr></li>
        <li><a href="whiskyList.do?cno=3">아메리칸 위스키</a></li>
        <li><hr></li>
        <li><a href="whiskyList.do?cno=4">커네이디언 위스키</a></li>
        <li><hr></li>
        <li><a href="whiskyList.do?cno=5">몰트 위스키</a></li>
        <li><hr></li>
    </ul>
</div>
		<div style="width: 100%; min-height: 1300px; position: relative; margin-top: 5%;">
			<h2 style="text-align: center; margin-bottom: 10px; font-size: 35px;">${whisky.title}</h2>
			<div style="width: 35%; position: absolute; height: 70px;">
				<div style="margin-top: 5%;">
					<fmt:formatDate value="${whisky.writedate}"
						pattern="yyyy-MM-dd HH:mm:ss" />
				</div>
				<div>작성자 : ${whisky.userid}</div>
			</div>
			<div
				style="width: 50%; position: absolute; right: 0px; height: 70px;">


				<c:choose>
					<c:when test="${loginUser.admin==0}">
					
						<div style="text-align: left;">
							<div id="btns"
								style="justify-content: center; display: flex; float: right;">
								<div
									style="width: 20%; height: 55px; float: right; margin: 7px; margin-top: 30%">
									<a href="whiskyUpdate.do?bno=${whisky.bno}"
										class="btn btn-sm custom-button" id="btnList"
										style="width: 65px">수정</a>
								</div>
								<div
									style="width: 20%; height: 55px; float: right; margin: 7px; margin-top: 30%">
									<a href="whiskyDelete.do?bno=${whisky.bno}"
										class="btn btn-sm custom-button" id="btnList"
										style="width: 65px">삭제</a>
								</div>
								<div
									style="width: 20%; height: 55px; float: right; margin: 7px; margin-top: 30%">
									<a href="whiskyWrite.do?" class="btn btn-sm custom-button"
										id="btnList" style="width: 65px">글쓰기</a>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:if test="${loginUser.admin!=0}">
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			<div
				style="width: 90%; position: relative; height: 450px; margin: auto; top: 100px;">
				<div class="mb-5" style="display: flex; justify-content: center;">
					<c:choose>
						<c:when test="${empty whisky.filepath}">
							<img src="img/noimage.jpg" width="50%">
						</c:when>
						<c:otherwise>
							<img src="img/${whisky.filepath}"
								style="width: 50%; left: 200px;">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div
				style="width: 97%; position: relative; min-height: 400px; margin: auto; margin-top: 0%;">${whisky.bcontent}</div>
		</div>
		<div
			style="width: 100%; height: 450px; position: relative; margin-top: -10%;">
			<div
				style="width: 100%; height: 30px; display: flex; background-color: #060126; font-size: 15px; text-align: center;">
				<div style="width: 8%; color: white">번호</div>
				<div style="width: 59%; color: white">제목</div>
				<div style="width: 19%; color: white">작성일</div>
				<div style="width: 12%; color: white">조회수</div>
			</div>
			<c:forEach var="whiskyList" items="${whiskyList}">
				<div class="record">
					<div
						style="width: 100%; height: 30px; display: flex; font-size: 12px; text-align: center;">
						<div style="width: 8%;">
							<a href="whiskyRead.do?bno=${whiskyList.bno}">${whiskyList.bno}</a>
						</div>
						<div style="width: 59%;">
							<a href="whiskyRead.do?bno=${whiskyList.bno}">${whiskyList.title}</a>
						</div>
						<div style="width: 19%;">
							<fmt:formatDate value="${whiskyList.writedate}"
								pattern="yy-MM-dd HH:mm:ss" />
						</div>
						<div style="width: 12%;">${whiskyList.readcount}</div>
					</div>
				</div>
			</c:forEach>
			<div style="width: 100%; height: 50px;">
				<form method="get">
					<div class="paging" align="center">${map.pagingString}</div>
				</form>
			</div>
			<div style="width: 100%; height: 100px;">
				<form method="get">
					<div class="searchbar" border="1" width="90%">
						<div>
							<div align="center">
								<select name="searchField">
									<option value="title">제목</option>
									<option value="bcontent">내용</option>
								</select> <input type="text" name="searchWord" /> <input type="submit"
									class="btn btn-sm custom-button" id="btnList" value="검색" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 모바일크기일때 표기 끝 -->
</body>
</html>
