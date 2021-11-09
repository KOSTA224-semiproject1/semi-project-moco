<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function checkRegForm() {
		if (document.getElementById("pass").value != document
				.getElementById("confirmPass").value) {
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
		if (document.getElementById("flag").value != document
				.getElementById("id").value) {
			alert("인증받은 아이디가 아닙니다 \n아이디 중복확인하세요");
			return false;
		}
	}
	function checkEmail() {
		let mid = document.getElementById("email");
		if (mid.value == "") {
			alert("아이디(이메일)을 입력하세요");
		} else {
			window.open("EmailCheckController.do?email=" + mid.value, "mypopup",
					"width=350,height=150,top=150,left=400");
		}
	}
	function passwordChanged() {
		var strength = document.getElementById('strength');
		var strongRegex = new RegExp(
				"^(?=.{14,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
		var mediumRegex = new RegExp(
				"^(?=.{10,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$",
				"g");
		var enoughRegex = new RegExp("(?=.{8,}).*", "g");
		var pwd = document.getElementById("pass");
		if (pwd.value.length == 0) {
			strength.innerHTML = '비밀번호 강도';
		} else if (false == enoughRegex.test(pwd.value)) {
			strength.innerHTML = '사용불가';
		} else if (strongRegex.test(pwd.value)) {
			strength.innerHTML = '<span style="color:green">안전</span>';
		} else if (mediumRegex.test(pwd.value)) {
			strength.innerHTML = '<span style="color:orange">보통</span>';
		} else {
			strength.innerHTML = '<span style="color:red">사용불가</span>';
		}
	}
</script>
<div class="container">
	<div class="row" style="margin-top: 50px;">
		<div class="col-sm-4 offset-sm-4">
			<form action="RegisterController.do" method="post" onsubmit="return checkRegForm()">
				<div class="input-group mb-3">
					<input type="email" class="form-control" name="email" id="email" required="required" placeholder="아이디(이메일)"> <input type="hidden" id="flag" value="">
					<div class="input-group-append">
						<button type="button" onclick="checkEmail()" class="btn btn-outline-primary">중복확인</button>
					</div>
					<%-- input -group-append --%>
				</div>
				<%-- input group mb-3 --%>
				<div class="input-group mb-3">
					<input type="password" class="form-control" name="password" id="pass" required="required" placeholder="비밀번호" maxlength="100" onkeyup="return passwordChanged();">
					<div class="input-group-append">
						<span id="strength" class="input-group-text">보안</span>
					</div>
				</div>
				<%-- input group mb-3 --%>
				<div class="input-group mb-3">
					<input type="password" class="form-control" name="confirmPassword" id="confirmPass" required="required" placeholder="비밀번호 재확인">
				</div>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="nickname" required="required" placeholder="닉네임">
				</div>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="github" required="required" placeholder="github 주소">
				</div>
				<button type="submit" class="btn btn-primary btn-block">회원가입</button>
			</form>
		</div>
		<%--col-sm-4 offset-sm-4 div --%>
	</div>
	<%-- row div --%>
</div>
<%-- container --%>