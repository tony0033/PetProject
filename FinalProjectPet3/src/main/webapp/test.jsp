<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>오픈 API v2 - 지도 생성</title>
    <!-- prevent IE6 flickering -->
    <script type="text/javascript">
        try {
            document.execCommand('BackgroundImageCache', false, true);
        } catch (e) {
        }
    </script>
    <script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=6q8NtRx8aBLV8lmz00Wd"></script>
</head>
<body>
<div id="testMap" style="border:1px solid #000; width:500px; height:400px; margin:20px;"></div>
<script type="text/javascript">
    var oPoint = new nhn.api.map.LatLng(37.5010226, 127.0396037);
    nhn.api.map.setDefaultPoint('LatLng');
    oMap = new nhn.api.map.Map('testMap', {
        point: oPoint,
        zoom: 10,
        enableWheelZoom: true,
        enableDragPan: true,
        enableDblClickZoom: false,
        mapMode: 0,
        activateTrafficMap: false,
        activateBicycleMap: false,
        minMaxLevel: [1, 14],
        size: new nhn.api.map.Size(500, 400)
    });
</script>
</body>
</html>