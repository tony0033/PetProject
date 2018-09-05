<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var items= new Array(${title});
	for (var i = 0; i < items.length; i++){
		document.write(items[i]);
	}
	
	
	<c:forEach items="${title}" var="title">
	document.write(${title});
	document.write(${address[i]});
	</c:forEach>
	document.write(${title[1]});
	document.write(${address[1]});
</script>
</body>
</html>