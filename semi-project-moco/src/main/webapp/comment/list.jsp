<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<c:forEach items="${requestScope.commentList}" var="comment">
	    <%-- <tr>
	      <td>${comment.comment_no}</td>
	      <td>${comment.content}</td>
	      <td>${comment.id}</td>
	      <td><button>삭제</button></td>
	    </tr> --%>
		   <div  class="container" style="margin-top: 50px; padding: 0px 100px;">
		   <div class="card">
		     <div class="card-header">
		       ${comment.mvo.nickname}
		     </div>
		     <div class="card-body">
		       <p id="comment" class="card-text" style="display:block;">${comment.comment_content}</p>
		       <input id="hiddenInput" type="text" style="display: none; width: 400px">
		       <button id="editStartBtn" class="btn btn-primary" onclick="editStart()" style="display: block;">Edit Start</button>
		       <button id="editEndBtn" class="btn btn-primary" onclick="editEnd()" style="display: none;">Edit End</button>
		     </div>
		   </div>
		</div>
		<script>
		<%-- 댓글 수정하기 버튼 동작 --%>
		   function editStart() {
		      let hiddenInput = document.getElementById("hiddenInput");
		      let comment = document.getElementById("comment");
		      let editStartBtn = document.getElementById("editStartBtn");
		      let editEndBtn = document.getElementById("editEndBtn");
		      hiddenInput.style.display = "block";
		      comment.style.display = "none";
		      editStartBtn.style.display = "none";
		      editEndBtn.style.display = "block";
		      console.log(comment.value);
		      hiddenInput.value = comment.textContent;
		   }
		   <%-- 수정 완료하기 버튼 동작 --%>
		   function editEnd() {
		      let hiddenInput = document.getElementById("hiddenInput");
		      let comment = document.getElementById("comment");
		      let editStartBtn = document.getElementById("editStartBtn");
		      let editEndBtn = document.getElementById("editEndBtn");
		      hiddenInput.style.display = "none";
		      comment.style.display = "block";
		      editStartBtn.style.display = "block";
		      editEndBtn.style.display = "none";
		   }
		</script>
	</c:forEach>
	<%-- 댓글 작성 창 --%>
	<div class="card">
    <div class="form-group">
        <form method="post" action="WriteCommentController.do">
            <input type="hidden" value="${requestScope.pvo.post_no}" id="postNo" name="postNo">
            <input type="hidden" name="languageCode" id="no" value="${requestScope.languageCode}">
            <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <tr>
                    <td class="col-sm-2 offset-sm-1" style="border-bottom:none;" valign="middle"><br><br><b>댓글내용 *</b></td>
                    <td class="col-sm-6"><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "comment_content"></td>
                    <td class="col-sm-2"><br><br><input type="submit" class="btn-primary pull" value="댓글 작성" style="height:50px"></td>
                </tr>
            </table>
            </div>
        </form>
    </div>
</div>
</table>	
<table class="table">
	<div class="card-mb-2">
	    <div class="card-header bg-light" style="text-align: left; font-variant:border">
	        <label><b>댓글작성 * </b></label>
	    </div>
	    <div class="card-body">
	        <ul class="list-group list-group-flush">
	            <li class="list-group-item">
	            <textarea class="form-control" id="exampleFormControlTextarea1" rows="4"></textarea>
	            <button type="button" class="btn btn-primary" id="comment-create-btn">제출</button>
	            <!--  <button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">post reply</button> -->
	            </li>
	        </ul>
	    </div>
	</div>
</table>