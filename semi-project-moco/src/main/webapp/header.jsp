<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-primary bg-light navShadow">
	<div class="container" style="padding: 0px 100px">
		<a class="navbar-brand" href="index.jsp"> <img class="logo"
			src="images/logo.png"></a>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<c:choose>
				<c:when test="${sessionScope.mvo==null}">
					<form method="post" action="LoginController.do">
						<button class="btn btn-primary me-md-2" type="submit">로그인</button>
						<button class="btn btn-primary" type="button" onclick="register()">회원가입</button>
					</form>
				</c:when>
				<c:otherwise>
					<span class="navbar-text">${sessionScope.loginMemberVO.nickname}님&nbsp;&nbsp;
						, 안녕하세요.&nbsp;&nbsp;&nbsp;</span>
					<form action="LogoutController.do" method="post" id="logoutForm"></form>
					<button class="btn btn-primary me-md-2" onclick="logout()"
						type="submit">로그아웃</button>
					<button class="btn btn-primary me-md-2" style="margin-left: 5px;" onclick="moveToMypage()">마이페이지</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>
<script>
	function logout() {
		let result = confirm("로그아웃하시겠습니까?");
		if (result) {
			document.getElementById("logoutForm").submit();
		}
	}
	function moveToMypage() {
		location.href = "MyPageController.do";
	}
</script>