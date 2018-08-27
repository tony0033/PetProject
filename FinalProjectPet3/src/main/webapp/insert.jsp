<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="insert2.do">
		<table border="1" bordercolor="red">
			<tr>
				<td bgcolor="pink">아이디</td>
				<td bgcolor="yellow"><input type="text" name="id"></td>
			</tr>
			<tr>
				<td bgcolor="pink">비밀번호</td>
				<td bgcolor="yellow"><input type="text" name="pw"></td>
			</tr>
			<tr>
				<td bgcolor="pink">이름</td>
				<td bgcolor="yellow"><input type="text" name="name"></td>
			</tr>
			<tr>
				<td bgcolor="pink">전화번호</td>
				<td bgcolor="yellow"><input type="text" name="tel"></td>
			</tr>
		</table>
		<input type="submit" value="서버로 전송.">
	</form>
</body>
</html>