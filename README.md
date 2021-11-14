# MOCO(모두의코딩)
<br>
<p align="center"><img src="https://user-images.githubusercontent.com/57327375/141688079-995a0c2f-1713-46bc-9f58-86900a9d1957.png" align="left"></p> <br>


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

## 🚀 프로젝트 개요
### MOCO(모두의 코딩) 란 ❓
- 
- 
- 

<br>

## :busts_in_silhouette: 팀원
-   [Cheoljin Kim](https://github.com/cheoljin408) : 메인개발자 및 팀장<br>
-   [sehee](https://github.com/Liiims) : 메인개발자
-   [nogy21](https://github.com/nogy21) : 메인개발자
-   [JinA](https://github.com/JinA-Kim-hub) : 메인개발자
-   [joonkb](https://github.com/Joonkb) : 메인개발자


<br>


### 📆개발기간

---

### 약 2주 (21.11.01 ~ 21.11.14)

<br>




## 📚 개발환경 및 적용기술 
<img src="https://img.shields.io/badge/java-v1.8-007396?logo=java"><br>
<img src="https://img.shields.io/badge/Apache Tomcat-v8.5-F8DC75?logo=Apache Tomcat"><br>
<img src="https://img.shields.io/badge/javascript-ES6+-F7DF1E?logo=javascript"><br>
<img src="https://img.shields.io/badge/git-v2.32.2-F05032?logo=git"><br>
<img src="https://img.shields.io/badge/Oracle-v11-F80000?logo=Oracle"><br>
<img src="https://img.shields.io/badge/HTML5-v5-E34F26?logo=HTML5"><br>
<img src="https://img.shields.io/badge/CSS3-v3-1572B6?logo=CSS3"><br>
<img src="https://img.shields.io/badge/Bootstrap-v4-7952B3?logo=Bootstrap"><br>
<img src="https://img.shields.io/badge/Eclipse IDE-v4-2C2255?logo=Eclipse IDE"><br>
<img src="http://img.shields.io/badge/-git-black?&logo=git"><br>
<img src="http://img.shields.io/badge/-github-black?&logo=github"><br>
<img src="http://img.shields.io/badge/-Sourcetree-blue?&logo=sourcetree"><br>
<img src="http://img.shields.io/badge/-notion-black?&logo=notion"><br>

<br>

### 📐개발 프로세스 및 설계
---
<details>
<summary>💶Usecase Diagram</summary>
<div markdown="1">

 ## 초기 계획 (UseCase Diagram)
 
![UseCaseDiagram1](https://user-images.githubusercontent.com/57327375/141687710-4e8e42e3-5abe-4bcd-b1d6-a2d49ba6c29a.png)
 
 <br>
 
 ## 2차 개발 (UseCase Diagram)
 
 ![UseCaseDiagram2](https://user-images.githubusercontent.com/57327375/141688003-613f820b-979d-4dc2-961a-a34ae99f86da.png)

</div>
</details>

<br>


 ## 비로그인 상태

1. 메인 페이지
   - 메인 페이지에서는 각 언어별 게시판을 조회한다.
   - 각 항목을 클릭하면 언어별 게시판 리스트가 조회된다.
2. 게시판
   - 게시판 리스트에서는 제목, 작성자(별명), 작성일자, 조회수가 보여진다.
   - 글 작성하기 버튼을 누르면 '로그인이 필요한 서비스입니다.' 알람 후 로그인 페이지로 이동한다.
   - 게시판에서 카테고리 버튼을 누르면 메인 페이지로 이동한다.
3. 회원가입
   - 회원가입을 할 때 이메일, 비밀번호, 별명, 깃허브 주소 정보를 입력한다.
   - 회원가입을 할 때 이메일 중복확인과 비밀번호 확인 기능이 제공된다.
4. 로그인
   - 비로그인 상태에서는 언어별 게시판을 방문할 수 있고, 게시판의 리스트 정보만 제공된다.
   - 로그인 버튼을 누르면 로그인 페이지로 이동한다.

## 로그인 상태

- 헤더 영역(공통)에는 사이트 로고와 로그인, 회원가입을 할 수 있는 버튼이 제공된다.
- 사용자가 로그인 하면 헤더 영역에는 로그인 폼 대신 회원닉네임, 마이페이지 링크, 로그아웃(링크)이 제공된다.

1. **메인 페이지**

   - 메인 페이지에서는 각 언어별 게시물을 조회한다.
   - 각 항목을 클릭하면 언어별 게시판 리스트(c, java, python, etc)가 조회된다.

2. **게시판**

   - 게시판 리스트에서는 제목, 작성자(별명), 작성일자, 조회수가 제공된다.

   - 게시판 리스트 상단부에는 카테고리 버튼, 글 작성하기 버튼이 제공된다.

   - 게시판에서 카테고리 버튼을 누르면 메인페이지(첫 페이지)로 이동한다.

   - 게시판의 게시물들은 최신 등록순으로 정렬되어 제공된다.

   - 사용자가 로그인을 하면 게시물 리스트의 제목 부분에 링크가 활성화 되어 클릭하면 상세보기가 제공된다.

   - 게시판은 페이징 처리가 된다.

   - 상세 게시물 정보는 제목, 작성자(별명), 작성일자 , 게시물 본문 내용, 조회수가 제공된다. 자신이 작성한 글(포스트)에 대해서만 삭제와 수정버튼이 제공된다.

   - 게시물을 작성하고 게시하면 게시판 리스트로 돌아간다.

   - 게시물 작성자는 댓글 중 베스트 답변을 채택할 수 있다.

     2-1.  **댓글작성**

     - 댓글을 작성하고 등록을 누르면 댓글이 등록되고, 등록된 댓글과 함께 게시물 글이 보여진다.
     - 댓글은 댓글 작성자(별명)와 작성일시가 표시된다.
     - 해당 댓글 작성자만 댓글을 수정할 수 있다.
     - 해당 글 작성자와 댓글 작성자가 댓글을 삭제할 수 있다.

3. **마이페이지**

   - 마이페이지에서 자신의 기본정보(이름, 깃허브주소, 별명) 를 조회할 수 있다.
   - 마이페이지에서 기본정보에 있는 수정버튼을 누르면 자신의 기본정보를 수정할 수 있다.
   - 질문정보 페이지에서는 랭킹, 내가 작성한 게시물, 채택수를 조회할 수 있다.

# 2차개발

- 카테고리 버튼 클릭 시 스크롤이 내려와서 각 언어 별 게시판으로 들어갈 수 있는 아이콘과 마이페이지로 이동할 수 있는 버튼을 조회할 수 있음
- 마이페이지에서 소스코드 테마를 선택할 수 있음
- 회원가입 시 가입축하 메일 전송
- 게시물 검색 기능 추가
- 게시글 스크랩 기능 추가

# 3차개발

- 소셜로그인 기능(카카오, 깃허브)



<br>

### ⚒️트러블 슈팅
---

<details>
<summary>표 펼치기/접기</summary>
<div markdown="1">
 <br>

| 이슈 내용                                                    | 해결 방안                                                    |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| 게시물 조회를 위한 BoardDAO 메소드 `getSearchPostList()`에서 sql 문장에 포함된(?) 에 field가 set이 안되어 `NullPointerException` 발생 | pstmt.setString(2, field) 로 set 해주지 않고 sql 문장에 field를 직접 넣어줌. 이유는 아직 알 수 없음 | 
|`게시물 조회` 시 검색 건수에는 문제가 없지만 검색 결과 일부가 보이지 않는 현상 발생| 게시물 조회를 위한 sql문장 중 rnum 이 순서대로 적용되어 있지 않아 페이징 처리가 안된 문제였음. 필요한 where 조건들을 `row_number() over(order by v.post_regdate desc) as rnum` 이 실행되기 전에 넣어줘야 rnum 이 잘  적용되어 나옴!!! |
 |`게시물 조회` 시 검색 건수에는 문제가 없지만 검색 결과 일부가 보이지 않는 현상 발생| 게시물 조회를 위한 sql문장 중 rnum 이 순서대로 적용되어 있지 않아 페이징 처리가 안된 문제였음. 필요한 where 조건들을 `row_number() over(order by v.post_regdate desc) as rnum` 이 실행되기 전에 넣어줘야 rnum 이 잘  적용되어 나옴!!! |
|댓글의 내용을 수정 할 경우 가장 상위에 있는 댓글의 입력폼이 변하여 해당 댓글을 수정 할 수 없는 문제가 발생하게됨, 다시 말하면 여러개의 댓글 중 수정하기 버튼을 누를경우 가장 상위에 있는 버튼의 입력폼이 수정할 수 있도록 변하게됨|<c:forEachitems="${requestScope.commentList}" var="comment"> JSTL 반목문을 수행하고 그 사이에서 태그들이 형성이 되기 때문이다. 따라서 그 사이의 태그들의 `id값`이 반복문을 돌더라고 하나의 값인 경우 맨 위에 있는 id 값만을 인식하지 못하는것이다. 따라서 댓글의 넘버를 통해서 id값을 분류하였고 이를 잘 활용함|
 |자기가 쓴 게시물에서 댓글을 달고 해당 댓글을 삭제하는 경우 해당 게시글이 삭제되는 경우가 발생됨 다른 게시물에서는 이런상황이 발생하지 않음 |  해당 이슈는 id 값이 중복되어 정의 되어있었음 (board/post-detail.jsp, comment.list.jsp)   → 비교적 구조가 간단한 board/post-detail.jsp 파일에서 id="deleteForm" → deletePostForm 으로 id 값을 변경해주었고 결과적으로 정상적으로 잘 동작함|
