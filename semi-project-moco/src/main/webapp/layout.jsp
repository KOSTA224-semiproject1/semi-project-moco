<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<%-- codemirror CDN --%>
<script src="codemirror/lib/codemirror.js"></script>
<link href="codemirror/lib/codemirror.css" rel="stylesheet" />
<!--  언어설정 설정하기 -->
<script src="codemirror/mode/xml/xml.js"></script>
<script src="codemirror/mode/clike/clike.js"></script>
<script src="codemirror/mode/python/clike.js"></script>
<!--  테마 설정하기 -->
<link href="codemirror/theme/darcula.css" rel="stylesheet" />
<link href="codemirror/theme/dracula.css" rel="stylesheet" />
<link href="codemirror/theme/duotone-dark.css" rel="stylesheet" />
<link href="codemirror/theme/eclipse.css" rel="stylesheet" />
<link href="codemirror/theme/duotone-light.css" rel="stylesheet" />
<link href="codemirror/theme/icecoder.css" rel="stylesheet" />
<link href="codemirror/theme/solarized.css" rel="stylesheet" />
<link href="codemirror/theme/tomorrow-night-bright.css" rel="stylesheet" />
<link href="codemirror/theme/tomorrow-night-eighties.css" rel="stylesheet" />
<link href="codemirror/theme/rubyblue.css" rel="stylesheet" />
<link href="codemirror/theme/pastel-on-dark.css" rel="stylesheet" />
<link href="codemirror/theme/neo.css" rel="stylesheet" />
<link href="codemirror/theme/twilight.css" rel="stylesheet" />
<link href="css/button.css" rel="stylesheet" />
<style type="text/css">
/*마이페이지와 마이페이지 수정 둘다 쓰이는 css*/
/*마이페이지*/
.user_email {
   position: absolute;
   width: 758px;
   height: 145px;
   left: 816px;
   top: 126px;
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
   width: 150x;
   height: 150px;
   margin-top: 20px;
}
.user_posts {
   position: absolute;
   width: 1199px;
   height: 321px;
   left: 375px;
   top: 606px;

}
.edit_profile {
   position: absolute;
   width: 1199px;
   height: 98px;
   left: 375px;
   top: 1030px;
}
.send_message {
   position: absolute;
   width: 1199px;
   height: 98px;
   left: 375px;
   top: 1030px;
}
.send_message {
	position: absolute;
	width: 1199px;
	height: 98px;
	left: 375px;
	top: 1030px;
}
/* 마이페이지 수정 */
.e_user_email {
   position: absolute;
   width: 692px;
   height: 91px;
   left: 608px;
   top: 126px;
}
.e_user_nickname {
   position: absolute;
   width: 692px;
   height: 91px;
   left: 608px;
   top: 233px;
}
.e_user_github {
   position: absolute;
   width: 692px;
   height: 91px;
   left: 608px;
   top: 340px;
}
.e_user_password {
   position: absolute;
   width: 692px;
   height: 91px;
   left: 608px;
   top: 410px;
}
.e_user_password_check{
   position: absolute;
   width: 692px;
   height: 91px;
   left: 608px;
   top: 530px;
}
/* 로고 */
.logo {
   width: 75px;
}
.lang-img {
   width: 120px;
   opacity: 1;
}
/* 메인페이지 카테고리 */
.boxShadow {
   box-shadow: none;
   transform: scale(1);
   transition-duration: 0.3s;
}
.boxShadow:hover {
   box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.2);
   transform: scale(1.005);
   transition-duration: 0.3s;
}
.boardCard {
	height: 250px;
	border-radius: 20px;
}
/* 헤더 */
.lang-img-box {
   margin: 20px 0;
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
.animated1 {
	transition-property: margin-top, opacity;
	transition-duration: 1.5s;
}
.animated2 {
	transition-property: margin-right, opacity;
	transition-duration: 1.5s;
	transition-delay: 0.1s;
}
.animated3 {
	transition-property: margin-left, opacity;
	transition-duration: 1.5s;
	transition-delay: 0.1s;
}
.animated4 {
	transition-property: margin-top, opacity;
	transition-duration: 1.5s;
	transition-delay: 0.2s;
}
.navShadow {
	box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.3);
}
.formBox {
	border-radius: 15px;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.15);
}
</style>
<script>
	function startPage() {
		/*
		let con = document.getElementById("con");
		con.style.marginTop = "50px";
		con.style.opacity = "1";
		*/
		let welcomText1 = document.getElementById("welcomText1");
		
		let monitor = document.getElementById("monitor");
		let code = document.getElementById("code");
		
		let welcomText2 = document.getElementById("welcomText2");
		let welcomText3 = document.getElementById("welcomText3");
		
		welcomText1.style.marginTop = "100px";
		welcomText1.style.opacity = "1";
		
		monitor.style.marginRight = "0";
		monitor.style.opacity = "1";
		code.style.marginLeft = "0";
		code.style.opacity = "1";
		
		welcomText2.style.opacity = "1";
		welcomText3.style.opacity = "1";
	}
	window.onload = startPage;
	
	
	document.addEventListener('scroll', () => {
		const currentScrollPercentage = (window.scrollY);
		console.log(currentScrollPercentage);
		if(currentScrollPercentage > 300){
			let con = document.getElementById("con");
			con.style.marginTop = "200px";
			con.style.opacity = "1";
		}
	});
</script>
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
	  function onEnter() {
		  var keyCode = window.event.keyCode;
		  if(keyCode == 13) {
			  searchForm.submit();
		  }
	  }
   </script>
</body>