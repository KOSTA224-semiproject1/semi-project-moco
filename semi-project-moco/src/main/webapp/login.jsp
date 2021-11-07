<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row" style="margin-top: 100px">
		<div class="col-sm-4 offset-sm-4">
			<form action="LoginFormSubmitController.do" method="post">
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