<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
����� ������ �Ʒ��� �����ϴ�.
<table border="1" bordercolor="red">
			<tr>
				<td bgcolor="pink">���̵�</td>
				<td bgcolor="yellow">${memberDTO2.id}</td>
			</tr>
			<tr>
				<td bgcolor="pink">��й�ȣ</td>
				<td bgcolor="yellow">${memberDTO2.tel}</td>
			</tr>
			<tr>
				<td bgcolor="pink">�̸�</td>
				<td bgcolor="yellow">${memberDTO2.name}</td>
			</tr>
			<tr>
				<td bgcolor="pink">��ȭ��ȣ</td>
				<td bgcolor="yellow">${memberDTO2.tel}</td>
			</tr>
		</table>

<c:forEach items="${list}" var="n">
${n.id}, ${n.pw}
</c:forEach>


</body>
</html>