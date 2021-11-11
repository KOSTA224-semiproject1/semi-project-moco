<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.container {
	color: #666666;
	font-family: 'Nanum Gothic';
	font-size: 20px;
}
</style>

<div class="container">
<a href="ScrapListPageController.do">스크랩리스트</a>

	<div class="user_nickname">
		<div class="nickname">닉네임 :
			${sessionScope.loginMemberVO.nickname}</div>
	</div>
	<div class="user_github">
		<div class="github">깃허브주소 : ${sessionScope.loginMemberVO.github}
		</div>
	</div>
	<div class="user_email">
		<div class="email">이메일 : ${sessionScope.loginMemberVO.email}</div>
	</div>

	<div class="user_posts">

		<table class="table table-hover table-bordered boardlist">
			<thead>
				<tr style="background-color: #d6f5d6">
					<th class="title">제목</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>언어</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sessionScope.postList}" var="pvo">
					<tr>
						<td><c:choose>
								<c:when test="${sessionScope.mvo != null}">
									<a
										href="PostDetailPageController.do?postNo=${pvo.post_no}&languageCode=${pvo.lvo.language_code}">${pvo.post_title}</a>
								</c:when>
								<c:otherwise>
								${pvo.post_title}
							</c:otherwise>
							</c:choose></td>
						<td>${pvo.post_regdate}</td>
						<td>${pvo.hits}</td>
						<td>${pvo.lvo.language}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<ul class="pagination justify-content-center" style="margin: 20px 0">
			<c:if test="${pagingBean.previousPageGroup}">
				<li class="page-item"><a class="page-link"
					href="MyPageController.do?pageNo=${pagingBean.startPageOfPageGroup-1}">Previous</a></li>
			</c:if>
			<c:forEach begin="${pagingBean.startPageOfPageGroup}"
				end="${pagingBean.endPageOfPageGroup}" var="page">
				<c:choose>
					<c:when test="${page == pagingBean.nowPage}">
						<li class="page-item active"><a class="page-link"
							href="MyPageController.do?pageNo=${page}">${page}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="MyPageController.do?pageNo=${page}">${page}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagingBean.nextPageGroup}">
				<li class="page-item"><a class="page-link"
					href="MyPageController.do?pageNo=${pagingBean.endPageOfPageGroup+1}">Next</a></li>
			</c:if>
		</ul>

	</div>


	<div class="user_rank">
		<div class="grade">${sessionScope.rank.grade}</div>
	</div>
	<div class="user_rank_img">
		<c:choose>
			<c:when test="${sessionScope.rank.grade =='새내기'}">
				<img src="images/freshman.png">
			</c:when>
			<c:when test="${sessionScope.rank.grade=='헌내기'}">
				<img src="images/sophomore.png">
			</c:when>
			<c:when test="${sessionScope.rank.grade=='사망년'}">
				<img src="images/junior.png">
			</c:when>
			<c:when test="${sessionScope.rank.grade=='고인물'}">
				<img src="images/senior.png">
			</c:when>
			<c:when test="${sessionScope.rank.grade =='졸업자'}">
				<img src="images/graduatee.png">
			</c:when>
		</c:choose>
	</div>


	<div class="edit_profile">
		<form action="EditMyInfoController.do">
			<button type="submit" class="btn btn-primary btn-lg btn-block">회원정보수정</button>
		</form>
	</div>
</div>