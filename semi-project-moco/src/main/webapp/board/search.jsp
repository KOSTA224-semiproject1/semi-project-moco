<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 게시물 검색폼 --%>
<div class="container center-block pt-5 mt-3" style='width: 650px;'>
	<form action="SearchPostListPageController.do" onkeydown="onEnter()">
		<input type="hidden" name="languageCode" value="${requestScope.languageCode}">
		<div class="input-group mt-3 mb-3">
			<div class="input-group-prepend">
				<select class="form-control" name="f">
					<option class="dropdown-item" ${(param.f == "post_title")? "selected" : ""} value="post_title">제목</option>
					<option class="dropdown-item" ${(param.f == "nickname")? "selected" : ""} value="nickname">작성자</option>
				</select>
			</div>
			<input type="text" class="form-control" name="q" value="${param.q}" placeholder="검색어를 입력하세요">
			<div class="input-group-append">
				<button class="btn btn-primary" type="submit">검색</button>
			</div>
		</div>
	</form>
</div>
<%-- 게시물 검색폼 --%>

<div class="container" style="margin-top: 50px; padding: 0px 100px;">
	<div>
		<div style="display: inline-block;">
			<h3>${requestScope.language}게시판</h3>
		</div>
	</div>

	<div style="margin-bottom: 10px; display: flex;">
		<p style="text-align: center;">"${param.q}" 검색결과 [${fn:length(searchPostList)}건]</p>
		<div style="margin-left: auto;">
			<button type="button" class="btn btn-primary" onclick="moveToMainPage()">카테고리</button>
			<button type="button" class="btn btn-primary" onclick="moveToWritePage('${requestScope.languageCode}')">글쓰기</button>
		</div>
	</div>

	<table class="table table-hover table-striped" style="margin-top: 20px;">
		<thead>
			<tr style="background-color: #d0ebff">
				<th class="title">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.searchPostList}" var="post">
				<tr>
					<%-- 
							로그인한 상태이면 글제목에 링크를 부여해서 상세 글보기를 제공하고
							비로그인 상태이면 글제목만 제공한다
					 --%>
					<td>
						<c:choose>
							<c:when test="${sessionScope.mvo != null}">
								<a href="PostDetailPageController.do?postNo=${post.post_no}&languageCode=${languageCode}">${post.post_title}</a>
							</c:when>
							<c:otherwise>
								${post.post_title}
							</c:otherwise>
						</c:choose>
					</td>
					<td>${post.mvo.nickname}</td>
					<td>${post.post_regdate}</td>
					<td>${post.hits}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%-- 페이징 처리 --%>
	<ul class="pagination justify-content-center" style="margin: 20px 0">
		<c:if test="${pagingBean.previousPageGroup}">
			<li class="page-item"><a class="page-link" href="SearchPostListPageController.do?pageNo=${pagingBean.startPageOfPageGroup-1}">Previous</a></li>
		</c:if>
		<c:forEach begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}" var="page">
			<c:choose>
				<c:when test="${page == pagingBean.nowPage}">
					<li class="page-item active"><a class="page-link" href="SearchPostListPageController.do?pageNo=${page}&languageCode=${requestScope.languageCode}">${page}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="SearchPostListPageController.do?pageNo=${page}&languageCode=${requestScope.languageCode}">${page}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagingBean.nextPageGroup}">
			<li class="page-item"><a class="page-link" href="SearchPostListPageController.do?pageNo=${pagingBean.endPageOfPageGroup+1}">Next</a></li>
		</c:if>
	</ul>
</div>