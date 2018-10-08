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
<title>Elements - Introspect by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=6q8NtRx8aBLV8lmz00Wd&submodules=geocoder"></script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
			<%if(session.getAttribute("id")==null){ %>
				<a href="memberLogin.jsp" id="loginout">로그인</a> 
				<%}
			else{  %>
				<a href="memberLogout" id="loginout">로그아웃</a>
				<% } %>
				
				<a
					href="petHospital.jsp">동물병원 찾기</a><a href="bbs.jsp">게시판</a><a
					href="diarymain.jsp">일기</a> <a href="ProductSelect.jsp">쇼핑</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<header class="major special">
				<section>
					<h1>동물병원 찾기</h1>
					<hr>
					<div id="map" style="width: 100%; height: 400px;"></div>
					<script>
						var map = new naver.maps.Map('map', {
							center : 0,
							zoom : 8
						}); //좌표로 장소 이동, map 띄우기
					
						var hospitalAddr = '${hospitalAddr}'; //petHospital의 값을 가져옴
						var myaddress = JSON.parse(hospitalAddr); //JSON.parse()를 사용하여 문자열을 자바스크립트 객체로 변환
					
						$.each(myaddress.items, function(i, items) {
							//myaddress.items의 배열 값들을 가져와서 쓰겠다.
							//i : index 값
							//items : 해당 인덱스가 가진 값
							//	ex) items.address , items.title ....
					
							//주소 검색 기능
							naver.maps.Service.geocode({ // 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
								address : items.address
							}, function(status, response) {
								if (status !== naver.maps.Service.Status.OK) {
									return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
								}
								var result = response.result;
								// 검색 결과 갯수: result.total
								// 첫번째 결과 결과 주소: result.items[0].address
								// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
								var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
					
								map.setCenter(myaddr); //지정한 좌표로 지도의 중심점을 설정
					
								var markers = [], //마커 배열
									infoWindows = []; //정보창 배열
					
								for (var i = 0; i < result.total; i++) {
									// 마커 표시
									var marker = new naver.maps.Marker({
										position : myaddr, //마커를 표시할 위치
										map : map //마커를 표시할 지도
									});
					
									var contentString = [
										'<div id="iw_inner">',
										'   <h3>' + items.title + '</h3>',
										'   <p>지번 주소 : ' + items.address + '<br />',
										'      도로명 주소 : ' + items.roadAddress + '<br />',
										'      전화 번호 : ' + items.telephone + '<br />',
										'      <a href="' + items.link + '" target="_blank">' + items.link + '</a>',
										'   </p>',
										'</div>'
									].join('');
					
									// 마크 클릭시 정보창
									var infoWindow = new naver.maps.InfoWindow({
										content : contentString,
										backgroundColor : "#fff",
										borderColor : "#758e26",
										borderWidth : 3,
										anchorSize : new naver.maps.Size(30, 30),
										anchorSkew : true,
										anchorColor : "#fff",
										pixelOffset : new naver.maps.Point(20, -20)
									});
					
									markers.push(marker); // 배열에 생성된 마커를 추가
									infoWindows.push(infoWindow); // 배열에 생성된 정보창을 추가
								}
								// 마커에 이벤트를 등록합니다.(updateMarkers)
								naver.maps.Event.addListener(map, 'idle', function() {
									updateMarkers(map, markers);
								});
					
								function updateMarkers(map, markers) {
									var mapBounds = map.getBounds(); //map의 좌표를 반환
									var marker,
										position;
					
									for (var i = 0; i < markers.length; i++) {
					
										marker = markers[i]
										position = marker.getPosition(); //지정 위치에 마커를 놓음
					
										if (mapBounds.hasLatLng(position)) { //객체의 좌표 내에 지정한 좌표가 있는지 확인
											showMarker(map, marker);
										} else {
											hideMarker(map, marker);
										}
									}
								}
					
								function showMarker(map, marker) { //좌표가 있다면 마커를 보여주세요
									if (marker.setMap()) return;
									marker.setMap(map);
								}
					
								function hideMarker(map, marker) { //좌표가 없다면 마커를 보여주지 마세요
									if (!marker.setMap()) return;
									marker.setMap(null);
								}
					
								// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
								function getClickHandler(seq) {
									return function(e) {
										var marker = markers[seq],
											infoWindow = infoWindows[seq];
					
										if (infoWindow.getMap()) { //정보창을 닫아라
											infoWindow.close();
										} else {
											infoWindow.open(map, marker); //정보창을 열어라
										}
									}
								}
					
					
								//클릭시 getClickHandler에서 발생한 이벤트를 받아 핸들러를 실행하는 리스너
								for (var i = 0; i < markers.length; i++) {
									naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
								}
							});
						})
					</script>
					<hr>
				</section>
				<section>
					<form action="petHospital">
						<h4>동물 병원 검색할 지역 :</h4>
						<div class="row">
							<div class="6u 12u$(xsmall)">
								<input type="text" name="petHospital">
							</div>
							<div class="6u$ 12u$(xsmall)">
								<input type="submit" value="확인" class="special">
							</div>
						</div>
					</form>
				</section>
			</header>
		</div>
	</section>


	<!-- Footer -->
	<section id="footer">
		<div class="inner">
			<header>
				<h2>Get in Touch</h2>
			</header>
			<form method="post" action="#">
				<div class="field half first">
					<label for="name">Name</label> <input type="text" name="name"
						id="name" />
				</div>
				<div class="field half">
					<label for="email">Email</label> <input type="text" name="email"
						id="email" />
				</div>
				<div class="field">
					<label for="message">Message</label>
					<textarea name="message" id="message" rows="6"></textarea>
				</div>
				<ul class="actions">
					<li><input type="submit" value="Send Message" class="alt" /></li>
				</ul>
			</form>
			<div class="copyright">
				&copy; Untitled Design: <a href="https://templated.co/">TEMPLATED</a>.
				Images <a href="https://unsplash.com/">Unsplash</a>
			</div>
		</div>
	</section>
</body>
</html>