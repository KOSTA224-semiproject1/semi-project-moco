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
	    <div class="container">
	    <div class="d-flex justify-content-center row">
	        <div class="col-md-8">
	        <!-- #E2E2E2 -->
	            <div class="d-flex flex-column comment-section" style="border-bottom:solid #E2E2E2">
	                <div class="bg-white p-2">
	                    <div class="d-flex flex-row user-info">
	                        <div class="d-flex flex-column justify-content-start ml-2" style="text-align: center"><span class="d-block font-weight-bold name" >${comment.mvo.nickname}</span><span class="date text-black-50">${comment.comment_regdate}</span></div>
	                    </div>
	                    <div class="mt-2">
	                        <p class="comment-text">${comment.comment_content}</p>
	                    </div>
	                </div>
	                <div class="bg-white">
	                    <div class="d-flex flex-row fs-12">
	                        <div class="like p-2 cursor"><i class="fa fa-thumbs-o-up"></i><span class="ml-1">Like</span></div>
	                        <div class="like p-2 cursor"><i class="fa fa-commenting-o"></i><span class="ml-1">Comment</span></div>
	                        <div class="like p-2 cursor"><i class="fa fa-share"></i><span class="ml-1">Share</span></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	</c:forEach>
	<%-- 댓글 작성 창 --%>
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