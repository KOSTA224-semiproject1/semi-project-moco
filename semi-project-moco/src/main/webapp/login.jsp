<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container text-center">
	<div class="row" style="margin-top: 130px">
		<div class="col-sm-6 offset-sm-3">
			<div class="formBox" style="border: 1px solid rgba(0,0,0,0.2);">
				<form action="LoginFormSubmitController.do" method="post" style="margin: 60px;">
					<img class="mb-4" src="images/logo.png" style="width: 150px;">
					<h1 class="h4 mb-3 font-weight-normal">로그인 해주세요</h1>
					<div class="input-group mb-3">
						<input class="form-control" type="text" name="email" placeholder="이메일" required="required">
					</div>
					<div class="input-group mb-3">
						<input class="form-control" type="password" name="password" placeholder="패스워드" required="required">
					</div>
					<button type="submit" class="btn btn-primary btn-block">로그인</button>
				</form>
			</div>
		</div>
	</div>
</div>	