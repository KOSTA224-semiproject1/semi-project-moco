<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-primary bg-light">
     <div class="container">
       <a class="navbar-brand" href="index.jsp">moco</a>
       <div class="d-grid gap-2 d-md-flex justify-content-md-end">
             <button class="btn btn-primary me-md-2" type="button" onclick="login()">로그인</button>
             <button class="btn btn-primary" type="button" onclick="register()">회원가입</button>
      </div>
     </div>
</nav>