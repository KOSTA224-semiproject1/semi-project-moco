<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 
.container{
	color:#666666;font-family:'Nanum Gothic';font-size:20px;}
}
</style>
<div class="container" >


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
				<c:forEach items="${sessionScope.list}" var="pvo">
					<tr>
						<td><c:choose>
								<c:when test="${sessionScope.mvo != null}">
									<a href="PostDetailPageController.do?postNo=${pvo.post_no}">${pvo.post_title}</a>
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

	</div>
	<div class="user_rank">
		<div class="grade">${sessionScope.rank.grade}</div>
	</div>
	<div class="user_rank_img">
		<div class="center_img">

			<c:choose>
				<c:when test="${sessionScope.rank.grade =='새내기'}">
					<img src="images/freshman.png">
				</c:when>
				<c:when test="${sessionScope.rank.grade=='헌내기'}">
					<img src="images/freshman.png">
				</c:when>
				<c:when test="${sessionScope.rank.grade=='사망년'}">
					<img src="images/freshman.png">
				</c:when>
				<c:when test="${sessionScope.rank.grade=='고인물'}">
					<img src="images/freshman.png">
				</c:when>
				<c:when test="${sessionScope.rank.grade =='졸업자'}">
					<img src="images/freshman.png">
				</c:when>

			</c:choose>
		</div>
	</div>

	<div class="edit_profile">
		<form action="EditMyInfoController.do">
			<button type="submit" class="btn btn-primary btn-lg btn-block">회원정보수정</button>
		</form>
	</div>
</div>




