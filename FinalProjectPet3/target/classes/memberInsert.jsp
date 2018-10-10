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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					fullAddr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				if (data.userSelectedType === 'R') {
					//법정동명이 있을 경우 추가한다.
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('address').value = fullAddr;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('address2').focus();
			}
		}).open();
	}

	function checkValue() {
		var form = document.userInfo;

		if (!form.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (form.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}

		if (!form.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (form.password.value != form.passwordcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}

		if (!form.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}

		if (!form.tel.value) {
			alert("전화번호를 입력하세요.");
			return false;
		}

		if (isNaN(form.tel.value)) {
			alert("전화번호는 - 제외한 숫자만 입력해주세요.");
			return false;
		}

		if (!form.address.value) {
			alert("주소를 입력하세요.");
			return false;
		}
	}

	// 아이디 중복체크 화면open
	function openIdChk() {
		window.name = "parentForm";
		window.open("memberIdCheck.jsp",
			"chkForm", "width=500, height=300, resizable = no, scrollbars = no");
	}

	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
	// 다시 중복체크를 하도록 한다.
	function inputIdChk() {
		document.userInfo.idDuplication.value = "idUncheck";
	}
</script>
<style type="text/css">
#address, #address2 {
	width: 40%;
	display: inline;
}

#id {
	width: 85%;
	display: inline-block;
}
</style>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
				<%
					if (session.getAttribute("id") == null) {
				%>
				<a href="memberLogin.jsp" id="loginout">로그인</a>
				<%
					} else {
				%>
				<a href="memberLogout" id="loginout">로그아웃</a>
				<%
					}
				%>

				<a href="petHospital.jsp">동물병원 찾기</a><a href="bbs.jsp">게시판</a><a
					href="diarymain.jsp">일기</a> <a href="ProductSelect.jsp">쇼핑</a>
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
									<td><input type="text" name="id" id="id"
										onkeydown="inputIdChk()"> <input type="button"
										value="중복확인" onclick="openIdChk()" class="button alt small"> <input
										type="hidden" id="idDuplication" value="idUncheck"></td>
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
									<td><input type="text" name = "address" id="address" class="d_form std"
										placeholder="주소"> &nbsp&nbsp&nbsp <input type="text"
										id="address2" name = "address2" class="d_form" placeholder="상세주소"> <input
										type="button" onclick="sample6_execDaumPostcode()"
										value="우편번호 찾기" class="d_btn"></td>
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