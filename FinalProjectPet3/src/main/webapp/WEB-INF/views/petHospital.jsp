<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="petHospital">
		동물 병원 검색할 지역 : <input type="text" name="petHospital"> <input
			type="submit" value="확인">
	</form>

	<c:forEach items="${petHospital}" var="test">
	${test}
	</c:forEach>

</body>
</html>