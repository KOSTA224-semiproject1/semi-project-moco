<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container pt-5" style="margin-top: 50px; padding: 0px 100px;">
	<form action="WritePostController.do" method="post">
		<input type="hidden" name="languageCode" value="${requestScope.languageCode }">
		<table class="table table-borderless">
			<tr>
				<td>
					<textarea rows="1" class="form-control" name="title" placeholder="제목을 입력해 주세요." required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<label><b>소스코드</b></label> &nbsp; &nbsp;
					<pre>
						<textarea id="editor" name="codeContent" rows="10"></textarea>
					</pre>
					<script>
						var editor = CodeMirror.fromTextArea(document
								.getElementById('editor'), {
							mode : "clike",
							theme : "duotone-light",
							lineNumbers : true,
						});
					</script>
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="10" class="form-control" name="content" placeholder="내용을 입력하세요."></textarea>
				</td>
			</tr>
		</table>
		<div class="text-center">
			<button type="submit" class="btn btn-primary">등록</button>
		</div>
	</form>
</div>