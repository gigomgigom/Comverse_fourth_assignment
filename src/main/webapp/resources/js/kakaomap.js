/**
 * 
 * 
 */
$(window).on('load', function() {
	const firstBrId = $('.select_branch.active').attr('data-select');
	getBranchDetail(firstBrId);
});

function createMap(adr){
	var mapContainer = document.getElementById('map');
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	var geocoder = new kakao.maps.services.Geocoder();

	
	geocoder.addressSearch(adr, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
		}
	})
}
