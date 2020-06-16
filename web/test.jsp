<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-05-29
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao 지도 시작하기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=835adee41e6cca987ac2e420ee6a1105&libraries=services,clusterer"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/polygon.css">
    <link rel="stylesheet" type="text/css" href="css/search.css">
</head>
<body>
<%--<%
    String test = "";
    JSONArray jsonArray = new JSONArray();
    JSONArray jsonArray2 = new JSONArray();

    try {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String connString =
                "jdbc:sqlserver://14.32.18.226:1433;database=YL;user=as;password=1234";
        conn = DriverManager.getConnection(connString);

        if(conn == null){
            test += "connection nullexception";
        }

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select TOP 60 ShopName, Latitude, Longititude, StreetNameAddress, Address, PhoneNumber, Url from Shop where StreetNameAddress like '%김포시%'");
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("title", rs.getString("ShopName"));
            obj.put("y", rs.getString("Latitude"));
            obj.put("x", rs.getString("Longititude"));
            obj.put("road_address_name", rs.getString("StreetNameAddress"));
            obj.put("address_name", rs.getString("Address"));
            obj.put("phone", rs.getString("PhoneNumber"));
            obj.put("detailpage", rs.getString("Url"));
//                    obj.put("id", rs.getString("id"));
            jsonArray.add(obj);
        }
        ResultSet rs2 = stmt.executeQuery("select TOP 60 ShopName, Latitude, Longititude, StreetNameAddress, Address, PhoneNumber, Url from Shop where StreetNameAddress like '%가평군%'");
        while (rs2.next()) {
            JSONObject obj = new JSONObject();
            obj.put("title", rs2.getString("ShopName"));
            obj.put("y", rs2.getString("Latitude"));
            obj.put("x", rs2.getString("Longititude"));
            obj.put("road_address_name", rs2.getString("StreetNameAddress"));
            obj.put("address_name", rs2.getString("Address"));
            obj.put("phone", rs2.getString("PhoneNumber"));
            obj.put("detailpage", rs2.getString("Url"));
//                    obj.put("id", rs.getString("id"));
            jsonArray2.add(obj);
        }
    } catch (Exception e){
        test += "아무거나";
    }
%>--%>
<%--<p><%=test%></p>--%>
<%--<p><%=jsonArray%></p>--%>
<%--<p><%=jsonArray2%></p>--%>
<%--<div id="map" style="width:1000px;height:600px;"></div>--%>
<input type="button" onclick="getjson('location/jeju.json', '제주도'), panTo(33.48892014636885, 126.49822643823065);" value="제주도">
<button onclick="hideMarkers()">마커 감추기</button>
<button onclick="showMarkers()">마커 보이기</button>
<button onclick="makemarkerjson(positions)">테스트</button>
<button onclick="displayPlaces(positions)">생성</button>
<div class="map_wrap">
    <div id="map" style="width:100%;height:500px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="긴급재난지원금" id="keyword" size="15">
                    <button type="submit">검색</button>
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script src="js/polygon.js" type="text/javascript"></script>
<script src="js/search.js" type="text/javascript"></script>
<script>
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center: new kakao.maps.LatLng(37.575616196731545, 126.97064623542911), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    });

    // 마커 클러스터러를 생성합니다
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 5 // 클러스터 할 최소 지도 레벨
    });
    var data = [
        {
            position: { y: 37.6453809380, x: 126.6268123819},
            text: 'hihi'
        },
        {
            position: { y: 37.6458944469, x: 126.6717733409},
            text: 'hihi2'
        }
    ];
    /*$.get("/city_mark_info/kimpo.json", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(data).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.y, position.x)
            });
        });

        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
    });*/

    $.get("city_mark_info/kimpo.json", function(data) {
        // console.log(data);
        var markers = $(data).map(function (each) {
            // console.log(data[each].x);
            // var position = each.x;
            // console.log(each.x);
            var marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(data[each].y, data[each].x)
            });
            kakao.maps.event.addListener(marker, 'click', function () {
                var content = '<div class="wrap">' +
                    '    <div class="info">' +
                    '        <div class="title">' +
                    data[each].place_name +
                    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
                    '        </div>' +
                    '        <div class="body">' +
                    '            <div class="desc">' +
                    '                <div class="ellipsis">' + data[each].road_address_name + '</div>' +
                    '                <div class="jibun ellipsis">' + data[each].address_name + '</div>' +
                    '                <div class="contact">' + data[each].phone + '</div>' +
                    '                <span class="ICON-middot"></span>' +
                    '                <div class="detail"><a href="'+ data[each].place_url +'" target="_blank" class="link">상세보기</a></div>' +
                    '                <span class="ICON-middot"></span>' +
                    '                <div class="searchdirections"><a href="https://map.kakao.com/link/to/'+ data[each].place_name + ',' + data[each].y + ',' + data[each].x +'" target="_blank" class="link">길찾기</a></div>' +
                    '            </div>' +
                    '        </div>' +
                    '    </div>' +
                    '</div>';
                infowindow.setContent(content);
                infowindow.open(map, marker);
                // info.setMap(map);
            });

            return marker;
        });
        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
    });

</script>
<script src="js/loaddata.js" type="text/javascript"></script>
</body>
</html>