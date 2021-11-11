<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style type="text/css" style="padding: 0px 100px">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 
.container{
	color:#666666;font-family:'Nanum Gothic';font-size:20px;}
}
</style>
<script type="text/javascript">
function checkRegForm() {
	let nickname = document.getElementById("nickname");
	let nicknameFlag = document.getElementById("nicknameFlag");
	if(nickname.value != nicknameFlag.value) {
		if(nickname.value == loginMemberVO.nickname) return;
		alert("중복된 닉네임 입니다.\n사용 가능한 닉네임으로 변경해주세요");
		return false;
	}
	
	if (document.getElementById("pass").value != document
			.getElementById("confirmPass").value) {
		alert("비밀번호가 일치하지 않습니다");
		return false;
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
<div class="container" >
<form action="EditMyInfoFormSubmitController.do" method="post" onsubmit="return checkRegForm()">	
	<div class="e_user_email">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td style="background-color: #fafafafa; text-align:center; "><h5>이메일</h5></td>
					<td><input name="email" class="form-control" type="text" id="registerName" size="20" value="${sessionScope.loginMemberVO.email}" readonly="readonly"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="e_user_nickname">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td style="background-color: #fafafafa; text-align:center; "><h5>닉네임</h5></td>
					<td><input name="nickname" class="form-control" type="text" id="nickname" size="20" value="${sessionScope.loginMemberVO.nickname}" onkeyup="checkNickname()"></td>
					    <input id="nicknameFlag" type="hidden" value="">
						<p id="duplicateResult" style="font-size: 13px"><p>	    
				</tr>
			</tbody>
		</table>
	</div>	
	<div class="e_user_github">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td style="background-color: #fafafafa; text-align:center; "><h5>깃허브</h5></td>
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon3">www.github.com/</span>
					</div>
					<c:set var="githubUserName" value="${sessionScope.loginMemberVO.github}"/>
					<td><input id="basic-url" aria-describedby="basic-addon3" name="github" class="form-control" type="text" size="20" value="${fn:substring(githubUserName,15,fn:length(githubUserName)  ) }"></td>
				</tr>
			</tbody>
		</table>
	</div>	
	<div class="e_user_password">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<div class="input-group mb-3">
						<td style="background-color: #fafafafa; text-align:center; "><h5>비밀번호</h5></td>
						<td><input name="password" id="pass" class="form-control" type="password" maxlength="100" size="20" value="${sessionScope.loginMemberVO.password}" onkeyup="return passwordChanged();"></td>
						<div class="input-group-append">
							<span id="strength" class="input-group-text">보안</span>
						</div>
					</div>
					<div>
						<p id="passwordLength" style="font-size: 13px"><p>
					</div>	
				</tr>
			</tbody>
		</table>
	</div>	
	<div class="e_user_password_check">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<div class="input-group mb-3">
						<td style="background-color: #fafafafa; text-align:center; "><h5>비밀번호 확인</h5></td>
						<td><input name="confirmPassword" id="confirmPass" class="form-control" type="password" size="20" value="${sessionScope.loginMemberVO.password}" onkeyup="checkPassword()"></td>
					</div>
					<div>
						<p id="confirmResult" style="font-size: 13px"><p>
					</div>	
				</tr>
			</tbody>
		</table>
	</div>	
	<div class="edit_profile">
		<button type="submit" class="btn btn-primary btn-lg btn-block" onclick="">수정하기</button>
	</div>
	<div class="user_rank">
		<div class="grade">${sessionScope.rank.grade}</div>
	</div>
	<div class="user_rank_img">
		<div class="center_img">

			<c:choose>
				<c:when test="${sessionScope.rank.grade == '새내기'}">
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
</form>
</div>
<script type="text/javascript">
	function checkNickname() {
		console.log("checkNickname");
		
		let nickname = document.getElementById("nickname").value;
		let duplicateResult = document.getElementById("duplicateResult");
		let nicknameFlag = document.getElementById("nicknameFlag");
		
		let xhr = new XMLHttpRequest();
		// 서버로부터 응답 받았을 때 동작할 익명함수를 등록
		xhr.onload = () => {//서버와 통신할 때 사용할 처리 방법
			console.log(xhr.responseText);
			const json = xhr.responseText;
			const result = JSON.parse(json);
			
			console.log(result.duplicate);
			if(result.duplicate === false || nickname=="${sessionScope.loginMemberVO.nickname}") {
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

