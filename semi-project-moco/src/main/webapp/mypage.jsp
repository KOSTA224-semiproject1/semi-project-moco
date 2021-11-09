<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    





<div class="user_nickname">
	닉네임 : ${sessionScope.loginMemberVO.nickname}
</div>
<div class="user_github">
	깃허브주소 : ${sessionScope.loginMemberVO.github}
</div>
<div class="user_email">
	이메일 : ${sessionScope.loginMemberVO.email}
</div>
<div class="user_rank_img">

</div>
<div class="user_rank">

</div>
<div class="user_posts">
	
</div>





<div class="edit_profile">
	<form action="EditMyInfoController.do" >
		<button type="submit" class="btn btn-primary btn-lg btn-block">회원정보수정</button>
	</form>
</div>




