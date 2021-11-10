<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<%-- codemirror CDN --%>
<script src="codemirror/lib/codemirror.js"></script>
<link href="codemirror/lib/codemirror.css" rel="stylesheet" />
<!--  언어설정 설정하기 -->
<script src="codemirror/mode/xml/xml.js"></script>
<script src="codemirror/mode/clike/clike.js"></script>
<script src="codemirror/mode/python/clike.js"></script>
<!--  테마 설정하기 -->
<link href="codemirror/theme/dracula.css" rel="stylesheet" />
<link href="codemirror/theme/solarized.css" rel="stylesheet" />
<link href="codemirror/theme/darcula.css" rel="stylesheet" />
<link href="codemirror/theme/icecoder.css" rel="stylesheet" />
<link href="codemirror/theme/duotone-light.css" rel="stylesheet" />
<link href="codemirror/theme/eclipse.css" rel="stylesheet" />
<link href="codemirror/theme/eclipse.css" rel="stylesheet" />

<style type="text/css">
/*마이페이지와 마이페이지 수정 둘다 쓰이는 css*/

/*마이페이지*/
.user_email {
	position: absolute;
	width: 758px;
	height: 145px;
	left: 816px;
	top: 126px;
	background: #C4C4C4;
}

.email {
	position: relative;
	top: 30px;
	text-align: center;
}

.user_nickname {
	position: absolute;
	width: 758px;
	height: 145px;
	left: 816px;
	top: 284px;
	background: #C4C4C4;
}

.nickname {
	position: relative;
	top: 30px;
	text-align: center;
}

.user_github {
	position: absolute;
	width: 758px;
	height: 145px;
	left: 816px;
	top: 441px;
	background: #C4C4C4;
}

.github {
	position: relative;
	top: 30px;
	text-align: center;
}

.user_rank {
	position: absolute;
	text-align: center;
	width: 418px;
	height: 86px;
	left: 375px;
	top: 500px;
	width: 418px;
}

.grade {
	position: relative;
	top: 30px;
	text-align: center;
}

.user_rank_img {
	position: absolute;
	width: 418px;
	height: 358px;
	left: 375px;
	top: 126px;
	background: #C4C4C4;
}

.center_img {
	position: relative;
	top: 70px;
	text-align: center;
}

.user_posts {
	position: absolute;
	width: 1199px;
	height: 321px;
	left: 375px;
	top: 606px;
	background: #C4C4C4;
}

.edit_profile {
	position: absolute;
	width: 1199px;
	height: 98px;
	left: 375px;
	top: 948px;
}

/* 마이페이지 수정 */
.e_user_email {
	position: absolute;
	width: 692px;
	height: 91px;
	left: 608px;
	top: 126px;
	background: #C4C4C4;
}

.e_user_nickname {
	position: absolute;
	width: 692px;
	height: 91px;
	left: 608px;
	top: 233px;
	background: #C4C4C4;
}

.e_user_github {
	position: absolute;
	width: 692px;
	height: 91px;
	left: 608px;
	top: 340px;
	background: #C4C4C4;
}

.e_user_password {
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
/* 헤더 */
.logo {
	width: 75px;
}

.lang-img {
	width: 150px;
}

.lang-img-box {
	margin: 20px 0;
}

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

.title {
	width: 50%;
}

.comment-header {
	position: relative;
	color: var(- -color-fg-default);
	background-color: var(- -color-canvas-default);
	border: 1px solid var(- -color-border-default);
	border-radius: 6px;
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
      
      document.getElementById("javaBoard").addEventListener('click', function(e) {
    	  console.log("test");
    	  location.href = "ListPageController.do?languageCode=1";
      });
      
      document.getElementById("pythonBoard").addEventListener('click', function(e) {
    	  location.href = "ListPageController.do?languageCode=2";
      });
      
      document.getElementById("cBoard").addEventListener('click', function(e) {
    	  location.href = "ListPageController.do?languageCode=3";
      });
      
      document.getElementById("etcBoard").addEventListener('click', function(e) {
    	  location.href = "ListPageController.do?languageCode=4";
      });
      
      function moveToMainPage() {
    	  location.href = "MainPageController.do";
      }

	  function moveToWritePage(code) {
    	  location.href = "WritePostPageController.do?languageCode=" + code;
      }

   </script>
</body>