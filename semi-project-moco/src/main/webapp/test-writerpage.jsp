<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container" style="margin-top: 50px; padding: 0px 100px;">
	<div style="margin-bottom: 20px;">
		<div style="display: inline-block;">
			<h3>${requestScope.memberVO.nickname}님의 페이지</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4 text-center">
			<div class="card">
				<div class="card-header">
					<b>${requestScope.rank.grade}</b>
				</div>
				<c:choose>
					<c:when test="${requestScope.rank.grade =='새내기'}">
						<img class="user_rank_img" src="images/freshman.png">
					</c:when>
					<c:when test="${requestScope.rank.grade=='헌내기'}">
						<img class="user_rank_img" src="images/sophomore.png">
					</c:when>
					<c:when test="${requestScope.rank.grade=='사망년'}">
						<img class="user_rank_img" src="images/junior.png">
					</c:when>
					<c:when test="${requestScope.rank.grade=='고인물'}">
						<img class="user_rank_img" src="images/senior.png">
					</c:when>
					<c:when test="${requestScope.rank.grade =='졸업자'}">
						<img class="user_rank_img" src="images/graduatee.png">
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="card">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><b>이메일</b></li>
					<li class="list-group-item">${requestScope.memberVO.email}</li>
					<li class="list-group-item"><b>닉네임</b></li>
					<li class="list-group-item">${requestScope.memberVO.nickname}</li>
					<li class="list-group-item"><b>깃허브 주소</b></li>
					<li class="list-group-item">${requestScope.memberVO.github}</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="container" style="margin-top: 50px; padding: 0px 100px;">
	<div>
		<h3>${requestScope.memberVO.nickname}님의 게시물</h3>
	</div>
	<table class="table table-hover table-striped"
		style="margin-top: 30px;">
		<thead>
			<tr style="background-color: #d0ebff">
				<th class="title">제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>언어</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.postList}" var="pvo">
				<tr>
					<%-- 
							로그인한 상태이면 글제목에 링크를 부여해서 상세 글보기를 제공하고
							비로그인 상태이면 글제목만 제공한다
					 --%>
						<td><a
							href="PostDetailPageController.do?postNo=${pvo.post_no}&languageCode=${pvo.lvo.language_code}">${pvo.post_title}</a>
						</td>
						<td>${pvo.post_regdate}</td>
						<td>${pvo.hits}</td>
						<td>${pvo.lvo.language}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%-- 페이징 처리 --%>
		<ul class="pagination justify-content-center" style="margin: 20px 0">
			<c:if test="${pagingBean.previousPageGroup}">
				<li class="page-item"><a class="page-link"
					href="WriterPageController.do?nickname=${requestScope.memberVO.nickname}&pageNo=${pagingBean.startPageOfPageGroup-1}">Previous</a></li>
			</c:if>
			<c:forEach begin="${pagingBean.startPageOfPageGroup}"
				end="${pagingBean.endPageOfPageGroup}" var="page">
				<c:choose>
					<c:when test="${page == pagingBean.nowPage}">
						<li class="page-item active"><a class="page-link"
							href="WriterPageController.do?nickname=${requestScope.memberVO.nickname}&pageNo=${page}">${page}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="WriterPageController.do?nickname=${requestScope.memberVO.nickname}&pageNo=${page}">${page}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagingBean.nextPageGroup}">
				<li class="page-item"><a class="page-link"
					href="WriterPageController.do?nickname=${post.mvo.nickname}&pageNo=${pagingBean.endPageOfPageGroup+1}">Next</a></li>
			</c:if>
		</ul>
</div>