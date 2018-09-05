<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
당신의 가입 정보는....<br>
${memberDTO.id}, ${memberDTO.pw}, ${memberDTO.name}, ${memberDTO.tel}
<!-- Model model = new Model();
model.addAttribute("memberDTO", memberDTO); -->

</body>
</html>