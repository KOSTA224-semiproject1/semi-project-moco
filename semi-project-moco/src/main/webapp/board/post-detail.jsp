<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<h3>${requestScope.pvo.post_title}</h3>
</div>
<div>
	<p>${requestScope.pvo.post_content}</p>
</div>
<div>
	<p>${requestScope.pvo.post_code}</p>
</div>
<div>
	<p>${requestScope.pvo.post_regdate}</p>
</div>
<div>
	<p>${requestScope.pvo.mvo.nickname}</p>
</div>
<div>
	<p>${requestScope.pvo.hits}</p>
</div>