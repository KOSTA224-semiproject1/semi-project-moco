<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container" style="margin-top: 50px; padding: 0px 100px;">
	<div>
		<div style="display: inline-block;">
			<h3>내 스크랩 목록</h3>
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
			<c:forEach items="${requestScope.scrapList}" var="post">
				<tr>
					<td>
						<a href="PostDetailPageController.do?postNo=${post.post_no}&languageCode=${languageCode}">${post.post_title}</a>
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
			<li class="page-item"><a class="page-link" href="ScrapListPageController.do?pageNo=${pagingBean.startPageOfPageGroup-1}">Previous</a></li>
		</c:if>
		<c:forEach begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}" var="page">
			<c:choose>
				<c:when test="${page == pagingBean.nowPage}">
					<li class="page-item active"><a class="page-link" href="ScrapListPageController.do?pageNo=${page}&languageCode=${requestScope.languageCode}">${page}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="ScrapListPageController.do?pageNo=${page}&languageCode=${requestScope.languageCode}">${page}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagingBean.nextPageGroup}">
			<li class="page-item"><a class="page-link" href="ScrapListPageController.do?pageNo=${pagingBean.endPageOfPageGroup+1}">Next</a></li>
		</c:if>
	</ul>
</div>