<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function checkRegForm() {
		let nickname = document.getElementById("nickname");
		let nicknameFlag = document.getElementById("nicknameFlag");
		
		if (document.getElementById("pass").value != document
				.getElementById("confirmPass").value) {
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
		if (document.getElementById("flag").value != document
				.getElementById("email").value) {
			alert("인증받은 아이디가 아닙니다 \n아이디 중복확인하세요");
			return false;
		}
		if(nickname.value != nicknameFlag.value) {
			alert("중복된 닉네임 입니다.\n사용 가능한 닉네임으로 변경해주세요");
			return false;
		}
		
	}
	function checkEmail() {
		let email = document.getElementById("email");
		if (email.value == "") {
			alert("아이디(이메일)을 입력하세요");
		} else {
			window.open("EmailCheckController.do?email=" + email.value, "mypopup",
					"width=350,height=150,top=150,left=400");
		}
	}
	function passwordChanged() {
		let confirmPass = document.getElementById('confirmPass');
		let pass = document.getElementById('pass');
		let confirmResult = document.getElementById('confirmResult');
		
		if(confirmPass.value == pass.value) {
			confirmResult.textContent = "비밀번호가 일치합니다";
			confirmResult.style.color = "#007bff";
		}
		else {
			confirmResult.textContent = "비밀번호가 일치하지 않습니다";
			confirmResult.style.color = "red";
		}
		if(confirmPass.value == "" && pass.value == "") {
			confirmResult.textContent = "";
		}
		
		
		let passwordLength = document.getElementById('passwordLength');
		
		var strength = document.getElementById('strength');
		var strongRegex = new RegExp(
				"^(?=.{10,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
		var mediumRegex = new RegExp(
				"^(?=.{8,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$",
				"g");
		var enoughRegex = new RegExp("(?=.{6,}).*", "g");
		var pwd = document.getElementById("pass");
		
		if (pwd.value.length == 0) {
			strength.innerHTML = '보안';
			passwordLength.textContent = "";
		} else if (false == enoughRegex.test(pwd.value)) {
			// strength.innerHTML = '8자리 이상 입력';
			passwordLength.textContent = "비밀번호는 6자리 이상 입력하셔야 합니다";
			passwordLength.style.color = "red";
		} else if (strongRegex.test(pwd.value)) {
			strength.innerHTML = '<span style="color:green">안전</span>';
			passwordLength.textContent = "";
		} else if (mediumRegex.test(pwd.value)) {
			strength.innerHTML = '<span style="color:orange">보통</span>';
			passwordLength.textContent = "";
		} else {
			strength.innerHTML = '<span style="color:red">약함</span>';
			passwordLength.textContent = "";
		}
	}
</script>
<div class="container text-center">
	<div class="row" style="margin-top: 50px;">
		<div class="col-sm-6 offset-sm-3">
			<div class="formBox" style="border: 1px solid rgba(0,0,0,0.2);">
				<form action="RegisterController.do" method="post" onsubmit="return checkRegForm()" style="margin: 60px;">
					<img class="mb-4" src="images/logo.png" style="width: 150px;">
					<h1 class="h4 mb-3 font-weight-normal">회원가입</h1>
					<div class="input-group mb-3">
						<input type="email" class="form-control" name="email" id="email" required="required" placeholder="아이디(이메일)">
						<input type="hidden" id="flag" value="">
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
					<div>
						<p id="passwordLength" style="font-size: 13px"><p>
					</div>
					<%-- input group mb-3 --%>
					<div class="input-group mb-3">
						<input type="password" class="form-control" name="confirmPassword" id="confirmPass" required="required" placeholder="비밀번호 확인" onkeyup="checkPassword()">
					</div>
					<div>
						<p id="confirmResult" style="font-size: 13px"><p>
					</div>
					<div class="input-group mb-3">
						<input id="nickname" type="text" class="form-control" name="nickname" required="required" placeholder="닉네임" onkeyup="checkNickname()">
						<input id="nicknameFlag" type="hidden" value="">
					</div>
					<div>
						<p id="duplicateResult" style="font-size: 13px"><p>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon3">www.github.com/</span>
						</div>
						<input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3" name="github" required="required" placeholder="username">
					</div>
					<button type="submit" class="btn btn-primary btn-block">회원가입</button>
				</form>
			</div>
		</div>
		<%--col-sm-4 offset-sm-4 div --%>
	</div>
	<%-- row div --%>
</div>
<%-- container --%>
<script>
	function checkNickname() {
		console.log("checkNickname");
		
		let nickname = document.getElementById("nickname").value;
		let duplicateResult = document.getElementById("duplicateResult");
		
		let nicknameFlag = document.getElementById("nicknameFlag");
		
		let xhr = new XMLHttpRequest();
		// 서버로부터 응답 받았을 때 동작할 익명함수를 등록
		xhr.onload = () => {
			console.log(xhr.responseText);
			const json = xhr.responseText;
			const result = JSON.parse(json);
			
			console.log(result.duplicate);
			if(result.duplicate === false) {
				console.log("사용가능");
				duplicateResult.innerHTML = "사용 가능한 닉네임입니다";
				duplicateResult.style.color = "#007bff";
				nicknameFlag.value = nickname;
			}
			else {
				console.log("사용불가");
				duplicateResult.innerHTML = "사용 불가한 닉네임입니다";
				duplicateResult.style.color = "red";
				nicknameFlag.value = "";
			}
			
			if(nickname == "") {
				duplicateResult.textContent = "";
			}
		}
		xhr.open("get", "NicknameCheckServlet?nickname=" + nickname);
		xhr.send();
	}
	
	function checkPassword() {
		let confirmPass = document.getElementById('confirmPass');
		let pass = document.getElementById('pass');
		let confirmResult = document.getElementById('confirmResult');
		
		if(confirmPass.value == pass.value) {
			confirmResult.textContent = "비밀번호가 일치합니다";
			confirmResult.style.color = "#007bff";
		}
		else {
			confirmResult.textContent = "비밀번호가 일치하지 않습니다";
			confirmResult.style.color = "red";
		}
		if(confirmPass.value == "" && pass.value == "") {
			confirmResult.textContent = "";
		}
	}
</script>