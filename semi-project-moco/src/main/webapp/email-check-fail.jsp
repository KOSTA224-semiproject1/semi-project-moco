<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email-fail</title>
</head>
<body>
	사용 불가능
	<script type="text/javascript">
		opener.document.getElementById("flag").value = "";
		function closePopup() {
			let idComp = opener.document.getElementById("email");
			idComp.value = "";
			idComp.focus();
			self.close();
		}
	</script>
</body>
</html>