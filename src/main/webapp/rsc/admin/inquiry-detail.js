$(document).ready(function () {
	
	
	//제출 이벤트 리스너
	$('#register-button').click(function() {
		const validateResult = validateData();
		if(validateResult.result) {
			submitData();
		} else {
			alert(validateResult.error.join(', ')+"에서 올바르지 않은 형식이 발견되었습니다.");
		}
	});
    function validateData() {		
		
		let result = true;
		let error = [];
		
		if($('#create-form [name="content"]').val() === '') {
			result = false;
			error.push('처리내용');
		}
		
		return {
			result, error
		}
	}
	function submitData() {
		const _csrf = $('#csrf').val();
		
		const form = $('#create-form')[0];
		const formData = new FormData(form);
		
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': _csrf
			}
		})
		
		$.ajax({
			url: '/admin/manage/general/one-to-one/create-inq-prog',
			type: 'POST',
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false,
			success: function() {
				alert('처리되었습니다.');
				location.reload();
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		})
	}
});

