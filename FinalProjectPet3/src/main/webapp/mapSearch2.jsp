<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- // 네이버 지도 - 특정 주소에 마커 표시 - web
// https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=geocoder -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 지도 API - 주소로 지도 표시하기</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=6q8NtRx8aBLV8lmz00Wd&submodules=geocoder"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: 400px;"></div>
	<script>	//주소 검색 기능
				var markers = [] //마커 배열
		var map = new naver.maps.Map('map', {
			center : 0,
			zoom : 9,
		}); //좌표로 장소 이동
	
		var hospitalAddr = '${hospitalAddr}'; //petHospital의 값을 가져옴
		var myaddress = JSON.parse(hospitalAddr); //JSON.parse()를 사용하여 문자열을 자바스크립트 객체로 변환
	
		
		var infoWindows = []; //정보창 배열
		// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		for (var j = 0; j < myaddress.display; j++) { //검색된 갯수만큼
			var addr = myaddress.items[j].address; //검색된 주소들
			var title = myaddress.items[j].title;
	console.log(title);
	console.log(addr);
			naver.maps.Service.geocode({
				address : addr
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
	
				
	
					// 마커 표시
					var marker = new naver.maps.Marker({
						position : myaddr, //마커를 표시할 위치
						map : map //마커를 표시할 지도
					});
					var contentString = [
						'<div class="iw_inner">',
						'   <h3>' + title+ '</h3>',
						'   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
						'       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
						'   </p>',
						'</div>'
					].join('');
	console.log(contentString);
					// 마크 클릭시 정보창
					var infoWindow = new naver.maps.InfoWindow({
						content : contentString
					});
	
					markers.push(marker); // 배열에 생성된 마커를 추가
					infoWindows.push(infoWindow); // 배열에 생성된 정보창을 추가
	
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
				for (var i = 0;  i < markers.length; i++) {
					naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
				}
			});
		}
	</script>
</body>
</html>
