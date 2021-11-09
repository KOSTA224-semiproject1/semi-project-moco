<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container pt-5"  style="margin-top: 50px; padding: 0px 100px;">
	<form action="EditPostController.do" method="post">
		<table class="table table-borderless">
			<tr>
				<td>
					<input type="hidden" name="postNo" value="${pvo.post_no}">
					<textarea rows="1" class="form-control" name="title" value="${pvo.post_title}" placeholder="제목을 입력해 주세요." required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="10" class="form-control" name="content">${pvo.post_content}</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="10" class="form-control" name="codeContent">${pvo.post_code}</textarea>
				</td>
			</tr>
		</table>
		<div class="text-center">
			<button class="btn btn-primary">등록</button>
		</div>
	</form>
</div>