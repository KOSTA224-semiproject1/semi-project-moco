<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>



<form action="EditMyInfoFormSubmitController.do" method="post">
	<div class="e_user_nickname">
		닉네임 : <input type="text" name="nickname" value="${sessionScope.loginMemberVO.nickname}">	
	</div>
	<div class="e_user_github">
		깃허브 : <input type="text" name="github" value="${sessionScope.loginMemberVO.github}">	
	</div>
	<div class="e_user_email">
		이메일 : <input type="text" name="email" value="${sessionScope.loginMemberVO.email}" readonly="readonly">
	</div>
	<div class="user_rank">
		<%-- 랭킹: ${sessionScope.mvo.} --%>
	</div>
	<div class="e_user_password">
		비밀번호 : <input type="text" name="password" value="${sessionScope.loginMemberVO.password}">
	</div>
	<div class="edit_profile">
		<button type="submit" class="btn btn-primary btn-lg btn-block">수정하기</button>
	</div>
	<div class="user_rank_img">

	</div>
	<div class="user_rank">
	
	</div>
	<div class="user_posts">
		
	</div>
</form>

