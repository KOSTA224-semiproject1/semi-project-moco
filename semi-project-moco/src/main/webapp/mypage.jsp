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
<div class="container pt-5">
	<form action="ScrapListPageController.do" method="post">
    	<button class="btn btn-primary me-md-2">스크랩리스트</button>
	</form>
    <div class="media border p-3">
        <!-- <img src="img_avatar3.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;"> -->
       <c:choose>
            <c:when test="${sessionScope.rank.grade =='새내기'}">
                <img src="images/freshman.png">
            </c:when>
            <c:when test="${sessionScope.rank.grade=='헌내기'}">
                <img src="images/sophomore.png">
            </c:when>
            <c:when test="${sessionScope.rank.grade=='사망년'}">
                <img src="images/junior.png">
            </c:when>
            <c:when test="${sessionScope.rank.grade=='고인물'}">
                <img src="images/senior.png">
            </c:when>
            <c:when test="${sessionScope.rank.grade =='졸업자'}">
                <img src="images/graduatee.png">
            </c:when>
        </c:choose>
    <div class="media-body">
    <div class="card">
	  <div class="card-header"><b>회원정보</b></div>
	  <div class="card-body">
	       <label class="col-sm-3"><b>닉네임: </b></label> <c:out value="${sessionScope.loginMemberVO.nickname}" /> <br>
	       <label class="col-sm-3"><b>깃허브주소: </b></label> <c:out value="${sessionScope.loginMemberVO.github}" /> <br>
	       <label class="col-sm-3"><b>이메일: </b></label> <c:out value="${sessionScope.loginMemberVO.email}" /> <br>
	       <label class="col-sm-3"><b>레벨: </b></label>  <c:out value="${sessionScope.rank.grade}" /> <br> 
	  </div>
	</div>
    </div>
</div> <br> <br>
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
<div class="container">
		<table class="table table-hover table-bordered boardlist">
			<thead>
				<tr style="background-color: #d6f5d6">
					<th class="title">제목</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>언어</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sessionScope.postList}" var="pvo">
					<tr>
						<td><c:choose>
								<c:when test="${sessionScope.mvo != null}">
									<a
										href="PostDetailPageController.do?postNo=${pvo.post_no}&languageCode=${pvo.lvo.language_code}">${pvo.post_title}</a>
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
	</div>
</div>
<div>
	<form action="EditMyInfoController.do">
		<button type="submit" class="btn btn-primary">회원정보수정</button>
	</form>
</div>