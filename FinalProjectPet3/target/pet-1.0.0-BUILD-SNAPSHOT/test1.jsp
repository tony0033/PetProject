<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>

<s:setDataSource
    url="jdbc:oracle:thin:@localhost:1521:xe"
    driver="oracle.jdbc.driver.OracleDriver"
    user="big"
    password="1234"
    var= "ds1"
    scope="page"/>
<s:query sql="select * from address" var="rs1" dataSource="${ds1}" />



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
    <c:forEach var="columnName" items="${rs1.columnNames}">
    <td>${columnName}</td>
    </c:forEach>
</tr>
<c:forEach var="i" items="${rs1.rowsByIndex}">
<tr>
    <c:forEach var="columnValue" items="${i}">
    <td>${columnValue}</td>
    </c:forEach>
</tr>
</c:forEach>
</table>
</body>
</html>