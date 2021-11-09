<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
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
   </script>
</body>