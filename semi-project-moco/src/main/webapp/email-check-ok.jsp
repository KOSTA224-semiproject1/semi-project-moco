<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email-ok</title>
</head>
<body>
	사용 가능
	<script type="text/javascript">
		opener.document.getElementById("flag").value="${param.email}";
		function closePopup() {
			opener.document.getElementById("pass").focus();
			self.close();
		}
	</script>
</body>
</html>