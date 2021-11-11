<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css" style="padding: 0px 100px">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 
.container{
	color:#666666;font-family:'Nanum Gothic';font-size:20px;}
}
</style>
<div class="container" >

<form action="EditMyInfoFormSubmitController.do" method="post">	
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
					<td><input name="github" class="form-control" type="text" size="20" value="${sessionScope.loginMemberVO.github}"></td>
				</tr>
			</tbody>
		</table>
	</div>	
	<div class="e_user_password">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td style="background-color: #fafafafa; text-align:center; "><h5>비밀번호</h5></td>
					<td><input name="password" class="form-control" type="text" size="20" value="${sessionScope.loginMemberVO.password}"></td>
				</tr>
			</tbody>
		</table>
	</div>	
	<div class="edit_profile">
		<button type="submit" class="btn btn-primary btn-lg btn-block">수정하기</button>
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
</script>

