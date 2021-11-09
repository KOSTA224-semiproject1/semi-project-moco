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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	
	<%-- codemirror CDN --%>
	<script src="codemirror/lib/codemirror.js"></script>
	<link href="codemirror/lib/codemirror.css" rel="stylesheet"/>
	<!--  언어설정 설정하기 -->
	<script src="codemirror/mode/xml/xml.js"></script>
	<script src="codemirror/mode/clike/clike.js"></script>
	<script src="codemirror/mode/python/clike.js"></script>
	<!--  테마 설정하기 -->
	<link href="codemirror/theme/dracula.css" rel="stylesheet"/>
	<link href="codemirror/theme/solarized.css" rel="stylesheet"/>
	<link href="codemirror/theme/darcula.css" rel="stylesheet"/>
	<link href="codemirror/theme/icecoder.css" rel="stylesheet"/>
	<link href="codemirror/theme/duotone-light.css" rel="stylesheet"/>
	<link href="codemirror/theme/eclipse.css" rel="stylesheet"/>
	<link href="codemirror/theme/eclipse.css" rel="stylesheet"/>
	
	<style type="text/css">
		.logo{
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
		    box-shadow:5px 5px 20px rgba(0, 0, 0, 0.1); 
		    transform: scale(1.005);
		    transition-duration: 0.3s;
		}
		
		.title {
			width: 50%;
		}
		.comment-header{
		    position: relative;
		    color: var(--color-fg-default);
		    background-color: var(--color-canvas-default);
		    border: 1px solid var(--color-border-default);
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