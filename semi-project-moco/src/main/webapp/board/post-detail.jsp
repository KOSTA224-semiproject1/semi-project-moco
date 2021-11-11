<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container" style="margin-top: 50px; padding: 0px 100px;">
	<div>
		<script type="text/javascript">
			function scrapPost() {
				if (confirm("스크랩 하시겠습니까?")) {
					document.getElementById("scrapForm").submit();
				}
			}
		</script>
		<form action="ScrapController.do" id="scrapForm" method="post">
		<input type="hidden" name="postNo" id="postNo" value="${requestScope.pvo.post_no}">
		<input type="hidden" name="email" id="email" value="${sessionScope.mvo.email}">
			<button onclick="scrapPost()">스크랩</button>
		</form>
	</div><%-- 스크랩 --%>
	
	<table class="table">
	   <tr>
	      <td><b>제목:   ${requestScope.pvo.post_title}</b></td>
	      <td><b>작성자: ${requestScope.pvo.mvo.nickname}</b></td>
	      <td><b>작성일: ${requestScope.pvo.post_regdate}</b></td>
	      <td><b>조회수: ${requestScope.pvo.hits}</b></td>
	   </tr>
	   <tr>
	        <td colspan="4">
	            <p class="font-weight-bold" style="font-size: 1rem">소스코드</p>
	               <pre><textarea id = "editor" name="editor" rows="10">${requestScope.pvo.post_code}</textarea></pre>
	               <script>
	                   var editor = CodeMirror.fromTextArea
	                   (document.getElementById('editor'), {
	                       mode:"clike", 
	                       theme : "${sessionScope.theme}",
	                       lineNumbers: true,
	                   });
	               </script>
	            <%-- pre : db 에 저장된 글형식 그대로 표현  --%>
	        </td>
	    </tr>
	   <tr>
	      <td colspan="4" style="border: none">
	         <%-- pre : db 에 저장된 글형식 그대로 표현  --%>
	         <pre><font size="4"> ${requestScope.pvo.post_content} </font></pre>
	      </td>
	   </tr>
	   <%-- 글쓴이가 로그인한 회원이면 하단부에 삭제와 수정버튼을 제공한다  --%>
	   <c:if test="${requestScope.pvo.mvo.email == sessionScope.mvo.email}">
	      <tr>
	      <%--  부트스트랩에서 제공하는 중앙정렬 class : text-center   --%>
	         <td colspan="4" class="text-center">
	             <script type="text/javascript">
	                 function deletePost(){
	                     if(confirm("삭제하시겠습니까?")){
	                         document.getElementById("deletePostForm").submit();
	                     }
	                 }function updatePost(){
	                     if(confirm("수정하시겠습니까?")){
	                            document.getElementById("updateForm").submit();
	                        }
	                 }
	             </script>
	             <form action="DeletePostController.do" id="deletePostForm" method="post">
	                 <input type="hidden" name="postNo" id="no" value="${requestScope.pvo.post_no}">
	             </form>
	             <form action="EditPostPageController.do" id="updateForm" method="post">
	                    <input type="hidden" name="postNo" id="no" value="${requestScope.pvo.post_no}">
	                    <input type="hidden" name="languageCode" id="no" value="${requestScope.pvo.lvo.language_code}">
	                </form>
	            <button type="button" class="btn btn-primary" onclick="deletePost()">삭제</button>
	            <button type="button" class="btn btn-primary" onclick="updatePost()">수정</button>
	         </td>
	      </tr>
	   </c:if>
	</table>
</div>
<c:import url="${requestScope.url2}"></c:import>