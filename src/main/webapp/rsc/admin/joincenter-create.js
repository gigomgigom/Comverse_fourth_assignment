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
		

		const phoneRegex = /^01[016789]-\d{3,4}-\d{4}$/;
		const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		
		let result = true;
		let error = [];
		
		if($('#create-form [name="name"]').val() === '') {
			result = false;
			error.push('제목');
		}
		if($('#create-form [name="birthDate"]').val() === '') {
			result = false;
			error.push('내용');
		}
		if($('#create-form [name="location"]').val() === '') {
			result = false;
			error.push('거주지역');
		}
		if($('#create-form [name="adr"]').val() === '') {
			result = false;
			error.push('주소');
		}
		if(!phoneRegex.test($('#create-form [name="tel"]').val())) {
			result = false;
			error.push('연락처');
		}
		if(!emailRegex.test($('#create-form [name="email"]').val())) {
			result = false;
			error.push('이메일')
		}
		if(!$('#agree-check').is(':checked')){
			result = false;
			error.push('개인정보 동의');
		}
		
		return {
			result, error
		}
	}
	function submitData() {
		const _csrf = $('#csrf').val();
		
		const form = $('#create-form')[0];
		const formData = new FormData(form);
		
		formData.append('agree', $('#agree-check').is(':checked'))
		
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': _csrf
			}
		})
		
		$.ajax({
			url: '/admin/manage/general/join-center/create-join-center',
			type: 'POST',
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false,
			success: function() {
				alert('정보가 생성되었습니다.');
				location.href="/admin/manage/general/join-center/list";
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		})
	}
});

