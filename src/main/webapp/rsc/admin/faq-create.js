$(document).ready(function () {
	$(function () {
	  bsCustomFileInput.init();
	});
	$('#expose-start-check').change(function () {
		if($(this).is(':checked')) {
			$('#expose-start').prop("disabled", false);
		} else {
			$('#expose-start').val(null);
			$('#expose-start').prop("disabled", true);
		}
	})
	$('#expose-end-check').change(function () {
		if($(this).is(':checked')) {
			$('#expose-end').prop("disabled", false);
		} else {
			$('#expose-end').val(null);
			$('#expose-end').prop("disabled", true);
		}
		
	})
	$('#submit-button').click(function() {
		submitForm();
	});
})
//입력한 내용으로 구성된 객체 생성
function submitForm() {
	
	const validate = validateForm();
	
	if(!validate.result) {
		const msg = validate.msgList.join(', ');
		alert('옳지 않은 형식 : ' + msg);
	} else {
		uploadData();
	}
	
}
//유효성 검사
function validateForm() {
	var result = true;
	var msgList = [];
	
	if($('#create-form [name=title]').val() === '') {
		result = false;
		msgList.push('제목');
	}
	if($('#create-form [name=content]').val() === '') {
			result = false;
			msgList.push('내용');
		}
	if($('#create-form [name=exposeStart]').val() !== '' && $('#create-form [name=exposeEnd]').val() !== '') {
		var exposeStart = new Date($('#create-form [name=exposeStart]').val());
		var exposeEnd = new Date($('#create-form [name=exposeEnd]').val());
		if(exposeStart > exposeEnd) {
			result = false;
			msgList.push('[시작일자, 종료일자]');
		}
	}
	return {
		result,
		msgList
	};
}
//폼 데이터 업로드
function uploadData() {
	const _csrf = $('#csrf').val();
	
	const form = $('#create-form')[0];	
	const formData = new FormData(form);
	
	$.ajaxSetup({
		headers: {
			'X-CSRF-TOKEN': _csrf
		}
	})
	$.ajax({
		url: '/admin/manage/general/faq/create-faq',
		type: 'POST',
		enctype: 'multipart/form-data',
		data: formData,
		processData: false,
		contentType: false,
		success: () => {
			alert('게시글이 생성되었습니다.');
			location.href='/admin/manage/general/faq/list'
		},
		error: (e) => {
			console.log('오류발생');
		}
	})
}