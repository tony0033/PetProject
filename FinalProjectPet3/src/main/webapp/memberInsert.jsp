<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Generic - Introspect by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	var idck = 0;
	
	$(function() {
		//idck 버튼을 클릭했을 때 
		$("#idck").click(function() {

			//id 를 param.
			var id = $("#id").val();

			$.ajax({
				async : true,
				type : 'POST',
				data : id,
				url : "idcheck.do",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
						alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
						//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputId").addClass("has-error")
						$("#divInputId").removeClass("has-success")

					} else {
						alert("사용가능한 아이디입니다.");
						//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputId").addClass("has-success")
						$("#divInputId").removeClass("has-error")
						//아이디가 중복하지 않으면  idck = 1 
						idck = 1;

					}
				},
				error : function(error) {

					alert("error : " + error);
				}
			});
		});
	});

	$(function() {
		$("#datepicker").datepicker();
		$("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
	});
</script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
				<a href="main.jsp">Home</a> <a href="memberLogin.jsp" id="loginout">Login</a><a
					href="generic.jsp">Generic</a> <a href="elements.jsp">Elements</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<section>
				<h3>회원가입</h3>
				<div class="table-wrapper">
					<form action="insert.do">
						<table class="alt">
							<tbody>
								<tr>
									<td>아이디</td>
									<td><input type="text" name="id" id="id"> <button
											type="button" class="button alt small" id="idCh">중복확인</button></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" name="pw"></td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td><input type="text" name="nickname"></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" name="name"></td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" name="address"></td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td><input type="text" name="tel"></td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input type="text" name="birth"><input
										type="hidden" name="pethospital" value="null"></td>

								</tr>

								<tr>
									<td colspan="2"><input type="submit" value="회원가입"
										class="alt"></td>
								</tr>
							</tbody>
							<tfoot>
							</tfoot>
						</table>
					</form>
				</div>
			</section>
		</div>
	</section>

	<!-- Footer -->
	<section id="footer">
		<div class="inner"></div>
	</section>
</body>
</html>