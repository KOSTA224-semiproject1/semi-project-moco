<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<style type="text/css">
/*마이페이지와 마이페이지 수정 둘다 쓰이는 css*/
.user_rank {
	position: absolute;
	width: 382px;
	height: 78px;
	left: 205px;
	top: 467px;
	
	background: #C4C4C4;
}

.user_rank_img {
	position: absolute;
	width: 382px;
	height: 326px;
	left: 205px;
	top: 126px;
	
	background: #C4C4C4;
}

.user_posts {
	position: absolute;
	width: 1095px;
	height: 293px;
	left: 205px;
	top: 563px;
	
	background: #C4C4C4;
}

.edit_profile {
	position: absolute;
	width: 1095px;
	height: 89px;
	left: 205px;
	top: 875px;
}

/*마이페이지*/
.user_email{
	position: absolute;
	width: 692px;
	height: 132px;
	left: 608px;
	top: 126px;

	background: #C4C4C4;
}
.user_nickname{
	position: absolute;
	width: 692px;
	height: 132px;
	left: 608px;
	top: 270px;
	
	background: #C4C4C4;
}
.user_github{
	position: absolute;
	width: 692px;
	height: 132px;
	left: 608px;
	top: 413px;
	
	background: #C4C4C4;
}


/* 마이페이지 수정 */
.e_user_email{
	position: absolute;
	width: 692px;
	height: 91px;
	left: 608px;
	top: 126px;
	
	background: #C4C4C4;	
}

.e_user_nickname{
	position: absolute;
	width: 692px;
	height: 91px;
	left: 608px;
	top: 233px;
	
	background: #C4C4C4;
}

.e_user_github{
	position: absolute;
	width: 692px;
	height: 91px;
	left: 608px;
	top: 340px;
	
	background: #C4C4C4;
}

.e_user_password{
	position: absolute;
	width: 692px;
	height: 91px;
	left: 608px;
	top: 453px;
	
	background: #C4C4C4;
}

/* 로고 */
.logo {
	width: 75px;
}

.lang-img {
	width: 150px;
}

.lang-img-box {
	margin: 20px 0;
}

/* 메인페이지 카테고리 */
.card {
	box-shadow: none;
	transform: scale(1);
	transition-duration: 0.3s;
}

.card:hover {
	box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.1);
	transform: scale(1.005);
	transition-duration: 0.3s;
}

</style>
</head>
<body>
	<c:import url="header.jsp"></c:import>
	<c:import url="${requestScope.url}"></c:import>
	<script>
     <%-- const login = () => {
         location.href = "LoginController.do";
      }
      --%>
      const register = () => {
         location.href = "RegisterPageController.do";
      }
   </script>
</body>