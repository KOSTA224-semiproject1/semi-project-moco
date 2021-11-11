<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container" style="margin-top: 50px; padding: 0px 100px;">
	<form action="EditMyInfoFormSubmitController.do" method="post" onsubmit="return checkEditForm()">
		<div style="margin-bottom: 20px;">
			<div style="display: inline-block;">
				<h3>개인정보 수정</h3>
			</div>
			<div style="display: inline-block; float: right;">
				<button type="submit" class="btn btn-primary">수정완료</button>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 text-center">
				<div class="card">
					<div class="card-header">
						<b>${sessionScope.rank.grade}</b>
					</div>
					<c:choose>
						<c:when test="${sessionScope.rank.grade =='새내기'}">
							<img class="user_rank_img" src="images/freshman.png">
						</c:when>
						<c:when test="${sessionScope.rank.grade=='헌내기'}">
							<img class="user_rank_img" src="images/sophomore.png">
						</c:when>
						<c:when test="${sessionScope.rank.grade=='사망년'}">
							<img class="user_rank_img" src="images/junior.png">
						</c:when>
						<c:when test="${sessionScope.rank.grade=='고인물'}">
							<img class="user_rank_img" src="images/senior.png">
						</c:when>
						<c:when test="${sessionScope.rank.grade =='졸업자'}">
							<img class="user_rank_img" src="images/graduatee.png">
						</c:when>
					</c:choose>
					<div class="card-body">
						<button class="btn btn-primary">나의 스크랩 리스트</button>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="card">
					<ul class="list-group list-group-flush">
						<li class="list-group-item" style="background-color:rgba(0,0,0,0.05);"><b>이메일</b></li>
						<li class="list-group-item"><input class="form-control" name="email" readonly="readonly" value="${sessionScope.mvo.email}"></li>
						<li class="list-group-item" style="background-color:rgba(0,0,0,0.05);"><b>닉네임</b></li>
						<li class="list-group-item">
							<input id="nickname" class="form-control" name="nickname" value="${sessionScope.mvo.nickname}" onkeyup="checkNickname()">
							<input id="nicknameFlag" type="hidden" value="">
							<p id="duplicateResult" style="font-size: 13px"><p>	    
						</li>
						<li class="list-group-item" style="background-color:rgba(0,0,0,0.05);"><b>깃허브 주소</b></li>
						<li class="list-group-item"><input class="form-control" name="github" value="${sessionScope.mvo.github}"></li>
					</ul>
				</div>
			</div>
		</div>
	</form>
</div>
<script>
	function checkEditForm() {
		let nickname = document.getElementById("nickname");
		let nicknameFlag = document.getElementById("nicknameFlag");
		
		if(nickname.value == "${sessionScope.mvo.nickname}") {
			return true;
		}
		if(nickname.value != nicknameFlag.value) {
			alert("중복된 닉네임 입니다.\n사용 가능한 닉네임으로 변경해주세요");
			return false;
		}
	}
	
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
			if(result.duplicate === false || nickname=="${sessionScope.mvo.nickname}") {
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
</script>