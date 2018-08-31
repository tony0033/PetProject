<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- // ���̹� ���� - Ư�� �ּҿ� ��Ŀ ǥ�� - web
// https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=geocoder
// ������ YOUR_CLIENT_ID�� ���ø����̼� ��Ͻ� �߱޵Ǵ� 20�ڸ� ���� �빮�ڿ� �ҹ��� �����Դϴ� ��) VagkBddrZ5JdHbcd5DfK (O)
// �� APIŰ (32������ ���� �ҹ��ڿ� ���� ����)�� ���Ұ� ��) f8a20b93f0bf315be90d4a35145ef0fa (X) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���̹� ���� API - �ּҷ� ���� ǥ���ϱ�</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=6q8NtRx8aBLV8lmz00Wd&submodules=geocoder"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: 400px;"></div>
	<script>
	
	/* var markerList = [];
		//�ּ� �˻� ���
		var marker */
				
				var map = new naver.maps.Map('map');	//��ǥ�� ��� �̵�
			var myaddress = [ '����Ư���� ���ϱ� ������5�� 3-1', '����Ư���� �߱� �ٻ굿 336-3 ������� 1��']; // ���θ� �ּҳ� ���� �ּҸ� ���� (�ǹ��� �Ұ�!!!!)
	/* 	for(var i = 0; i<2 ;i++){ 
			var addr = myaddress[i];						
			*/
			
			naver.maps.Service.geocode({
				address : myaddress
				
			}, function(status, response) {
				if (status !== naver.maps.Service.Status.OK) {
					return alert(myaddress + '�� �˻� ����� ���ų� ��Ÿ ��Ʈ��ũ ����');
				}
				var result = response.result;
				// �˻� ��� ����: result.total
				// ù��° ��� ��� �ּ�: result.items[0].address
				// ù��° �˻� ��� ��ǥ: result.items[0].point.y, result.items[0].point.x
				var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
	
	
	
				map.setCenter(myaddr); // �˻��� ��ǥ�� ���� �̵�
				
	
				for (var i = 0, ii = myaddress.length; i < ii; i++) {
				// ��Ŀ ǥ��
				var marker = new naver.maps.Marker({
					position : myaddr[i],
					map : map
				});
				}
				/* markerList.push(marker); */
				// ��Ŀ Ŭ�� �̺�Ʈ ó��
				naver.maps.Event.addListener(marker, "click", function(e) {
					if (infowindow.getMap()) {
						infowindow.close();
					} else {
						infowindow.open(map, marker);
					}
				});
				// ��ũ Ŭ���� ���������� ����
				var infowindow = new naver.maps.InfoWindow({
					content : '<h4> [���̹� �����ڼ���]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
				});
			});
 		/* }  */
		
	</script>
</body>
</html>
