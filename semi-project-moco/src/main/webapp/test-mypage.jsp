<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String themes[] = {"darcula", "dracula", "duotone-dark",
                        "eclipse", "duotone-light", "icecoder", 
                        "solarized", "tomorrow-night-bright", 
                        "tomorrow-night-eighties", "rubyblue", 
                        "pastel-on-dark", "neo", "twilight"};
%>
<div class="container" style="margin-top: 50px; padding: 0px 100px;">
	<div style="margin-bottom: 20px;">
		<div style="display: inline-block;">
			<h3>마이 페이지</h3>
		</div>
		<div style="display: inline-block; float: right;">
			<form action="EditMyInfoController.do">
				<button type="submit" class="btn btn-primary">회원정보 수정</button>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4 text-center">
			<div class="card">
				<div class="card-header">
					<b>${sessionScope.rank.grade}</b>
				</div>
				<c:choose>
					<c:when test="${sessionScope.rank.grade =='새내기'}">
						<img class="user_rank_img" src="images/freshman.png">
					</c:when>
					<c:when test="${sessionScope.rank.grade=='헌내기'}">
						<img class="user_rank_img" src="images/sophomore.png">
					</c:when>
					<c:when test="${sessionScope.rank.grade=='사망년'}">
						<img class="user_rank_img" src="images/junior.png">
					</c:when>
					<c:when test="${sessionScope.rank.grade=='고인물'}">
						<img class="user_rank_img" src="images/senior.png">
					</c:when>
					<c:when test="${sessionScope.rank.grade =='졸업자'}">
						<img class="user_rank_img" src="images/graduatee.png">
					</c:when>
				</c:choose>
				<div class="card-body">
					<button class="btn btn-primary" onclick="moveToScrapList()">나의
						스크랩 리스트</button>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="card">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><b>이메일</b></li>
					<li class="list-group-item">${sessionScope.mvo.email}</li>
					<li class="list-group-item"><b>닉네임</b></li>
					<li class="list-group-item">${sessionScope.mvo.nickname}</li>
					<li class="list-group-item"><b>깃허브 주소</b></li>
					<li class="list-group-item">${sessionScope.mvo.github}</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="container" style="margin-top: 50px; padding: 0px 100px;">
	<div>
		<h3>${sessionScope.mvo.nickname}님의 게시물</h3>
	</div>
	<table class="table table-hover table-striped"
		style="margin-top: 30px;">
		<thead>
			<tr style="background-color: #d0ebff">
				<th class="title">제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>언어</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sessionScope.postList}" var="pvo">
				<tr>
					<%-- 
							로그인한 상태이면 글제목에 링크를 부여해서 상세 글보기를 제공하고
							비로그인 상태이면 글제목만 제공한다
					 --%>
					<td><c:choose>
							<c:when test="${sessionScope.mvo != null}">
								<a href="PostDetailPageController.do?postNo=${pvo.post_no}&languageCode=${pvo.lvo.language_code}">${pvo.post_title}</a>
							</c:when>
							<c:otherwise>
								${pvo.post_title}
							</c:otherwise>
						</c:choose></td>
					<td>${pvo.post_regdate}</td>
					<td>${pvo.hits}</td>
					<td>${pvo.lvo.language}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%-- 페이징 처리 --%>
	<ul class="pagination justify-content-center" style="margin: 20px 0">
		<c:if test="${pagingBean.previousPageGroup}">
			<li class="page-item"><a class="page-link"
				href="MyPageController.do?pageNo=${pagingBean.startPageOfPageGroup-1}">Previous</a></li>
		</c:if>
		<c:forEach begin="${pagingBean.startPageOfPageGroup}"
			end="${pagingBean.endPageOfPageGroup}" var="page">
			<c:choose>
				<c:when test="${page == pagingBean.nowPage}">
					<li class="page-item active"><a class="page-link"
						href="MyPageController.do?pageNo=${page}">${page}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="MyPageController.do?pageNo=${page}">${page}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagingBean.nextPageGroup}">
			<li class="page-item"><a class="page-link"
				href="MyPageController.do?pageNo=${pagingBean.endPageOfPageGroup+1}">Next</a></li>
		</c:if>
	</ul>
	<table class="table">
            <tr>
                <td colspan="5">
                   <label><b>테마 설정하세요</b></label> &nbsp;  &nbsp;
                   <br><br>
<pre><textarea id = "editor" name="editor" rows="10">
#include <cstdio>
int main() {
    char s[100] = "String"; // String
    bool flag = true;
    for (int i=0; i < n; i++) {
        printf("%s",s);
        flag = false;
        while (flag) {
            char *p = null;
        }
    }
    return 0;
}
    </textarea></pre>
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
                <td colspan="5">
                    <%-- pre : db 에 저장된 글형식 그대로 표현  --%>
                </td>
            </tr>
        </table>
        <form action="ChangeThemaController.do" method="get">
            <select name="theme" required="required" data-width="auto">
                  <option value="">선택하세요</option>
                  <% for(int i = 0; i < themes.length; i++)  { %>
                      <option value="<%=themes[i] %>"><%=themes[i] %></option>
                  <% } %>
            </select>
            <button>수정하기</button>
        </form>
        <br><br><br>
</div>
<script>
	function moveToScrapList() {
		location.href = "ScrapListPageController.do";
	}
</script>