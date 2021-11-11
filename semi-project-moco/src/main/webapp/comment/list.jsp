<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<c:forEach items="${requestScope.commentList}" var="comment">
		   <div  class="container" style="margin-top: 20px; padding: 0px 100px;">
		   <div class="card">
		     <div class="card-header">
		       ${comment.mvo.nickname} &nbsp; &nbsp;  <span style="font-size:12px">${comment.comment_regdate}</span>
		       <div style="display: inline-block; float: right;">
		          <c:if test="${requestScope.pvo.can_select eq 'N' && sessionScope.mvo.email==requestScope.pvo.mvo.email}">
    		          <a class="button-62" href="javascript:selectComment('${comment.comment_no}', '${comment.mvo.email }')" >채택하기</a>
		          </c:if>
		          <c:if test="${requestScope.pvo.can_select eq 'Y' && comment.is_selected eq 'Y'}">
    		          <img alt="채택됨" src="images/selected.png">
		          </c:if>
		       </div>
		     </div>
		     <div class="card-body">
		       <p id="comment_${comment.comment_no}" class="card-text" style="display:block; margin-bottom: 0;">${comment.comment_content}</p>
		       <pre><textarea id="content_${comment.comment_no}" style="display: none;" class="form-control" id="exampleFormControlTextarea1" name = "comment_content" rows="2" required="required">${comment.comment_content}</textarea></pre>
<%-- 			   <textarea id="content_${comment.comment_no}" type="text" style="display: none; width: 400px" row="4">${comment.comment_content}</textarea>
 --%>		       <input type="hidden" id="original_content_${comment.comment_no}" value="${comment.comment_content}">
		       <%-- 수정하기 버튼 누를 경우  : 수정완료 버튼이 표시되게 한다. --%>
		       <%-- 수정은 해당 댓글의 작성자만 수정가능하다. --%>
		       <c:if test="${sessionScope.mvo.email == comment.mvo.email}"> 
		          <a id="editBtn_${comment.comment_no}" href="javascript:editStart('${comment.comment_no}')" style="color:blue; display: inline;">수정</a>
		       </c:if>
		       <%-- 수정완료 버튼을 누를경우  : DB 처리를 진행한다. --%>
		       <a id="editEndBtn_${comment.comment_no}" href="javascript:editEnd('${comment.comment_no}')" style="color:blue; display: none;">수정완료</a>
		       <a type="reset" id="editCancel_${comment.comment_no}" href="javascript:cancel('${comment.comment_no}')" style="color:blue; display: none;">취소</a>
		       <c:if test="${sessionScope.mvo.email == comment.mvo.email ||  sessionScope.mvo.email == requestScope.pvo.mvo.email}"> 
		          <a id="deleteBtn_${comment.comment_no}" href="javascript:deleteComment('${comment.comment_no}')" style="color:blue">삭제</a>
		       </c:if>
		       </div>
		   </div>
		</div>
        <form action="DeleteCommentController.do" method="post" id="deleteForm">
            <input type="hidden" value="${requestScope.pvo.post_no}" id="postNo" name="postNo">
            <input type="hidden" value="" name="comment_no" id="comment_no">
            <input type="hidden" name="languageCode" id="no" value="${requestScope.pvo.lvo.language_code}">
        </form>
        <form action="EditCommentController.do" method="post" id="editForm">
             <input type="hidden" value="${requestScope.pvo.post_no}" id="postNo" name="postNo">
             <input type="hidden" value="" name="comment_no" id="comment_no_edit">
             <input type="hidden" name="languageCode" id="no" value="${requestScope.pvo.lvo.language_code}">
             <input type="hidden" value="" id="postContent" name="postContent">
        </form>
        <form action="SelectCommentController.do" method="post" id="selectForm">
             <input type="hidden" value="${requestScope.pvo.post_no}" id="postNo" name="postNo">
             <input type="hidden" value="" name="comment_no" id="comment_no_select">
             <input type="hidden" value="" name="email" id="comment_email">
             <input type="hidden" name="languageCode" id="no" value="${requestScope.pvo.lvo.language_code}">
             <input type="hidden" value="" id="postContent" name="postContent">
        </form>
		<script>
		<%-- 댓글 수정하기 버튼 동작 --%>
		   function editStart(no) {
			   console.log(no);
		      let comment = document.getElementById("comment_"+no);            // 기존의 댓글 내용
		      let editBtn = document.getElementById("editBtn_"+no);            // 수정하기 버튼 후 textarea ( 수정 할 ) 
		      let cancel = document.getElementById("editCancel_"+no);          // 수정 취소버튼
		      let editEndBtn = document.getElementById("editEndBtn_"+no);      // 수정완료 버튼
		      let textarea = document.getElementById("content_"+no);           // 수정완료 버튼
		      let deleteBtn = document.getElementById("deleteBtn_"+no);
		      
		      <%-- 기존의 댓글 내용, 수정 버튼은 안보이기 --%>
		      comment.style.display = "none";
		      editBtn.style.display = "none";
		      
		      <%-- 수정버튼 누를 시, 취소와 수정완료 버튼이 보이기 --%>
		      cancel.style.display = "inline";
		      editEndBtn.style.display = "inline";
		      textarea.style.display = "block";
		      deleteBtn.style.display = "none";
		   }
		   <%-- 취소 버튼을 누를시 다시 원상 복구를 진행한다.--%>
		   function cancel(no) {
	              let comment = document.getElementById("comment_"+no);            // 기존의 댓글 내용
	              let editBtn = document.getElementById("editBtn_"+no);            // 수정하기 버튼 후 textarea ( 수정 할 ) 
	              let cancel = document.getElementById("editCancel_"+no);          // 수정 취소버튼
	              let editEndBtn = document.getElementById("editEndBtn_"+no);      // 수정완료 버튼
	              let textarea = document.getElementById("content_"+no);           // 수정완료 버튼
	              let original = document.getElementById("original_content_"+no);  // 기존의 댓글 내용 hidden 태그 값의
	              let deleteBtn = document.getElementById("deleteBtn_"+no);
	              
	              comment.value=original.value;
	              
	              comment.style.display = "block";
	              editBtn.style.display = "inline";
	              
	              cancel.style.display = "none";
	              editEndBtn.style.display = "none";
	              textarea.style.display = "none";
	              deleteBtn.style.display = "inline";
	        }
		   
		   <%-- 수정 완료하기 버튼 동작 -> DB 작업 진행 --%>
		   function editEnd(no) {
               document.getElementById("comment_no_edit").value=no;
               document.getElementById("postContent").value=document.getElementById('content_'+no).value
               document.getElementById('editForm').submit();
		   }
		   <%-- 해당 댓글 삭제하기 버튼 동작 구현--%>
		    function deleteComment(commentNo){
		        document.getElementById("comment_no").value=commentNo;    
		        document.getElementById('deleteForm').submit();
		    }
		    <%-- 해당 댓글 채택하기 버튼 동작 구현--%>
		    function selectComment(commentNo, comment_email){
		        document.getElementById("comment_no_select").value=commentNo;        
		        document.getElementById("comment_email").value=comment_email;        
                document.getElementById("selectForm").submit();
            }
		    
		</script>
	</c:forEach>
</table>
<div class="container" style="margin-top: 20px; padding: 0px 100px;">	
		<div class="card-mb-2" style="text-align: center; border: 1px solid #dddddd">
		    <div class="card-header bg-light" style="text-align: left; font-weight: normal">
		        <label><b>댓글작성 * </b></label>
		    </div>
		    <form method="post" action="WriteCommentController.do">
		        <input type="hidden" value="${requestScope.pvo.post_no}" id="postNo" name="postNo">
                <input type="hidden" name="languageCode" id="no" value="${requestScope.languageCode}">
			    <div class="card-body">
			        <ul class="list-group list-group-flush">
			            <li class="list-group-item">
			            <textarea class="form-control" id="exampleFormControlTextarea1" name = "comment_content" rows="2" required="required"></textarea> <br>
			            <button type="submit" class="btn btn-primary" id="comment-create-btn">작성</button>
			            </li>
			        </ul>
			    </div>
		     </form>
		</div>
</div>
<br><br><br>
<br><br><br>