$(document).ready(function () {
	$('#download-excel').on('click', function() {
		downloadExcel();
	})
})

function pickDate(n) {
	const now = new Date();
	const nowYear = now.getFullYear();
	const nowMonth = now.getMonth();
	const nowDate = now.getDate();
	
	var startDate = new Date(nowYear, nowMonth, nowDate);
	var endDate = new Date(nowYear, nowMonth, nowDate);
	
	switch(n) {
		case 1:
			startDate.setDate(startDate.getDate()-7);
			break;
		case 12:
			startDate.setMonth(startDate.getMonth()-1);
			break;
		case 36:
			startDate.setMonth(startDate.getMonth()-3);
			break;
		case 2:
			startDate = new Date(nowYear, nowMonth, 1);
			endDate = new Date(nowYear, nowMonth+1, 0);
			break;
		case -1:
			startDate = new Date(nowYear, nowMonth-1, 1);
			endDate = new Date(nowYear, nowMonth, 0);
			break;
	}
	$('#dateFrom').val(startDate.toISOString().split('T')[0]);
	$('#dateTo').val(endDate.toISOString().split('T')[0]);
}

function downloadExcel() {
	const boCtg = $('#ctg').val();
	location.href='/admin/board/manage/' + boCtg + '/list/download-excel';
}